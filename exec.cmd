iasl.exe -v
::set NASM_PREFIX=C:\Users\runneradmin\nasm\
::set CLANG_BIN="C:\Program Files\LLVM\bin\"
::set VSINSTALLDIR="C:\Program Files\Microsoft Visual Studio\2022\Enterprise\"
cd edk2
call edksetup.bat
::build -a X64 -t VS2019 -b NOOPT
echo "-------------------------------------------------"
build -w -a X64 -t VS2019 -b RELEASE -p MiniVisorPkg\Builds\Platform\EFI\MiniVisorPkg.dsc -D DEBUG_ON_SERIAL_PORT
dir /s MiniVisorDxe.efi
