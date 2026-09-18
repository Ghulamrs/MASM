@echo off
rem  Build the assembler with cl, warnings as ml64's own would be read: /W4 /permissive-.
rem  Usage: build.cmd <tree root>   -> <root>\build\asm-win.exe, cl.log beside it
setlocal
if "%~1"=="" (echo build.cmd: needs the tree root & exit /b 2)
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" >nul
if errorlevel 1 (echo build.cmd: no vcvars64 & exit /b 1)
cd /d "%~1"
if not exist build mkdir build
cd build
if exist asm-win.exe del asm-win.exe
if exist *.obj del /q *.obj
cl /nologo /std:c++14 /W4 /permissive- /O2 /EHsc /Fe:asm-win.exe ..\src\*.cpp > cl.log 2>&1
type cl.log
if not exist asm-win.exe (echo BUILD-FAILED & exit /b 1)
echo BUILD-DONE
