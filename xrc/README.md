.tmux
=====
Bindings
--------

tmux may be controlled from an attached client by using a key combination of a
prefix key, followed by a command key. This configuration uses `C-a` as a
secondary prefix while keeping `C-b` as the default prefix. In the following
list of key bindings:
  - `<prefix>` means you have to either hit <kbd>Ctrl</kbd> + <kbd>a</kbd> or <kbd>Ctrl</kbd> + <kbd>b</kbd>
  - `<prefix> c` means you have to hit <kbd>Ctrl</kbd> + <kbd>a</kbd> or <kbd>Ctrl</kbd> + <kbd>b</kbd> followed by <kbd>c</kbd>
  - `<prefix> C-c` means you have to hit <kbd>Ctrl</kbd> + <kbd>a</kbd> or <kbd>Ctrl</kbd> + <kbd>b</kbd> followed by <kbd>Ctrl</kbd> + <kbd>c</kbd>

This configuration uses the following bindings:

 - `<prefix> e` opens `~/.tmux.conf.local` with the editor defined by the
   `$EDITOR` environment variable (defaults to `vim` when empty)
 - `<prefix> r` reloads the configuration
 - `C-l` clears both the screen and the tmux history

 - `<prefix> C-c` creates a new session
 - `<prefix> C-f` lets you switch to another session by name

 - `<prefix> C-h` and `<prefix> C-l` let you navigate windows (default
   `<prefix> n` and `<prefix> p` are unbound)
 - `<prefix> Tab` brings you to the last active window

 - `<prefix> -` splits the current pane vertically
 - `<prefix> _` splits the current pane horizontally
 - `<prefix> h`, `<prefix> j`, `<prefix> k` and `<prefix> l` let you navigate
   panes ala Vim
 - `<prefix> H`, `<prefix> J`, `<prefix> K`, `<prefix> L` let you resize panes
 - `<prefix> <` and `<prefix> >` let you swap panes
 - `<prefix> +` maximizes the current pane to a new window

 - `<prefix> m` toggles mouse mode on or off

 - `<prefix> U` launches Urlview (if available)
 - `<prefix> F` launches Facebook PathPicker (if available)

 - `<prefix> Enter` enters copy-mode
 - `<prefix> b` lists the paste-buffers
 - `<prefix> p` pastes from the top paste-buffer
 - `<prefix> P` lets you choose the paste-buffer to paste from

Additionally, `copy-mode-vi` matches [my own Vim configuration][]

[my own Vim configuration]: https://github.com/gpakosz/.vim.git

Bindings for `copy-mode-vi`:

- `v` begins selection / visual mode
- `C-v` toggles between blockwise visual mode and visual mode
- `H` jumps to the start of line
- `L` jumps to the end of line
- `y` copies the selection to the top paste-buffer
- `Escape` cancels the current operation

Configuration
-------------

While this configuration tries to bring sane default settings, you may want to
customize it further to your needs. Instead of altering the `~/.tmux.conf` file
and diverging from upstream, the proper way is to edit the `~/.tmux.conf.local`
file.

Please refer to the default `~/.tmux.conf.local` file to know more about
variables you can adjust to alter different behaviors. Pressing `<prefix> e`
will open `~/.tmux.conf.local` with the editor defined by the `$EDITOR`
environment variable (defaults to `vim` when empty).

### Enabling the Powerline look

Powerline originated as a status-line plugin for Vim. Its popular eye-catching
look is based on the use of special symbols: <img width="80" alt="Powerline Symbols" style="vertical-align: middle;" src="https://cloud.githubusercontent.com/assets/553208/10687156/1b76dda6-796b-11e5-83a1-1634337c4571.png" />

To make use of these symbols, there are several options:

- use a font that already bundles those: this is e.g. the case of the
  [2.030R-ro/1.050R-it version][source code pro] of the Source Code Pro font
- use a [pre-patched font][powerline patched fonts]
- use your preferred font along with the [Powerline font][powerline font] (that
  only contains the Powerline symbols): [this highly depends on your operating
  system and your terminal emulator][terminal support]
- [patch your preferred font][powerline font patcher] by adding the missing
  Powerline symbols: this is the most difficult way and is no more documented in
  the [Powerline manual]


Then edit the `~/.tmux.conf.local` file (`<prefix> e`) and adjust the following
variables:

```
tmux_conf_theme_left_separator_main=''
tmux_conf_theme_left_separator_sub=''
tmux_conf_theme_right_separator_main=''
tmux_conf_theme_right_separator_sub=''
```
### Configuring the status line

Contrary to the first iterations of this configuration, by now you have total
control on the content and order of `status-left` and `status-right`.

Edit the `~/.tmux.conf.local` file (`<prefix> e`) and adjust the
`tmux_conf_theme_status_left` and `tmux_conf_theme_status_right` variables to
your own preferences.

This configuration supports the following builtin variables:

 - `#{battery_bar}`: horizontal battery charge bar
 - `#{battery_percentage}`: battery percentage
 - `#{battery_status}`: is battery charging or discharging?
 - `#{battery_vbar}`: vertical battery charge bar
 - `#{circled_session_name}`: circled session number, up to 20
 - `#{hostname}`: SSH aware hostname information
 - `#{hostname_ssh}`: SSH aware hostname information, blank when no SSH
   connection detected
 - `#{loadavg}`: load average
 - `#{pairing}`: is session attached to more than one client?
 - `#{prefix}`: is prefix being depressed?
 - `#{root}`: is current user root?
 - `#{synchronized}`: are the panes synchronized?
 - `#{uptime_d}`: uptime days
 - `#{uptime_h}`: uptime hours
 - `#{uptime_m}`: uptime minutes
 - `#{uptime_s}`: uptime seconds
 - `#{username}`: SSH aware username information
 - `#{username_ssh}`: SSH aware username information, blank when no SSH
   connection detected

### Accessing the macOS clipboard from within tmux sessions

[Chris Johnsen created the `reattach-to-user-namespace`
utility][reattach-to-user-namespace] that makes `pbcopy` and `pbpaste` work
again within tmux.

$ brew install reattach-to-user-namespace

Once installed, `reattach-to-usernamespace` will be automatically detected.

[Homebrew]: http://brew.sh/


