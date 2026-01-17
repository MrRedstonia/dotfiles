import tkinter as tk

def create_windowed_app():
    root = tk.Tk()
    root.title("System Prompt")
    
    root.geometry("1920x1080")
    
    root.configure(bg='black')
    
    frame = tk.Frame(root, bg='black')
    frame.pack(expand=True, fill='both')

    label = tk.Label(
        frame, 
        text="Are you sure you want to reboot the system into bios?", 
        fg="red", 
        bg="black", 
        font=("Helvetica", 38),
    )
    label.place(relx=0.5, rely=0.5, anchor="center")

    root.mainloop()

if __name__ == "__main__":
    create_windowed_app()
