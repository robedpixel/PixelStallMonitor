import requests
import tkinter
from PIL import Image
from io import BytesIO
import datetime
from decimal import Decimal
from functools import partial

# This .py file contains functions shared between multiple window types in the stall monitor program


# AUTHOR: Clarissa
# Get menu as an image if provided by stall
def get_image(ip: str, port: int, stall_name: str, image_type: str):
    PARAMS = {'name': stall_name, 'imagename': image_type}
    try:
        r = requests.get('https://' + ip + ":" + str(port) +
                         "/stallmonitor/get/stallimage",
                         verify=False,
                         params=PARAMS)
    except:
        print("error")
        return
    # get image from response form and display it
    if r.status_code == 200:
        image_data = Image.open(BytesIO(r.content))
        return image_data
    else:
        return None


# AUTHOR: Clarissa
# Checks if a menu will be sold on a specific weekday
def is_menu_open_on_date(day, month, year, list_opening_days):
    store_is_open = False
    error_occured = False
    try:
        Date = datetime.date(year, month, day).weekday()
        for i in list_opening_days:
            if Date == i:
                store_is_open = True
    except:
        error_occured = True
    return store_is_open, error_occured


# AUTHOR: Clarissa
# Returns boolean value for if a common value such as "if current_time is between 11am and 11pm"
# or an uncommon value such as "if current_time is between 11am to 4am the next day"
def check_current_time_between_set_times(start_time, end_time, current_time):
    if start_time < end_time:
        return start_time < current_time < end_time
    else:
        return not (start_time < current_time < end_time)
