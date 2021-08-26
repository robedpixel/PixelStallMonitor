#AUTHOR: Zhuoyan
from tkinter import *
from tkinter import messagebox
from PIL import ImageTk, Image
tPerPerson = 3


def click():
    global e
    string = e.get()
    valid = False
    while not valid:
        try:
            no = int(string)
            t = no * tPerPerson
            messagebox.showinfo(
                "waiting time",
                "Estimated waiting time is " + str(t) + "minutes")
            valid = True

        except:
            messagebox.showinfo("Alert", "Wrong input,please enter a digit")
            break


main = Tk()
main.title("Canteen System")

imagel = ImageTk.PhotoImage(Image.open("/Users/gezhuangzhi/Pictures/photo.png"))
w = imagel.width()
h = imagel.height()
main.geometry("%dx%d+0+0" % (w, h))
bgimage = Label(main, image = imagel)
bgimage.pack(side='bottom', fill='both', expand='yes')

que_frame = Frame(bgimage,bg="yellow")
que_frame.pack(side=BOTTOM)


Label(que_frame, text= "Enter No. of pax queueing",bg="yellow").pack(side = LEFT)
e = Entry(que_frame)
e.pack(side = LEFT,fill=BOTH, expand=YES)
e.focus_set()

calButton = Button(que_frame, text="Calculate", command=click)
calButton.pack(side = LEFT,fill=BOTH, expand=YES)

main.mainloop()
