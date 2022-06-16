@echo off




call :pushavd
SetLocal EnableDelayedExpansion
	echo [-] Pushing All Modules placed in the Modules folder
	for %%i in (modules\*.zip) do (		
		set module=%%i
        for /f "delims=" %%A in ('adb push  !module!  /data/local/tmp 2^>^&1' ) do (
				echo [-] %%A
				)
			
			)
	call :install_modules

	ENDLOCAL
exit /B 0


:install_modules

set ADBWORKDIR=/data/data/com.android.shell

	SetLocal EnableDelayedExpansion
	echo [-] Install all Modules placed in the Apps folder
	adb shell "su -c 'for i in $(find /data/local/tmp -name '*.zip'); do magisk --install-module "$i"; done'"
						
		
	)
	ENDLOCAL
exit /B 0
	