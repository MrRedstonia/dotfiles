#!/usr/bin/env python3
import gi
gi.require_version("Gtk", "4.0")
from gi.repository import Gtk, Gdk

class AudioOverlay(Gtk.Window):
    def __init__(self):
        super().__init__(title="Audio Overlay")
        self.set_decorated(False)
        self.set_default_size(220, 160)
        self.set_opacity(0.95)
        self.set_keep_above(True)
        self.set_resizable(False)
        self.set_gravity(Gdk.Gravity.NORTH_EAST)
        self.set_margin_top(50)
        self.set_margin_end(20)

        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10, margin_top=10)
        self.set_child(box)

        box.append(Gtk.Label(label="Audio Output:"))
        box.append(Gtk.Scale.new_with_range(Gtk.Orientation.HORIZONTAL, 0, 100, 1))

win = AudioOverlay()
win.connect("destroy", Gtk.main_quit)
win.present()
Gtk.main()
