iasl.exe -v
set NASM_PREFIX=C:\Users\runneradmin\nasm\
cd edk2
call edksetup.bat
echo "-------------------------------------------------"
build -w -a X64 -t VS2022 -b NOOPT -p MiniVisorPkg\Builds\Platform\EFI\MiniVisorPkg.dsc
dir /s MiniVisorDxe.efi
