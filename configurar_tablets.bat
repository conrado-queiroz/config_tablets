@echo off
TITLE Central de Automacao e Configuracao de Tablets - ADB
COLOR 0A
cls

:MENU
cls
echo.
echo  ====================================================================
echo    CONFIGURACAO AUTOMATIZADA DE TABLETS VIA ADB
echo  ====================================================================
echo.
echo    [1] Executar Configuracao Completa (Recomendado)
echo    [2] Apenas Instalar Aplicativos (APKs)
echo    [3] Apenas Remover Apps Indesejados (Bloatware)
echo    [4] Apenas Aplicar Configuracoes do Sistema
echo    [5] Alterar Nome do Dispositivo
echo    [6] Verificar Dispositivos Conectados
echo    [7] Sair
echo.
echo  ====================================================================
set /p opcao=Escolha uma opcao [1-7]: 

if "%opcao%"=="1" goto COMPLETO
if "%opcao%"=="2" goto APKS
if "%opcao%"=="3" goto BLOATWARE
if "%opcao%"=="4" goto CONFIGS
if "%opcao%"=="5" goto NOMEDEV
if "%opcao%"=="6" goto CHECAR
if "%opcao%"=="7" goto SAIR

:CHECAR
cls
echo Verificando conectividade ADB...
adb devices
pause
goto MENU

:NOMEDEV
cls
set /p nomedevice=Digite o novo nome do Tablet (ex: Tablet-Corp-01): 
adb shell settings put global device_name "%nomedevice%"
adb shell settings put bluetooth_name "%nomedevice%"
echo Nome alterado com sucesso!
pause
goto MENU

:APKS
cls
if not exist "apks" mkdir apks
echo Instalando os arquivos .apk encontrados na pasta /apks...
for %%f in (apks\*.apk) do (
    echo  [%%~nxf] Instalando...
    adb install -g -r "%%f"
)
pause
goto MENU

:BLOATWARE
cls
echo Removendo apps nativos desnecessarios...
adb shell pm uninstall -k --user 0 com.samsung.android.game.gamehome >nul 2>&1
adb shell pm uninstall -k --user 0 com.samsung.android.voc >nul 2>&1
adb shell pm uninstall -k --user 0 com.samsung.android.app.spage >nul 2>&1
adb shell pm uninstall -k --user 0 com.facebook.appmanager >nul 2>&1
adb shell pm uninstall -k --user 0 com.facebook.services >nul 2>&1
adb shell pm uninstall -k --user 0 com.facebook.system >nul 2>&1
echo Bloatwares removidos com sucesso!
pause
goto MENU

:CONFIGS
cls
echo Ajustando configuracoes de tela, energia e desempenho...
adb shell settings put system screen_off_timeout 600000
adb shell settings put system screen_brightness 180
adb shell settings put system screen_brightness_mode 0
adb shell settings put global wifi_sleep_policy 2
adb shell settings put global window_animation_scale 0.5
adb shell settings put global transition_animation_scale 0.5
adb shell settings put global animator_duration_scale 0.5
echo Configuracoes aplicadas!
pause
goto MENU

:COMPLETO
cls
echo [1/4] Verificando conexao...
adb devices
set /p nomedevice=Digite a identificacao do Tablet (ex: TAB-CORP-01): 
if not "%nomedevice%"=="" (
    adb shell settings put global device_name "%nomedevice%"
    adb shell settings put bluetooth_name "%nomedevice%"
)
echo [2/4] Aplicando Ajustes de Sistema...
adb shell settings put system screen_off_timeout 600000
adb shell settings put system screen_brightness 180
adb shell settings put system screen_brightness_mode 0
adb shell settings put global wifi_sleep_policy 2
adb shell settings put global window_animation_scale 0.5
adb shell settings put global transition_animation_scale 0.5
adb shell settings put global animator_duration_scale 0.5

echo [3/4] Removendo Bloatwares...
adb shell pm uninstall -k --user 0 com.samsung.android.game.gamehome >nul 2>&1
adb shell pm uninstall -k --user 0 com.samsung.android.voc >nul 2>&1
adb shell pm uninstall -k --user 0 com.samsung.android.app.spage >nul 2>&1
adb shell pm uninstall -k --user 0 com.facebook.appmanager >nul 2>&1

echo [4/4] Instalando Aplicativos...
if exist "apks" (
    for %%f in (apks\*.apk) do (
        echo  [%%~nxf] Instalando...
        adb install -g -r "%%f"
    )
)
echo.
echo CONFIGURACAO COMPLETA FINALIZADA!
pause
goto MENU

:SAIR
exit