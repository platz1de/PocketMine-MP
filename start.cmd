@echo off
TITLE PocketMine-MP server software for Minecraft: Pocket Edition
cd /d %~dp0
FOR /F "tokens=*" %%i in ('php -r "echo 1;"') do SET PHPOUTPUT=%%i
if not "%PHPOUTPUT%"=="1" (
echo [ERROR] Couldn't find PHP binary in PATH.
echo [INFO] Please use the Windows installer from the homepage
pause
) else (
	if exist php.cmd (
		if exist bin\mintty.exe (
			start "" bin\mintty.exe -h error -t "PocketMine-MP" -i bin/pocketmine.ico -w max php.cmd -d enable_dl=On PocketMine-MP.php --enable-ansi %*
		) else (
			php.cmd -d enable_dl=On PocketMine-MP.php %*
		)
	) else (
		if exist bin\mintty.exe (
			start "" bin\mintty.exe -o Columns=88 -o Rows=32 -o AllowBlinking=0 -o FontQuality=3 -o CursorType=0 -o CursorBlinks=1 -h never -t "PocketMine-MP" -i bin/pocketmine.ico -w max php -d enable_dl=On PocketMine-MP.php --enable-ansi %*
		) else (
			php -d enable_dl=On PocketMine-MP.php %*
		)
	)
)
