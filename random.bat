
@echo off 
chcp 65001 >nul
title Рандом бот

:loop
echo [INFO] Загрузка... 
python random_bot.py
echo [WARN] Бот Рандома упал ! Перезапуск через 5 секунд... 
timeout /t 5 >nul
goto loop