import tkinter
import requests
import datetime
from functools import partial
import helperfunctions
import menuwindow as MnWin
from tkinter import messagebox


# AUTHOR: Elijah
# Clears a grid column in the given tkinter frame/window
def clear_stallwindow_column(tk_frame, column_number: int):
    for label in tk_frame.grid_slaves():
        if int(label.grid_info()["column"]) == column_number:
            label.grid_forget()


# AUTHOR: Elijah
# Returns a list of buttons to open the menu(s) for a stall
# Date is a tuple of ints in the format (day,month,year)
def get_stallbutton_list(
        tk_frame,
        date,
        time: datetime.datetime,
        check_time: bool,
        ip: str,
        port: int,
):

    stallbuttonlist = list()

    # get new stall list
    try:
        r = requests.get('https://' + ip + ":" + str(port) +
                         "/stallmonitor/get/stalls",
                         verify=False)
    except:
        print("error")
        return
    stallinfo_data = r.json()
    if check_time:
        requesterror = True
        error = 0
        stallmenu_data = list()

        # request stall menus from server, retry for at least 3 times if request fails
        while error < 3:
            try:
                stallmenu_request = requests.get(
                    'https://' + ip + ":" + str(port) +
                    "/stallmonitor/get/stallmenu/all",
                    verify=False,
                )
                stallmenu_data = stallmenu_request.json()
                requesterror = False
                break
            except:
                error += 1
        if requesterror == False:
            for stallentry in stallinfo_data:
                stallname = stallentry.get("name")
                stallid = stallentry.get("id")
                stallopen = False
                error_occurred = False
                for stallmenu_entry in stallmenu_data:
                    if stallid == stallmenu_entry.get("id"):
                        # get time period of menu, display stall if it has menu in current time period
                        start_time = datetime.datetime.strptime(
                            stallmenu_entry.get("starttime"),
                            '%H:%M:%S').time()
                        end_time = datetime.datetime.strptime(
                            stallmenu_entry.get("endtime"), '%H:%M:%S').time()

                        stall_opening_days_list_raw = stallmenu_entry.get(
                            "openingdays")
                        if stall_opening_days_list_raw is None:
                            stall_opening_days = [0, 1, 2, 3, 4]
                        else:
                            stall_opening_days = stall_opening_days_list_raw[
                                'days']
                        stall_onday_open, error_occurred = helperfunctions.is_menu_open_on_date(
                            date[0], date[1], date[2], stall_opening_days)
                        if stall_onday_open and helperfunctions.check_current_time_between_set_times(
                                start_time, end_time, time):
                            stallopen = True

                if stallopen == True:
                    # Create button to get stall menu and load it into the list of buttons
                    menu_with_arg = partial(MnWin.MenuWindow, stallname, date,
                                            time, check_time, ip, port)
                    stallbuttonentry = tkinter.Button(tk_frame,
                                                      text=stallname,
                                                      command=menu_with_arg)
                    stallbuttonlist.append(stallbuttonentry)
            return stallbuttonlist
        else:
            return None

    # Display all stalls if user does not want to filter based on date and time
    else:
        current_time = datetime.datetime.now().time()
        requesterror = True
        error = 0
        stallmenu_data = list()

        # request stall menus from server, retry for at least 3 times if request fails
        while error < 3:
            try:
                stallmenu_request = requests.get(
                    'https://' + ip + ":" + str(port) +
                    "/stallmonitor/get/stallmenu/all",
                    verify=False,
                )
                stallmenu_data = stallmenu_request.json()
                requesterror = False
                break
            except:
                error += 1
        if requesterror == False:
            for stallentry in stallinfo_data:
                stallname = stallentry.get("name")
                stallid = stallentry.get("id")
                for stallmenu_entry in stallmenu_data:
                    if stallid == stallmenu_entry.get("id"):
                        menu_with_arg = partial(MnWin.MenuWindow, stallname,
                                                date, current_time, check_time,
                                                ip, port)
                        stallbuttonentry = tkinter.Button(
                            tk_frame, text=stallname, command=menu_with_arg)
                        stallbuttonlist.append(stallbuttonentry)
                        break
                    else:
                        pass
            return stallbuttonlist
        else:
            return None


