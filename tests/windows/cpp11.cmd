@echo off
rem  The box's half of tests/cpp11.sh: ml64 assembles each tests\cpp11\*.ml64.asm and its code
rem  bytes become <case>.ml.code - the oracle tests/cpp11.sh reads - and each COMDAT-dialect
rem  <case>.asm is assembled by this assembler, linked by link.exe against the static CRT
rem  cpp11 links with, run, and its output written as <case>.out for the Mac side to compare
rem  with <case>.expected, the program's recorded output.
rem  Usage: cpp11.cmd <tree root>    (after build.cmd)  -> <root>\build\cpp11
setlocal
if "%~1"=="" (echo cpp11.cmd: needs the tree root & exit /b 2)
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" >nul
if errorlevel 1 (echo cpp11.cmd: no vcvars64 & exit /b 1)
set ASM=%~1\build\asm-win.exe
set LIBS=libcmt.lib libcpmt.lib libucrt.lib libvcruntime.lib kernel32.lib legacy_stdio_definitions.lib
cd /d "%~1"
if not exist build\cpp11 mkdir build\cpp11
set fail=0
for %%f in (tests\cpp11\*.ml64.asm) do call :one %%~nf
if %fail%==1 (echo CPP11-FAILED & exit /b 1)
echo CPP11-DONE
exit /b 0

rem  %1 is <case>.ml64; the case is the name before it.
:one
set C=%~n1
ml64 /nologo /c /Fo build\cpp11\%C%.ml64-ml.obj tests\cpp11\%C%.ml64.asm > build\cpp11\%C%.ml64.log 2>&1 || (echo ML64-FAILED %C% & set fail=1 & exit /b 0)
python tests\coffcode.py build\cpp11\%C%.ml64-ml.obj > build\cpp11\%C%.ml.code
%ASM% -t x64 tests\cpp11\%C%.asm -o build\cpp11\%C%.obj > build\cpp11\%C%.asm.log 2>&1 || (echo ASM-FAILED %C% & set fail=1 & exit /b 0)
link /nologo /subsystem:console /stack:8388608 /out:build\cpp11\%C%.exe build\cpp11\%C%.obj %LIBS% > build\cpp11\%C%.link 2>&1 || (echo LINK-FAILED %C% & set fail=1 & exit /b 0)
build\cpp11\%C%.exe > build\cpp11\%C%.out 2>&1 < nul
echo %C% rc=%errorlevel%
exit /b 0
