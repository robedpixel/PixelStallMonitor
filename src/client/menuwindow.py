import tkinter
import requests
import datetime
from decimal import Decimal
from PIL import Image
from PIL import ImageTk
from io import BytesIO
import helperfunctions
from functools import partial
from tkinter import messagebox


class MenuWindow:
    # AUTHOR: Zhuoyan
    # appends a string in the form "Time: $time_start to $time_end" to the string passed in as an arguement
    def append_time(self, string: str, time_start: datetime.datetime,
                    time_end: datetime.datetime):
        time_start_formatted = time_start.strftime("%H:%M") + "h"
        time_end_formatted = time_end.strftime("%H:%M") + "h"
        string = string + "Time: " + time_start_formatted + " to " + time_end_formatted
        return string

    # AUTHOR: Zhuoyan
    # Returns a string containing all the food names and prices from a given json object
    def append_menu_string_from_json(self, string: str, json_data):
        for dict_entry in json_data:
            # round the food price to two decimal places
            food_price = Decimal(json_data[dict_entry]).quantize(
                Decimal(10)**-2)
            string = string + dict_entry + ": " + "$" + str(food_price) + "\n"
        return string

    # AUTHOR: Zhuoyan
    # Returns a list of buttons for program to generate
    def generate_menu_button_list(self, tk_frame):
        menu_button_list = list()
        PARAMS = {'id': self.stall_id}
        try:
            menu_request = requests.get('https://' + self.ip + ":" +
                                        str(self.port) +
                                        "/stallmonitor/get/stallmenu",
                                        verify=False,
                                        params=PARAMS)
        except:
            print("error")
            return
        menu_data = menu_request.json()

        # Loop counter to store current index position of button to generate
        temp_var = 0

        for entry in menu_data:
            menu_info = entry.get("stallmenu")
            start_time = datetime.datetime.strptime(entry.get("starttime"),
                                                    '%H:%M:%S').time()
            end_time = datetime.datetime.strptime(entry.get("endtime"),
                                                  '%H:%M:%S').time()
            menu_opening_days_list_raw = entry.get("openingdays")
            menu_name = entry.get("menuname")

            # Assume that menu is sold from Monday to Friday if database doesn't specify
            if menu_opening_days_list_raw is None:
                menu_opening_days = [0, 1, 2, 3, 4]
            else:
                menu_opening_days = menu_opening_days_list_raw['days']
            is_menu_open, error_occured = helperfunctions.is_menu_open_on_date(
                self.date[0], self.date[1], self.date[2], menu_opening_days)
            if self.bool_current_time:
                if is_menu_open and helperfunctions.check_current_time_between_set_times(
                        start_time, end_time, self.current_time):
                    if menu_name:
                        menu_button_text = menu_name
                    else:
                        menu_button_text = "Menu" + str(temp_var + 1)
                    menu_button_func = partial(
                        self.display_menu_button_onclick, temp_var)
                    menu_button = tkinter.Button(tk_frame,
                                                 text=menu_button_text,
                                                 command=menu_button_func)
                    menu_button_list.append(menu_button)
                    temp_var += 1
                else:
                    pass
            else:
                menu_name = entry.get("menuname")
                if menu_name:
                    menu_button_text = menu_name
                else:
                    menu_button_text = "Menu" + str(temp_var + 1)
                menu_button_func = partial(self.display_menu_button_onclick,
                                           temp_var)
                menu_button = tkinter.Button(tk_frame,
                                             text=menu_button_text,
                                             command=menu_button_func)
                menu_button_list.append(menu_button)
                temp_var += 1
        return menu_button_list

    # AUTHOR: Zhuoyan
    # Returns a tkinter label containing the time period that a menu will be sold in.
    def get_stall_time_label(self, tk_frame, start_time: datetime.datetime,
                             end_time: datetime.datetime, font_type: str,
                             font_colour: str):
        time_label_string = ""
        time_label_string = self.append_time(time_label_string, start_time,
                                             end_time)
        stall_time_label = tkinter.Label(tk_frame,
                                         text=time_label_string,
                                         font=font_type,
                                         fg=font_colour,
                                         anchor="e",
                                         justify="right")
        return stall_time_label

    # AUTHOR: Zhuoyan
    # Returns a tkinter label containing the menu names and prices of a stall.
    def get_stall_menu_label(self, tk_frame, menu_info, font_type: str,
                             font_colour: str):
        # display menu and food prices
        menu_string = ""
        menu_string = self.append_menu_string_from_json(menu_string, menu_info)
        # return label of all the food sold by stall
        stall_label = tkinter.Label(tk_frame,
                                    text=menu_string,
                                    font=font_type,
                                    fg=font_colour,
                                    anchor="e",
                                    justify="right")
        return stall_label

    # AUTHOR: Zhuoyan
    # Returns a string from a json containing the operating hours of the stall
    def get_operating_hours_string_from_json(self, json):
        string = ""
        for entry in json:
            string = string + entry + ": " + json[entry] + "\n"
        return string

    # AUTHOR: Zhuoyan
    def operating_hours_button_onclick(self, text: str):
        messagebox.showinfo("Operating hours", text)

    # AUTHOR: Zhuoyan
    def get_operating_hours_button(self, tk_frame):
        if self.stall_operating_hours is not None:
            operating_hours_string = self.get_operating_hours_string_from_json(
                self.stall_operating_hours)
            operating_hours_button_func = partial(
                self.operating_hours_button_onclick, operating_hours_string)
            operating_hours_button = tkinter.Button(
                tk_frame,
                text="Operating hours",
                command=operating_hours_button_func)
            return operating_hours_button
        else:
            return None

    # AUTHOR: Zhuoyan
    # Function takes in a list of integers denoting the days that a menu is sold and converts it into a
    # string of days
    def convert_weekday_list_to_string(self, list_of_weekdays):
        string = ""
        # Use a list to get the day from an integer
        conversion_list = [
            "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday",
            "Sunday"
        ]

        for i in range(len(list_of_weekdays)):
            if i == 0:
                string = conversion_list[list_of_weekdays[i]]
            else:
                string = string + "," + conversion_list[list_of_weekdays[i]]

        return string

    # AUTHOR: Zhuoyan
    def display_menu(self, id_in: int):
        self.canvas_text = self.background.create_text(
            self.background_width // 2.5,
            0,
            anchor="nw",
            fill=self.stall_font_colour,
            font=self.stall_font,
            text=self.menu_information_list[id_in][0].cget("text"))
        canvas_text_bounds = self.background.bbox(
            self.canvas_text)  # returns a tuple like (x1, y1, x2, y2)
        canvas_text_width = canvas_text_bounds[2] - canvas_text_bounds[0]
        canvas_text_height = canvas_text_bounds[3] - canvas_text_bounds[1]
        self.canvas_operating_days = self.background.create_text(
            self.background_width,
            canvas_text_height + 10,
            anchor="ne",
            fill=self.stall_font_colour,
            font=self.stall_font,
            text="Served on: " + self.convert_weekday_list_to_string(
                self.menu_information_list[id_in][3]))

        canvas_operating_days_bounds = self.background.bbox(
            self.canvas_operating_days)
        canvas_operating_days_width = canvas_operating_days_bounds[
            2] - canvas_operating_days_bounds[0]
        canvas_operating_days_height = canvas_operating_days_bounds[
            3] - canvas_operating_days_bounds[1]

        self.canvas_menu = self.background.create_text(
            self.background_width,
            canvas_text_height + canvas_operating_days_height + 40,
            anchor="ne",
            fill=self.stall_font_colour,
            justify="right",
            font=self.stall_font,
            text=self.menu_information_list[id_in][1].cget("text"))
        self.background.configure(scrollregion=self.background.bbox("all"))

        menu_image = helperfunctions.get_image(self.ip, self.port,
                                               self.stall_name,
                                               "stallposterfile")
        if menu_image:
            promotional_image_func = partial(
                self.promotional_image_button_onclick, menu_image)
            promotional_image_button = tkinter.Button(
                self.misc_info_frame,
                text="Stall Promotional Image",
                command=promotional_image_func)
            promotional_image_button.grid(row=0, column=0)

        if self.stall_operating_hours:
            operating_hours_button = self.get_operating_hours_button(
                self.misc_info_frame)
            operating_hours_button.grid(row=0, column=1)

        self.time_per_person = self.menu_information_list[id_in][2]

        calculate_waiting_time_button = tkinter.Button(
            self.waiting_time_frame,
            text="Calculate waiting time",
            command=self.calculate_waiting_time_button_onclick)
        calculate_waiting_time_button.grid(row=2, column=0, columnspan=2)

        number_of_persons_label = tkinter.Label(
            self.waiting_time_frame, text="Number of people waiting:")
        number_of_persons_label.grid(row=3, column=0)

        self.number_of_persons_input = tkinter.Entry(self.waiting_time_frame)
        self.number_of_persons_input.grid(row=3, column=1)

    # AUTHOR: Zhuoyan
    def display_menu_button_onclick(self, id_in: int):
        # clear rows
        for label in self.waiting_time_frame.grid_slaves():
            label.grid_forget()
        # clear canvas
        self.background.delete(self.canvas_text)
        self.background.delete(self.canvas_menu)
        self.background.delete(self.canvas_operating_days)
        # display the menu and time for that particular menu
        self.display_menu(id_in)

    # AUTHOR: Zhuoyan
    def calculate_waiting_time_button_onclick(self):
        # update label
        for label in self.waiting_time_frame.grid_slaves():
            if int(label.grid_info()["row"]) == 4:
                label.grid_forget()
        try:
            waiting_time = int(
                self.number_of_persons_input.get()) * self.time_per_person
            datetime_waiting_time = datetime.timedelta(seconds=waiting_time)
            hours, remainder = divmod(
                datetime_waiting_time.seconds +
                86400 * datetime_waiting_time.days, 3600)
            minutes, seconds = divmod(remainder, 60)
            waiting_time_label = tkinter.Label(
                self.waiting_time_frame,
                text="Time to wait: " + str(hours) + " hours " + str(minutes) +
                " minutes " + str(seconds) + " seconds")
        except:
            waiting_time_label = tkinter.Label(self.waiting_time_frame,
                                               foreground="red",
                                               text="invalid input")
        waiting_time_label.grid(row=4, column=0, columnspan=2)

    # AUTHOR: Zhuoyan
    def promotional_image_button_onclick(self, menu_image):
        window = tkinter.Toplevel()
        # display Menu Image
        self.promotional_image = ImageTk.PhotoImage(menu_image)

        frame = tkinter.Frame(window, width=400, height=400)
        frame.grid(row=0, column=0)
        canvas = tkinter.Canvas(frame, width=400, height=400)
        canvas.grid(row=0, column=0)

        # Create scrollbars and link to the canvas
        vertical_scroll_bar = tkinter.Scrollbar(frame,
                                                orient="vertical",
                                                command=canvas.yview)
        vertical_scroll_bar.grid(row=0, column=1, sticky='ns')
        canvas.configure(yscrollcommand=vertical_scroll_bar.set)

        horizontal_scroll_bar = tkinter.Scrollbar(frame,
                                                  orient="horizontal",
                                                  command=canvas.xview)
        horizontal_scroll_bar.grid(row=1, column=0, sticky='ew')
        canvas.configure(xscrollcommand=horizontal_scroll_bar.set)
        canvas.create_image(0, 0, image=self.promotional_image, anchor="nw")
        canvas.configure(scrollregion=canvas.bbox("all"))

    # AUTHOR: Zhuoyan
    # bool_current_time determines whether to display menus that are currently being sold
    def __init__(self, stall_name: str, date, current_time: datetime.datetime,
                 bool_current_time: bool, ip: str, port: int):
        self.time_per_person = 0
        self.stall_name = stall_name
        self.current_time = current_time
        self.date = date
        self.bool_current_time = bool_current_time
        self.ip = ip
        self.port = port
        self.window = tkinter.Toplevel()
        self.window.title(stall_name + ": menu")
        self.window.columnconfigure(0)
        self.window.rowconfigure(0)
        self.menu_information_list = list()

        try:
            r = requests.get('https://' + ip + ":" + str(port) +
                             "/stallmonitor/get/stalls",
                             verify=False)
        except:
            print("error")
            return
        json_data = r.json()
        # Find store id from name as well as relevant store information
        for stall_entry in json_data:
            if self.stall_name == stall_entry.get("name"):
                self.stall_operating_hours = stall_entry.get("operatinghours")
                self.stall_id = stall_entry.get("id")
                self.stall_font = stall_entry.get("font_type")
                if self.stall_font is None:
                    self.stall_font = "Times 10 bold"
                self.stall_font_colour = stall_entry.get("font_colour")
                if self.stall_font_colour is None:
                    self.stall_font_colour = "black"
                else:
                    # Check if font specified in database is a valid font
                    try:
                        testlabel = tkinter.Label(self.window,
                                                  text="testlabel",
                                                  fg=self.stall_font_colour)
                    except tkinter.TclError:
                        self.stall_font_colour = "black"
                self.stall_background = stall_entry.get("stallbackgroundfile")

                # Make frame for background
                self.background_frame = tkinter.Frame(self.window,
                                                      width=400,
                                                      height=600)
                self.background_frame.grid(row=2, column=0)

                # Make frame for buttons to display misc stall information (stall operating hours and promotional image
                self.misc_info_frame = tkinter.Frame(self.window, width=400)
                self.misc_info_frame.grid(row=0, column=0)

                if self.stall_background is not None:
                    # Create a background with the image specified in database for the frame
                    try:
                        menu_background_image = helperfunctions.get_image(
                            ip, port, stall_name, "stallbackgroundfile")
                        # Create background for window
                        self.window.menu_background_image_pil = ImageTk.PhotoImage(
                            menu_background_image)
                        self.background_width = self.window.menu_background_image_pil.width(
                        )
                        self.background = tkinter.Canvas(self.background_frame,
                                                         width=400,
                                                         height=400)
                        self.background.grid(row=0, column=0, sticky='news')

                        # Create scrollbars and link to the canvas
                        vertical_scroll_bar = tkinter.Scrollbar(
                            self.background_frame,
                            orient="vertical",
                            command=self.background.yview)
                        vertical_scroll_bar.grid(row=0, column=1, sticky='ns')
                        self.background.configure(
                            yscrollcommand=vertical_scroll_bar.set)

                        horizontal_scroll_bar = tkinter.Scrollbar(
                            self.background_frame,
                            orient="horizontal",
                            command=self.background.xview)
                        horizontal_scroll_bar.grid(row=2,
                                                   column=0,
                                                   sticky='ew')
                        self.background.configure(
                            xscrollcommand=horizontal_scroll_bar.set)

                        self.background.create_image(
                            0,
                            0,
                            image=self.window.menu_background_image_pil,
                            anchor="nw")

                        self.waiting_time_frame = tkinter.Frame(
                            self.background_frame)
                        self.waiting_time_frame.grid(row=3,
                                                     column=0,
                                                     columnspan=2)

                        break

                    # Create a blank canvas for the frame if any error occurs
                    except tkinter.TclError:
                        self.background_width = 400
                        self.background = tkinter.Canvas(self.background_frame,
                                                         width=400,
                                                         height=400)
                        self.background.grid(row=0, column=0, sticky='news')

                        # Create scrollbars and link to the canvas
                        vertical_scroll_bar = tkinter.Scrollbar(
                            self.background_frame,
                            orient="vertical",
                            command=self.background.yview)
                        vertical_scroll_bar.grid(row=0, column=1, sticky='ns')
                        self.background.configure(
                            yscrollcommand=vertical_scroll_bar.set)

                        horizontal_scroll_bar = tkinter.Scrollbar(
                            self.background_frame,
                            orient="horizontal",
                            command=self.background.xview)
                        horizontal_scroll_bar.grid(row=2,
                                                   column=0,
                                                   sticky='ew')
                        self.background.configure(
                            xscrollcommand=horizontal_scroll_bar.set)

                        self.waiting_time_frame = tkinter.Frame(
                            self.background_frame)
                        self.waiting_time_frame.grid(row=1,
                                                     column=0,
                                                     columnspan=2)

                        break

                # Create a blank canvas for the frame
                else:
                    self.background_width = 400
                    self.background = tkinter.Canvas(self.background_frame,
                                                     width=400,
                                                     height=400)
                    self.background.grid(row=0, column=0, sticky='news')

                    # Create scrollbars and link to the canvas
                    vertical_scroll_bar = tkinter.Scrollbar(
                        self.background_frame,
                        orient="vertical",
                        command=self.background.yview)
                    vertical_scroll_bar.grid(row=0, column=1, sticky='ns')
                    self.background.configure(
                        yscrollcommand=vertical_scroll_bar.set)

                    horizontal_scroll_bar = tkinter.Scrollbar(
                        self.background_frame,
                        orient="horizontal",
                        command=self.background.xview)
                    horizontal_scroll_bar.grid(row=2, column=0, sticky='ew')
                    self.background.configure(
                        xscrollcommand=horizontal_scroll_bar.set)

                    self.waiting_time_frame = tkinter.Frame(
                        self.background_frame)
                    self.waiting_time_frame.grid(row=3, column=0, columnspan=2)

                    break

        # Get stall menu information
        PARAMS = {'id': self.stall_id}
        try:
            menu_request = requests.get('https://' + ip + ":" + str(port) +
                                        "/stallmonitor/get/stallmenu",
                                        verify=False,
                                        params=PARAMS)
        except:
            print("error")
            return
        menu_data = menu_request.json()
        for entry in menu_data:
            menu_info = entry.get("stallmenu")
            start_time = datetime.datetime.strptime(entry.get("starttime"),
                                                    '%H:%M:%S').time()
            end_time = datetime.datetime.strptime(entry.get("endtime"),
                                                  '%H:%M:%S').time()
            menu_opening_days_list_raw = entry.get("openingdays")

            # If the menu opening days are not specified, assume that it is open from Monday to Friday
            if menu_opening_days_list_raw is None:
                menu_opening_days = [0, 1, 2, 3, 4]
            else:
                menu_opening_days = menu_opening_days_list_raw['days']

            is_menu_open, error_occured = helperfunctions.is_menu_open_on_date(
                self.date[0], self.date[1], self.date[2], menu_opening_days)
            time_per_person = int(entry.get("secondsperperson"))
            if bool_current_time:
                if is_menu_open and helperfunctions.check_current_time_between_set_times(
                        start_time, end_time, current_time):
                    stall_time_label = self.get_stall_time_label(
                        self.background, start_time, end_time, self.stall_font,
                        self.stall_font_colour)
                    stall_menu_label = self.get_stall_menu_label(
                        self.background, menu_info, self.stall_font,
                        self.stall_font_colour)

                    # Usage of tuple to store information from server before displaying
                    menu_information_tuple = (stall_time_label,
                                              stall_menu_label,
                                              time_per_person,
                                              menu_opening_days)
                    self.menu_information_list.append(menu_information_tuple)
                else:
                    pass
            else:
                stall_time_label = self.get_stall_time_label(
                    self.background, start_time, end_time, self.stall_font,
                    self.stall_font_colour)
                stall_menu_label = self.get_stall_menu_label(
                    self.background, menu_info, self.stall_font,
                    self.stall_font_colour)
                # Usage of tuple to store information from server before displaying
                menu_information_tuple = (stall_time_label, stall_menu_label,
                                          time_per_person, menu_opening_days)
                self.menu_information_list.append(menu_information_tuple)

        # create a frame and display menu buttons on it
        buttonframe = tkinter.Frame(self.window)
        buttonframe.grid(row=1, column=0)

        self.menu_button_list = list()
        self.menu_button_list = self.generate_menu_button_list(buttonframe)
        for entry in range(len(self.menu_button_list)):
            self.menu_button_list[entry].grid(row=0, column=entry)

        # print first menu information
        self.display_menu(0)
