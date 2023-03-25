@echo off
setlocal EnableDelayedExpansion
:nt
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
	copy ".\vita_coco.png" "%folder%"
    if exist %folder%/vita_coco.png (exit /b 0) else (goto nt)
) else (set "folder=!folder[%rand%]!")
goto loop
endlocal