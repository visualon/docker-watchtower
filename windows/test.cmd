@echo off

docker run --rm %IMAGE% watchtower --help
if not "%ERRORLEVEL%" == "0" exit /B %ERRORLEVEL%
