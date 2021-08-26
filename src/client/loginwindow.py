import configparser
import requests
import os.path
import tkinter
import socket
import stallwindow as StlWin


# AUTHOR: Elijah
# Returns a dictionary with server information
def get_server_information_from_file(filename: str):
    server_dict = dict()
    if os.path.isfile(filename):
        config = configparser.ConfigParser()
        config.read(filename)
        ip_str = config["SERVERS"]["ip"]
        port_int = int(config["SERVERS"]["port"])
        try:
            r = requests.get('https://' + ip_str + ":" + str(port_int) +
                             "/stallmonitor/get/status",
                             verify=False)
            if r.text == "True":
                print("server is up!")
                server_dict = {"ip": ip_str, "port": port_int}
                return server_dict
            else:
                return server_dict
        except:
            print('cannot connect to server')
    else:
        return server_dict


class LoginWindow:
    # AUTHOR: Elijah
    # connect button function
    def connect_to_server_onclick(self):
        ip_input = self.server_ip_entry.get()
        port_input = self.server_port_entry.get()
        inputaccepted = False

        # Validate inputs of both entry boxes
        try:
            socket.inet_pton(socket.AF_INET, ip_input)
            ip = ip_input
            inputaccepted = True
        except AttributeError:  # no inet_pton here, sorry
            try:
                socket.inet_aton(ip_input)
            except socket.error:
                print("invalid ip, please input a valid ip")
            if ip_input.count('.') == 3:
                ip_out = ip_input
                inputaccepted = True
            else:
                print("invalid ip, please input a valid ip")
                inputaccepted = False
        except socket.error:  # not a valid address
            print("invalid ip, please input a valid ip")

        if port_input.isdigit() == True:
            temp_int = int(port_input)
            if (temp_int >= 0) and (temp_int <= 65535):
                port = temp_int
                inputaccepted = True
            else:
                print("invalid port, please input a valid port")
        else:
            print("invalid port, please input a valid port")

        # If inputs are valid, attempt to connect to the server, open a stall selection window if successful
        if inputaccepted == True:
            try:
                r = requests.get('https://' + ip + ":" + str(port) +
                                 "/stallmonitor/get/status",
                                 verify=False)
                if (r.text == "True"):
                    print("connected!")
                    serverfound = True
                    if serverfound:
                        if self.window:
                            self.window.destroy()
                        StlWin.StallWindow(ip, port)
                else:
                    self.label.config(text='cannot connect to server')
            except:
                self.label.config(text='cannot connect to server')
        else:
            pass

    # AUTHOR: Elijah
    def __init__(self):
        # load server information from file if present
        ip = ""
        port = -1
        serverfound = False
        window = ""
        server_info = get_server_information_from_file("servers.ini")
        if server_info:
            ip = server_info.get("ip")
            port = server_info.get("port")
            serverfound = True
        # create new server connect window if cannot connect to server
        if serverfound == False:
            self.window = tkinter.Tk()
            # Set window title
            self.window.title("PixelStall: Connect to server")

            tkinter.Label(window, text="Server IP").grid(row=0)
            self.server_ip_entry = tkinter.Entry(window)
            self.server_ip_entry.grid(row=0, column=1)

            tkinter.Label(window, text="Port").grid(row=1)
            self.server_port_entry = tkinter.Entry(window)
            self.server_port_entry.grid(row=1, column=1)
            self.label = tkinter.Label(window,
                                       text="Cannot connect to server in file",
                                       fg="red")
            self.label.grid(columnspan=2)

            tkinter.Button(
                window,
                text="Connect!",
                command=self.connect_to_server_onclick).grid(columnspan=3)
            self.window.mainloop()
        if serverfound:
            if window:
                window.destroy()
            StlWin.StallWindow(ip, port)
