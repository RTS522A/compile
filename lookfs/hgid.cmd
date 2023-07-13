@echo off
setlocal ENABLEEXTENSIONS & pushd .
set HGTIPFILE="%~dp0hgid.h"
echo.> %HGTIPFILE%
@echo #define HG_REV_ID 1>> %HGTIPFILE%
@echo #define HG_REV_NO 1>>   %HGTIPFILE%
@echo #define HG_REV_NO_NUMERIC 1 -0>>   %HGTIPFILE%
@echo #define HG_FULLID 1>> %HGTIPFILE%
if exist %HGTIPFILE% type %HGTIPFILE%
popd & endlocal & goto :EOF
