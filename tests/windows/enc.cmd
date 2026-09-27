@echo off
rem  Assemble tests\enc\*.asm with the cl build, for the Mac side to compare with its own objects.
rem  Usage: enc.cmd <tree root>   -> <root>\build\enc\*.obj
setlocal enabledelayedexpansion
if "%~1"==":shard" goto :shard
if "%~1"=="" (echo enc.cmd: needs the tree root & exit /b 2)
cd /d "%~1"
if not exist build\enc mkdir build\enc
rem  Six shards at once, each assembling every sixth file - see par.cmd.
call "%~dp0par.cmd" 6 "%~f0"
echo ENC-DONE
exit /b 0

:shard
set /a I=0
for %%f in (tests\enc\*.asm) do (
    set /a I+=1, M=I %% %~3 + 1
    if !M!==%~2 build\asm-win.exe -t x64 %%f -o build\enc\%%~nf.obj
)
exit /b 0
