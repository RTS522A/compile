iasl.exe -v
set NASM_PREFIX="C:\Users\runneradmin\nasm\"
set CLANG_BIN="C:\Program Files\LLVM\bin\"
cd edk2
edksetup.bat Rebuild
call edksetup.bat
build -a X64 -t VS2019 -b NOOPT
echo "-------------------------------------------------"
build -w -a X64 -t VS2019 -b NOOPT -p MiniVisorPkg\Builds\Platform\EFI\MiniVisorPkg.dsc
dir /s MiniVisorDxe.efi
