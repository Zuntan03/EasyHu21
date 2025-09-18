@echo off
if not exist %~dp0LlamaCppPython_GeforcrRTX50x0.txt ( copy NUL %~dp0LlamaCppPython_GeforcrRTX50x0.txt > NUL )
call "%~dp0Setup.bat"
