@echo off
rem  Assemble tests\enc\*.asm with the cl build, for the Mac side to compare with its own objects.
rem  Usage: enc.cmd <tree root>   -> <root>\build\enc\*.obj
setlocal
if "%~1"=="" (echo enc.cmd: needs the tree root & exit /b 2)
cd /d "%~1"
if not exist build\enc mkdir build\enc
for %%f in (tests\enc\*.asm) do build\asm-win.exe -t x64 %%f -o build\enc\%%~nf.obj
echo ENC-DONE
