import curses
from curses.textpad import Textbox, rectangle

def on_key(self, ch):
    x = 4

    # ascii 32-126 (inclusive)
    if curses.ascii.isprint(ch):
        if len(self.value) < self.max_length:
            self.value = self.value[:x] + chr(ch) + self.value[x:]
            self.pos += 1

        elif ch == curses.KEY_LEFT:
            if x > 0:
                self.pos -= 1

        elif ch == curses.KEY_RIGHT:
            if x < len(self.value):
                self.pos += 1

        elif ch == curses.KEY_BACKSPACE:
            if x > 0:
                self.value = self.value[:x - 1] + self.value[x:]
                self.pos -= 1

        elif ch == curses.KEY_DC:
            if x < len(self.value):
                self.value = self.value[:x] + self.value[x + 1:]

        elif ch == curses.KEY_HOME:
            self.pos = 0

        elif ch == curses.KEY_END:
            self.pos = len(self.value)

        else:
            return False

        self.update()
        return True


def main():
    stdscr = curses.initscr()
    begin_x =  2
    begin_y = 2
    height = 8
    width = 54

    window = curses.newwin(height, width, begin_y, begin_x)
    window.addstr(0, 0, "Please type what you heard:")
    rectangle(window, 1, 0, 7, 50)
    text_box = Textbox(window)

    text_box.edit(on_key)
    message = text_box.gather()
    window.addstr(0, 40, message)


main()
