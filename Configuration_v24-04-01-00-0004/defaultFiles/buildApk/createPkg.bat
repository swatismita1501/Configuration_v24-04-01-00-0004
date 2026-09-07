@echo off
:: Main entry point
echo *********************************
echo * Creating AXIUM EMV config APK *
echo *********************************

call :prepareAxiumEmvConfigApk
call :buildSignApk axiumEmvConfig

echo *********************************
echo * Creating MOBY EMV config ZIP *
echo *********************************

call :prepareMobyEmvConfigZip

:: Exit the script
goto :end

:prepareAxiumEmvConfigApk
echo * Copying EMV config
call :copyDefaultApk "axiumEmvConfig"
copy "..\axium\public\EmvConfig - test.json" .\axiumEmvConfig\assets\EmvConfig.json
copy "..\axium\public\EmvCapk - test.json" .\axiumEmvConfig\assets\EmvCapk.json

goto :end

:prepareMobyEmvConfigZip
echo * Copying EMV config
set tmpDir=mobyEmvConfig
rmdir /S /Q %tmpDir%
mkdir %tmpDir%
copy "..\moby\public\EmvConfig - test.json" .\%tmpDir%\EmvConfig.json
copy "..\moby\public\EmvCapk - test.json" .\%tmpDir%\EmvCapk.json
echo * Creating Emv config zip
powershell -command "Compress-Archive -Path '%tmpDir%\*' -DestinationPath '%tmpDir%.zip'"

goto :end

:copyDefaultApk
echo * Copying default apk package files
if "%1"=="" goto err_no_apk_name

@echo off
rmdir /S /Q %1
mkdir %1
copy .\configApk %1
mkdir .\%1\assets

goto :end

:buildSignApk
echo * Creating APK with apk name: %~1
if "%1"=="" goto err_no_apk_name

@echo off
rmdir /S /Q %1\build
rmdir /S /Q %1\GeneratedAPK

echo * Building APK
CALL apktool.bat b %1 --output %1\GeneratedAPK\%1.apk
if errorlevel 1 goto :err_apk_build
echo * Unsigned Apk is generated
@echo:

echo * Signing APK
CALL apksigner sign --verbose --v2-signing-enabled true --ks sign.keystore --ks-key-alias signkey --ks-pass pass:123456 --key-pass pass:123456 --out %1\GeneratedAPK\%1.apk %1\GeneratedAPK\%1.apk
if errorlevel 1 goto :err_apk_sign
echo * Signed APK is generated
copy %1\GeneratedAPK\%1.apk . /y
@echo:

echo * Verifying signature
CALL apksigner verify --print-certs -v %1\GeneratedAPK\%1.apk
if errorlevel 1 goto :err_apk_sign_verification
echo * APK signature is verified
@echo:
ECHO * APK BUILD is Successfully Completed.
goto :end

:err_no_parameter
@echo:
echo ### ERROR!
echo ### Parameter required
goto :end

:err_no_apk_name
@echo
echo ### ERROR!
echo ### Apk package name parameter required
goto :end

:err_apk_build
@echo:
echo ### ERROR!
echo ### APK build failed
goto :end

:err_apk_sign
@echo:
echo ### ERROR!
echo ### APK Signing failed
goto :end

:err_apk_sign_verification
@echo:
echo ### ERROR!
echo ### APK Signature Verification failed
goto :end

:end

