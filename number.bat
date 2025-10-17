
@echo off 
chcp 65001 >nul
title Угодай число

:loop
echo [INFO] Загрузка. . . 
python guess_the_number_bot.py
echo [WARN] Бот Угодай число упал ! Перезапуск через 5 секунд... 
timeout /t 5 >nul
goto loop
