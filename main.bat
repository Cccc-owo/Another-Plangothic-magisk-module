@ECHO OFF
::==========setting variable
set template=https://github.com/Zackptg5/MMT-Extended/archive/refs/heads/master.zip
set fontp1=https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project/releases/tag/V1.8.5752/PlangothicP1-Regular.fallback.ttf
set fontp2=https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project/releases/tag/V1.8.5752/PlangothicP2-Regular.ttf
::==========

::==========checking
ECHO Time:%date%
ECHO Checking the required folder...
if not exist output\ ( mkdir output\ ) else ( del /F /S /Q output\ & rmdir /S /Q output\ & mkdir output\ )
if not exist output\system\fonts\ ( mkdir output\system\fonts\ ) else ( del /F /S /Q output\system\fonts\ & rmdir /S /Q output\system\fonts\ & mkdir output\system\fonts\ )
if exist Plangothic-magisk-module.zip del /F /S /Q Plangothic-magisk-module.zip
::==========

::==========integrating files
ECHO.
wget.exe -O "Plangothic-P1.ttf" %fontp1%
wget.exe -O "Plangothic-P2.ttf" %fontp2%
wget.exe -O "MMT-Extended.zip" %template%
7z.exe x MMT-Extended.zip MMT-Extended-master\* -ooutput/
xcopy output\MMT-Extended-master\* output /Y /Q /E
del /S /Q output\MMT-Extended-master
rmdir /S /Q output\MMT-Extended-master
xcopy .\Plangothic-*.ttf output\system\fonts\ /Y /Q
del /Q output\.gitattributes
del /Q output\.gitignore
del /S /Q placeholder
rmdir output\zygisk
ECHO.
xcopy CHANGELOG.md output\ /Y /Q | xcopy module.prop output\ /Y /Q | xcopy update.json output\ /Y /Q
ECHO.
ECHO Compressing the generated files...
7z.exe a Another-Plangothic-magisk-module.zip .\output\*
::==========

::done
ECHO.
ECHO End of script running.
