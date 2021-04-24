@echo OFF
mkdir %USERPROFILE%\AppData\Local\nvim\
mkdir %USERPROFILE%\AppData\Local\nvim\autoload\
mkdir %USERPRIFILE%\.aria2\
move init.vim %USERPROFILE%\AppData\Local\nvim\
curl -o %USERPROFILE%\AppData\Local\nvim\autoload\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
move aria2.conf %USERPROFILE%\.aria2\
