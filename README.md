webdriver-bash-binding

Very basic tool, which provides ability to run selenium tests with quite simple syntax, built totally on BASH

Example:

```
#!/usr/bin/env bash
./wd.sh start
sleep 1s
./wd.sh get "https://google.com"
sleep 2s
./wd.sh assertLocation "https://google.com"
sleep 1s
./wd.sh screenshot
sleep 1s
./wd.sh quit
```
