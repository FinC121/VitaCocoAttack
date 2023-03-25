@echo off
setlocal EnableDelayedExpansion

:nt

set /a "iter=1"
set "source=.\vita_coco.png"
set "folder=C:"

:loop

set /a count=0
for /d %%f in ("%folder%\*") do (
    set /a count+=1
    set "folder[!count!]=%%f"
)

set /a "rand=(%random% %% (%count%+1))"
if "%rand%" == "0" (  
    ::echo Selected folder, generating VITA_COCO
	copy ".\vita_coco.png" "%folder%"
    echo %folder%
    if exist %folder%/vita_coco.png (exit /b 0) else (goto nt)
) else (set "folder=!folder[%rand%]!")

::These go into else
::echo Folder contains folder^(s^), continuing search ^[%iter%^]
::set /a iter+=1
::echo !folder[%rand%]!

echo %folder%

goto loop

endlocal

STOP