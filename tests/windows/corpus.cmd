@echo off
rem  Assemble every .asm of a directory with ml64 and with this assembler, and list both objects
rem  with dumpbin, for tests/corpus-diff.py on the Mac or Linux side (the box has no python).
rem  Usage: corpus.cmd <tree root> <corpus dir>   -> <corpus dir>\ml\*.all and <corpus dir>\my\*.all
setlocal enabledelayedexpansion
if "%~1"==":shard" goto :shard
if "%~2"=="" (echo corpus.cmd: needs the tree root and the corpus directory & exit /b 2)
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" >nul
set ASM=%~1\build\asm-win.exe
cd /d "%~2"
if not exist ml mkdir ml
if not exist my mkdir my
del /q my\*.ok 2>nul
rem  ml64 and this assembler side by side, three shards each - the reference and the assembler
rem  under test at once, see par.cmd. A file this one assembled leaves my\<name>.ok to be counted.
call "%~dp0par.cmd" 6 "%~f0"
set n=0
for %%f in (*.asm) do set /a n+=1
set mine=0
for %%f in (my\*.ok) do set /a mine+=1
echo corpus.cmd: %n% files, !mine! assembled here
exit /b 0

rem  Shards 1-3 are ml64's, 4-6 this assembler's, each taking every third file.
:shard
set PART=%~2
set TOOL=ml
if %~2 GTR 3 (set TOOL=my& set /a PART=%~2 - 3)
set /a I=0
for %%f in (*.asm) do (
    set /a I+=1, M=I %% 3 + 1
    if !M!==!PART! call :!TOOL! %%~nf %%f
)
exit /b 0

:ml
if not exist ml\%1.obj ml64 /nologo /c /Fo ml\%1.obj %2 > ml\%1.log 2>&1
if not exist ml\%1.all dumpbin /nologo /disasm /relocations /symbols ml\%1.obj > ml\%1.all 2>&1
exit /b 0

:my
%ASM% -t x64 %2 -o my\%1.obj > my\%1.log 2>&1
if errorlevel 1 exit /b 0
echo.> my\%1.ok
dumpbin /nologo /disasm /relocations /symbols my\%1.obj > my\%1.all 2>&1
exit /b 0
