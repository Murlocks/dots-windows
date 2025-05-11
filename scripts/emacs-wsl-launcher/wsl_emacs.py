import sys
import subprocess
import os
import re

import win32gui


class WindowMgr:
    """Encapsulates some calls to the winapi for window management"""

    def __init__(self):
        """Constructor"""
        self._handle = None

    def find_window(self, class_name, window_name=None):
        """find a window by its class_name"""
        self._handle = win32gui.FindWindow(class_name, window_name)

    def _window_enum_callback(self, hwnd, wildcard):
        """Pass to win32gui.EnumWindows() to check all the opened windows"""
        if re.match(wildcard, str(win32gui.GetWindowText(hwnd))) is not None:
            self._handle = hwnd

    def find_window_wildcard(self, wildcard):
        """find a window whose title matches the wildcard regex"""
        self._handle = None
        win32gui.EnumWindows(self._window_enum_callback, wildcard)

    def set_foreground(self):
        """put the window in the foreground"""
        if self._handle and win32gui.IsWindow(self._handle):
            win32gui.SetForegroundWindow(self._handle)


def windows_to_wsl_path(windows_path):
    # Match any drive letter followed by a colon and replace with /mnt/lowercase_letter
    return re.sub(r"([A-Za-z]):", lambda m: f"/mnt/{m.group(1).lower()}", windows_path)


if __name__ == "__main__":
    # file_name = (
    #     '"' + sys.argv[1] + '"'
    #     if re.match(r"[A-Za-z]:", sys.argv[1]) or sys.argv[1].startswith("org-protocol")
    #     else os.path.abspath(sys.argv[1]).replace("\\", "/")
    #     # else windows_to_wsl_path(os.path.abspath(sys.argv[1]).replace("\\", "/"))
    # )
    file_name = windows_to_wsl_path(os.path.abspath(sys.argv[1]).replace("\\", "/"))

    wsl_path_prefix = "//wsl$/Ubuntu/"
    if file_name.startswith(wsl_path_prefix):
        file_name = file_name.replace(wsl_path_prefix, "/")

    command = " ".join(
        [
            "C:/Windows/System32/wsl.exe",
            "-d",
            "Ubuntu",
            "emacsclient",
            "-n",
            "-r",
            "-a emacs",
            "'" + file_name + "'",
        ]
    )
    subprocess.Popen(command, shell=True)

    w = WindowMgr()
    w.find_window_wildcard(".*Doom Emac")
    w.set_foreground()
