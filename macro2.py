import tkinter as tk
from pynput.keyboard import Controller, Key, Listener
import threading
import time


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
        self.master.geometry("110x120")
        self.master.configure(bg="#1C1C1C")
        self.pack()
        self.spam_thread = None
        self.keybind = "q"  # Initialize keybind attribute
        self.speed = 0.001  # Initialize speed attribute
        self.create_widgets()
    def create_widgets(self):
        self.settings_frame = tk.Frame(self, bg="#1C1C1C")
        self.settings_frame.pack(side="top", padx=5, pady=5)

        self.keybind_entry = tk.Entry(
            self.settings_frame,
            width=6,
            bg="#1C1C1C",
            fg="white",
            font=("Helvetica", 14),
            justify="center",
        )
        self.keybind_entry.insert(0, self.keybind)
        self.keybind_entry.pack(side="left")

        self.spam_enabled = tk.BooleanVar(value=True)  # Checkbox state
        self.spam_checkbox = tk.Checkbutton(
            self.settings_frame,
            variable=self.spam_enabled,
            onvalue=True,
            offvalue=False,
            bg="#1C1C1C",
            selectcolor="#1C1C1C",
            activebackground="#1C1C1C",
            activeforeground="white",
            font=("Helvetica", 14),
        )
        self.spam_checkbox.pack(side="left")

        self.speed_slider = tk.Scale(
            self,
            from_=0.001,
            to=0.1,
            resolution=0.001,
            orient="horizontal",
            length=250,
            fg="white",
            bg="#1C1C1C",
            sliderlength=20,
            font=("Helvetica", 14),
        )
        self.speed_slider.set(self.speed)
        self.speed_slider.pack(side="top", padx=5, pady=5)

        self.update_button = tk.Button(
            self,
            text="Update",
            command=self.update_settings,
            bg="#00B0FF",
            fg="black",
            padx=3,
            pady=1,
            bd=1,
            font=("Helvetica", 14),
        )
        self.update_button.pack(side="top", padx=5, pady=5)

        self.status_label = tk.Label(
            self,
            text="",
            bg="#1C1C1C",
            fg="white",
            font=("Helvetica", 14),
        )
        self.status_label.pack(side="top", padx=5, pady=5)

    def quit_application(self):
        if self.spam_thread is not None and self.spam_thread.is_alive():
            self.spam_thread.should_stop = True
            self.spam_thread.join()
        self.master.destroy()

    def toggle_spam(self):
        if self.spam_thread is None or not self.spam_thread.is_alive():
            self.spam_thread = SpamThread(self.speed)
            self.spam_thread.start()
            self.master.wm_attributes("-topmost", True)
            self.status_label.config(text="")
        else:
            self.spam_thread.should_stop = True
            self.spam_thread.join()
            self.spam_thread = None
            self.status_label.config(text="")
    def update_settings(self):
        self.keybind = self.keybind_entry.get()
        self.speed = self.speed_slider.get()
        self.status_label.config(text="")

    def on_press(self, key):
        try:
            if key.char == self.keybind:
                self.toggle_spam()
        except AttributeError:
            pass
root = tk.Tk()
root.configure(bg="#1C1C1C")
app = Application(master=root)
listener = Listener(on_press=app.on_press)
listener.start()
app.mainloop()
