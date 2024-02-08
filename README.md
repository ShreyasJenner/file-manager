A file manager using bash

### Usage

| Key Bindings | Function |
| --- | --- |
| j | move down |
| k | move up |
| h | move left |
| l | move right |
| G | last item in list |
| g | first item in list |
| backspace | go to parent directory |

#### Sourcing
Since script is executed in a sub shell, it must be sourced for changing directories to actually work

Run the config script with sudo to add a symbolic link to main.sh in the /usr/local/bin directory and add an alias that automatically sources main.sh
<br>
OR
<br>
- Create a soft link to main.sh in /usr/bin or /usr/local/bin
- Manually add an alias to your shell's configuration file in the below format :
<br>
```
alias <youralias>='. <softlink>'
```



### To-Do:
- [x] Implement basic file manager
- [x] support for basic color to diff b/w dirs and files
- [x] support for toggling display of hidden files
- [ ] support for search

### Bugs
- non-english characters seem to cause malloc errors (size issues??)
- special sybmols aren't rendered correctly
