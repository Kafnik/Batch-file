
@echo off
chcp 65001 >nul
title Управление ботами

:menu_bot
cls
echo =======================
echo       Меню ботов
echo =======================
echo 1. Запуск ботов
echo 2. Не откравать
echo 3. Выйти
echo =======================
choice /c 123 /n /m "Выберите действие"

if errorlevel 3 goto exit_program
if errorlevel 2 goto recrol
if errorlevel 1 goto run_bots
goto menu_bot

:run_bots
title Запуск ботов
cls
echo ========================
echo      Запуск ботов
echo ========================
echo 1. Бот Рандом
echo 2. Бот Угадай число
echo 3. Назад
echo ========================
choice /c 123 /n /m "Выберите действие"

if errorlevel 3 goto menu_bot
if errorlevel 2 goto bot1
if errorlevel 1 goto bot2 
goto run_bots

:bot1
start number.bat
goto run_bots

:bot2
start random.bat
goto run_bots

:exit_program
exit

:recrol
cls
start cmd /k curl ascii.live/rick
pause
goto recro