@echo off
rem  Assemble every .asm of a directory with ml64 and with this assembler, and list both objects
rem  with dumpbin, for tests/corpus-diff.py on the Mac or Linux side (the box has no python).
rem  Usage: corpus.cmd <tree root> <corpus dir>   -> <corpus dir>\ml\*.all and <corpus dir>\my\*.all
setlocal
if "%~2"=="" (echo corpus.cmd: needs the tree root and the corpus directory & exit /b 2)
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" >nul
set ASM=%~1\build\asm-win.exe
cd /d "%~2"
if not exist ml mkdir ml
if not exist my mkdir my
set n=0
set mine=0
for %%f in (*.asm) do (
  set /a n+=1
  if not exist ml\%%~nf.obj ml64 /nologo /c /Fo ml\%%~nf.obj %%f > ml\%%~nf.log 2>&1
  if not exist ml\%%~nf.all dumpbin /nologo /disasm /relocations /symbols ml\%%~nf.obj > ml\%%~nf.all 2>&1
  %ASM% -t x64 %%f -o my\%%~nf.obj > my\%%~nf.log 2>&1
  if not errorlevel 1 (
    set /a mine+=1
    dumpbin /nologo /disasm /relocations /symbols my\%%~nf.obj > my\%%~nf.all 2>&1
  )
)
echo corpus.cmd: %n% files, %mine% assembled here
