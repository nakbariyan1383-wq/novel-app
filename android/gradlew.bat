@echo off
set DIRNAME=%~dp0
set JARPATH=%DIRNAME%gradle\wrapper\gradle-wrapper.jar
if not exist "%JARPATH%" (
  echo Downloading gradle wrapper jar...
  powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/gradle/gradle/v8.7.0/gradle/wrapper/gradle-wrapper.jar' -OutFile '%JARPATH%'"
)
java -jar "%JARPATH%" %*
