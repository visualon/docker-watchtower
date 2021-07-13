@echo off

docker run --rm %IMAGE% -v \\.\pipe\docker_engine:\\.\pipe\docker_engine watchtower --no-pull --run-once
if not "%ERRORLEVEL%" == "0" exit /B %ERRORLEVEL%

docker-compose --file docker-compose.test.yml run sut
if not "%ERRORLEVEL%" == "0" exit /B %ERRORLEVEL%