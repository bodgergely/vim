import pywinauto
import typing as tp
import time

class AutoProcMon:
    def __init__(self):
        self.app = pywinauto.application.Application()
        self.app.start("C:\\deploy\\ProcessMonitor\\Procmon64.exe")

    def remove_include_filters(self):
        assert self.app['Process Monitor Filter'].exists(), "There is no 'Process Monitor Filter' window"
        to_remove = [item for item in self.app['Process Monitor Filter']['List1'].items() \
                if item.text() == "Include"]
        for item in to_remove:
            item.select()
            self.app['Process Monitor Filter']['Remove'].click()

    def add_path_begins_filters(self, filter_values: tp.List[str]):
        assert self.app['Process Monitor Filter'].exists(), "There is no 'Process Monitor Filter' window"

        self.app['Process Monitor Filter']['ComboBox1'].select("Path")
        self.app['Process Monitor Filter']['ComboBox2'].select("begins with")
        self.app['Process Monitor Filter']['ComboBox4'].select("Include")

        for val in filter_values:
            self.app['Process Monitor Filter']['ComboBox3'].type_keys('^a{BACKSPACE}')
            self.app['Process Monitor Filter']['ComboBox3'].type_keys(val)
            self.app['Process Monitor Filter']['Add'].click()

    def close_filters_window(self):
        assert self.app['Process Monitor Filter'].exists(), "There is no 'Process Monitor Filter' window"

        self.app['Process Monitor Filter']['Ok'].click()

    def click_capture_events_button(self):
        # Note that "button(2)" is the thin vertical divider between Open and Capture
        self.app['PROCMON_WINDOW_CLASS']['ToolBar'].button(3).click()

    def click_clear_display_button(self):
        self.app['PROCMON_WINDOW_CLASS']['ToolBar'].button(5).click()

    def save_events_to_disk(self, path: str, as_csv: bool = False):
        self.app['PROCMON_WINDOW_CLASS']['ToolBar'].button(1).click()
        assert self.app['SaveToFile'].exists()

        self.app['SaveToFile']['Events displayed using current filter'].click()
        if as_csv:
            self.app['SaveToFile']['Comma-Separated Values (CSV)'].click()
        else:
            self.app['SaveToFile']['Native Process Monitor Format (PML)'].click()

        self.app['SaveToFile']['Path:Edit'].set_edit_text(path)
        self.app['SaveToFile']['Ok'].click()

if __name__ == "__main__":
    proc_mon = AutoProcMon()

    # Process Monitor automatically opens the filters window on start up
    proc_mon.remove_include_filters()
    proc_mon.add_path_begins_filters([
        "C:\\Users\\Graham\\Downloads\\",
        "C:\\Users\\Graham\\AppData\\Local\\Temp\\"
    ])
    proc_mon.close_filters_window()

    # When the filters window is closed, capture events is automatically toggled on so turn it off
    time.sleep(1)

    proc_mon.click_capture_events_button()
    proc_mon.save_events_to_disk("C:\\deploy\\test.csv", as_csv=True)

