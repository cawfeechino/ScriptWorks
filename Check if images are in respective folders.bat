@echo off

setlocal EnableDelayedExpansion 

echo Checking Phone Wallpapers...
for /r "--Phone Wallpaper Directory Here--" %%G in (*) do (
	for /f %%B in ('magick identify -format "%%[fx:(w>h)]" "%%G"') do set "scaleB=%%B"
	if /i "!scaleB!" equ "1" (
		echo Moving %%G to --Desktop Wallpaper Directory Here--
		move "%%G" "--Desktop Wallpaper Directory Here--"
		
	)
)

echo Checking Desktop Wallpapers...
for /r "--Desktop Wallpaper Directory Here--" %%G in (*) do (
	for /f %%A in ('magick identify -format "%%[fx:(w<h)]" "%%G"') do set "scale=%%A"
	if /i "!scale!" equ "1" (
		echo Moving %%G to --Phone Wallpaper Directory Here--
		move "%%G" "--Phone Wallpaper Directory Here--"
	)
)
   
echo Check completed, press any key to exit...
pause > nul

REM setlocal EnableDelayedExpansion is very important here
REM surround variables in ! and "" in the if statement so it doesn't think everything is a phone/desktop wallpaper