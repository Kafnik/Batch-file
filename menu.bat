@echo off
chcp 65001 >nul
title Управление ботами

:menu_bot
cls
echo =======================
echo     Главное меню
echo =======================
echo 1. Запуск програм
echo 2. Не откравать
echo 3. Экстренное отколючение
echo 4. Выйти
echo =======================
choice /c 1234 /n /m "Выберите действие"

if errorlevel 4 goto exit_program
if errorlevel 3 goto emergency
if errorlevel 2 goto recrol
if errorlevel 1 goto run_bots
goto menu_bot

rem Тут надо поменять название программ чтобы было все покрасоте

:run_bots
title Запуск ботов
cls
echo ========================
echo      Запуск программы
echo ========================
echo 1. Бот Рандом
echo 2. Бот Угадай число
echo 3. Назад
echo ========================
choice /c 1234 /n /m "Выберите действие"

if errorlevel 3 goto menu_bot
if errorlevel 2 goto bot1
if errorlevel 1 goto bot2

goto run_bots

rem Тут надо поменять название батников на которое вы написали

:bot1
start number.bat
goto run_bots

:bot2
start random.bat
goto run_bots

:emergency
cls
echo Экстренное оключние ботов
echo.
echo ВНИМАНИЕ! Все боты будут остановлены!
echo.
set /p confirm="Вы действитель хотите отключить всех ботов (Введите 'CONFIRM'): "

if not "%confirm%"=="CONFIRM" (
    echo Отмена активации...
    timeout /t 2 >nul
    goto menu_bot
)

echo.
echo ОСТАНОВКА ВСЕХ БОТОВ...
echo.

rem Создаем файл-стоппер чтобы батники не перезапускались
echo STOP > emergency_stop.trigger

rem Останавливаем Python процессы
taskkill /f /im python.exe 2>nul

rem Тут надо поменять название окно если вы по меняли их название

rem Останавливаем батники (окна с ботами)
taskkill /f /fi "WindowTitle eq Рандом бот" 2>nul
taskkill /f /fi "WindowTitle eq Угадай число бот" 2>nul

rem Останавливаем curl
taskkill /f /im curl.exe 2>nul

echo.
echo Все процессы остановлены!
echo Файл-блокировка создан - автоперезапуск отключен
echo.
echo Журнал чрезвычайной ситуации сохранен
echo %date% %time% - Активировон прототокол Экствренного отключения >> emergency_log.txt

echo.
echo ===============================
echo ЧРЕЗВЫЧАЙНАЯ СИТУАЦИЯ АКТИВИРОВАНА
echo Все боты были остановлены
echo Автоперезапуск отключен
echo ===============================
echo.
pause

rem Удаляем файл-стоппер через 5 секунд (на всякий случай)
timeout /t 1 >nul
del emergency_stop.trigger 2>nul

goto menu_bot

:exit_program
exit

:recrol
cls
start cmd /k curl ascii.live/rick
pause
goto recrol