@echo off
setlocal ENABLEEXTENSIONS & pushd .
set D=%CD%\fstest
set BIN=%CD%\bin\lookfs64.exe
set F=%D%\hello.txt
set D2=%D%\hello.dir
if exist "%D%" rd /s /q "%D%"
md "%D%"
md "%D2%"
echo. > "%F%"
for %%i in (foo bar baz) do @( echo %%i > "%D%:%%i" && echo %%i > "%D%\%%i" && echo %%i > "%D2%\%%i" && echo %%i > "%F%:%%i" )
mklink /J "%D%\hello.junction" "%D2%"
"%BIN%" --nologo --verbose "%D%\hello.junction"
popd & endlocal & goto :EOF
