import tkinter as tk
from pynput.keyboard import Controller, Key, Listener
import threading
import time

Keybind = input("Keybind: ").lower()

class SpamThread(threading.Thread):
    def __init__(self, speed):
        super().__init__()
        self.speed = speed
        self.should_stop = False
        self.keyboard = Controller()
    def run(self):
        while not self.should_stop:
            if app.spam_enabled.get():  # Check if spam is enabled
                for key in ["i", "o"]:
                    self.keyboard.press(key)
                    self.keyboard.release(key)
                    time.sleep(self.speed / 3)
            time.sleep(0.01)  # Wait between checks
class Application(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master, bg="#1C1C1C")
        self.master = master
        self.master.title("Kean Macro")
        self.master.geometry("330x57")
        self.master.configure(bg="#1C1C1C")
        self.pack()
        self.create_widgets()
        self.spam_thread = None
    def create_widgets(self):
        self.quit_button = tk.Button(
            self,
            text="Quit",
            command=self.quit_application,
            bg="#FF5252",
            fg="black",
            padx=3,
            pady=1,
            bd=1,
            font=("Helvetica", 14),
        )
        self.quit_button.pack(side="left", padx=5, pady=5)
        self.speed_slider = tk.Scale(
            self,
            from_=0.01,
            to=0.1,
            resolution=0.001,
            orient="horizontal",
            length=150,
            fg="white",
            bg="#1C1C1C",
        )
        self.speed_slider.pack(side="left", padx=5, pady=5)
        self.spam_enabled = tk.BooleanVar(value=True)  # Checkbox state
        self.spam_checkbox = tk.Checkbutton(
            self,
            text="Macro",
            variable=self.spam_enabled,
            onvalue=True,
            offvalue=False,
            bg="#1C1C1C",
            fg="white",
            selectcolor="#1C1C1C",
            activebackground="#1C1C1C",
            activeforeground="white",
            font=("Helvetica", 14),
        )
        self.spam_checkbox.pack(side="left", padx=5, pady=5)
    def quit_application(self):
        if self.spam_thread is not None and self.spam_thread.is_alive():
            self.spam_thread.should_stop = True
            self.spam_thread.join()
        self.master.destroy()
    def toggle_spam(self):
        if self.spam_thread is None or not self.spam_thread.is_alive():
            speed = self.speed_slider.get()
            self.spam_thread = SpamThread(speed)
            self.spam_thread.start()
            self.master.wm_attributes("-topmost", True)
        else:
            self.spam_thread.should_stop = True
            self.spam_thread.join()
            self.spam_thread = None
def on_press(key):
    try:
        if key.char == Keybind:
            app.toggle_spam()
    except AttributeError:
        pass
root = tk.Tk()
root.configure(bg="#1C1C1C")
app = Application(master=root)
listener = Listener(on_press=on_press)
listener.start()
app.mainloop()
