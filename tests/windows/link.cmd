@echo off
rem  Link and run on the box: b01 on its own, and b02 in both mixes - main by this assembler
rem  with twice by ml64, and the other way - against the static CRT the compilers' suites use.
rem  Usage: link.cmd <tree root>    (after build.cmd)
setlocal
if "%~1"=="" (echo link.cmd: needs the tree root & exit /b 2)
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" >nul
set ASM=%~1\build\asm-win.exe
set LIBS=libcmt.lib libucrt.lib libvcruntime.lib kernel32.lib legacy_stdio_definitions.lib
cd /d "%~1\build"
if not exist link mkdir link
cd link
set fail=0
%ASM% -t x64 ..\..\tests\link\b01.asm -o b01.obj || set fail=1
link /nologo /subsystem:console /out:b01.exe b01.obj %LIBS% > b01.link 2>&1 || set fail=1
b01.exe > b01.out
echo b01 rc=%errorlevel% (7 expected)
type b01.out
%ASM% -t x64 ..\..\tests\link\b02-main.asm -o b02-main-my.obj || set fail=1
%ASM% -t x64 ..\..\tests\link\b02-twice.asm -o b02-twice-my.obj || set fail=1
ml64 /nologo /c /Fo b02-main-ml.obj ..\..\tests\link\b02-main.asm > nul || set fail=1
ml64 /nologo /c /Fo b02-twice-ml.obj ..\..\tests\link\b02-twice.asm > nul || set fail=1
link /nologo /subsystem:console /out:b02-ab.exe b02-main-my.obj b02-twice-ml.obj %LIBS% > b02-ab.link 2>&1 || set fail=1
link /nologo /subsystem:console /out:b02-ba.exe b02-main-ml.obj b02-twice-my.obj %LIBS% > b02-ba.link 2>&1 || set fail=1
b02-ab.exe
echo b02 mine+ml64 rc=%errorlevel% (46 expected)
b02-ba.exe
echo b02 ml64+mine rc=%errorlevel% (46 expected)
if %fail%==1 (echo LINK-FAILED & exit /b 1)
echo LINK-DONE