class StallWindow:
    # AUTHOR: Elijah
    def time_check_current_time_box_onclick(self):
        if self.time_check_current_time_box_var.get() == 1:
            self.time_check_user_input_box.config(state="disabled")
            clear_stallwindow_column(self.window, 3)
        else:
            self.time_check_user_input_box.config(state="normal")
            clear_stallwindow_column(self.window, 3)

    # AUTHOR: Elijah
    def time_check_user_input_box_onclick(self):
        if self.time_check_user_input_box_var.get() == 1:
            self.time_check_current_time_box.config(state="disabled")
            clear_stallwindow_column(self.window, 3)
        else:
            self.time_check_current_time_box.config(state="normal")
            clear_stallwindow_column(self.window, 3)

    # AUTHOR: Elijah
    def search_stall_button_onclick(self):

        # clear list of stalls to display
        stallbuttonlist = list()
        clear_stallwindow_column(self.window, 3)
        stalllabel = tkinter.Label(self.window, text="Stalls:")
        stalllabel.grid(column=3, row=0)
        if self.time_check_current_time_box_var.get() == 1:
            date_and_time = datetime.datetime.now()
            # Store the current date as a tuple
            date = (date_and_time.day, date_and_time.month, date_and_time.year)
            time = date_and_time.time()
            stallbuttonlist = get_stallbutton_list(self.window, date, time,
                                                   True, self.ip, self.port)
            for i in range(len(stallbuttonlist)):
                stallbuttonlist[i].grid(column=3, row=(1 + i), sticky='ew')
        elif self.time_check_user_input_box_var.get() == 1:

            # Attempt to get integer input from date and time entry boxes
            try:
                # Store the date input by user as a tuple
                date = (int(self.date_day_inputbox_var.get()),
                        int(self.date_month_inputbox_var.get()),
                        int(self.date_year_inputbox_var.get()))
            except:
                messagebox.showinfo("Alert",
                                    "Invalid number input for Date or Time")
                return
            # Check if date and time input is valid
            try:
                time = datetime.datetime.strptime(self.time_inputbox_var.get(),
                                                  '%H:%M').time()
                Date = datetime.date(date[2], date[1], date[0])
            except:
                messagebox.showinfo("Alert",
                                    "Invalid number input for Date or Time")
                return

            stallbuttonlist = get_stallbutton_list(self.window, date, time,
                                                   True, self.ip, self.port)
            for i in range(len(stallbuttonlist)):
                stallbuttonlist[i].grid(column=3, row=(1 + i), sticky='ew')
        else:
            # display all stalls
            date_and_time = datetime.datetime.now()
            date = (date_and_time.day, date_and_time.month, date_and_time.year)
            current_time = date_and_time.time()
            stallbuttonlist = get_stallbutton_list(self.window, date,
                                                   current_time, False,
                                                   self.ip, self.port)
            for i in range(len(stallbuttonlist)):
                stallbuttonlist[i].grid(column=3, row=(1 + i), sticky='ew')

    # AUTHOR: Elijah
    def __init__(self, ip: str, port: int):
        self.ip = ip
        self.port = port
        self.window = tkinter.Tk()
        # to rename the title of the window
        self.window.title("PixelStall")
        # initialise component
        self.time_check_current_time_box_var = tkinter.IntVar()

        self.time_check_current_time_box = tkinter.Checkbutton(
            self.window,
            text="Get Menus based on current Date and Time",
            variable=self.time_check_current_time_box_var,
            command=self.time_check_current_time_box_onclick)

        # initialise component
        self.time_check_user_input_box_var = tkinter.IntVar()

        self.time_check_user_input_box = tkinter.Checkbutton(
            self.window,
            text="Get Menus based on set Date and Time",
            variable=self.time_check_user_input_box_var,
            command=self.time_check_user_input_box_onclick)

        # initialise time entry component
        self.time_frame = tkinter.Frame(self.window)
        time_inputbox_label = tkinter.Label(self.time_frame,
                                            text="Time(HH:MM):")
        self.time_inputbox_var = tkinter.StringVar()
        self.time_inputbox = tkinter.Entry(self.time_frame,
                                           textvariable=self.time_inputbox_var)
        # initialise date entry components
        self.date_frame = tkinter.Frame(self.window)
        self.date_label = tkinter.Label(self.date_frame,
                                        text="Date:(DD-MM-YYYY):")
        self.date_label_2 = tkinter.Label(self.date_frame, text="-")
        self.date_label_3 = tkinter.Label(self.date_frame, text="-")
        self.date_day_inputbox_var = tkinter.StringVar()
        self.date_day_inputbox = tkinter.Entry(
            self.date_frame, textvariable=self.date_day_inputbox_var)
        self.date_month_inputbox_var = tkinter.StringVar()
        self.date_month_inputbox = tkinter.Entry(
            self.date_frame, textvariable=self.date_month_inputbox_var)
        self.date_year_inputbox_var = tkinter.StringVar()
        self.date_year_inputbox = tkinter.Entry(
            self.date_frame, textvariable=self.date_year_inputbox_var)
        stallbuttonlist = list()

        self.search_stall_button = tkinter.Button(
            self.window,
            text="Search Stalls",
            command=self.search_stall_button_onclick)
        self.search_stall_button.grid(row=0, column=0)
        self.time_check_current_time_box.grid(row=1, column=0)
        self.time_check_user_input_box.grid(row=2, column=0)

        time_inputbox_label.pack(side=tkinter.LEFT)
        self.time_inputbox.pack(side=tkinter.LEFT)
        self.time_frame.grid(row=3, column=0)

        self.date_label.grid(row=0, column=0)
        self.date_day_inputbox.grid(row=0, column=1)
        self.date_label_2.grid(row=0, column=2)
        self.date_month_inputbox.grid(row=0, column=3)
        self.date_label_3.grid(row=0, column=4)
        self.date_year_inputbox.grid(row=0, column=5)
        self.date_frame.grid(row=4, column=0, columnspan=2)
        self.window.mainloop()
