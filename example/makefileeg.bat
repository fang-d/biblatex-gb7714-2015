@echo off


IF NOT EXIST gb7714-2015.bbx (
copy ..\gb7714-2015.bbx . /y
copy ..\gb7714-2015.cbx . /y
copy ..\gb7714-2015ay.bbx . /y
copy ..\gb7714-2015ay.cbx . /y
copy ..\gb7714-2015-gbk.def . /y
)

echo compiled files info: > makerecord.dat

setlocal enabledelayedexpansion
for  %%a in ( test*.tex ) do (
call makeclear
set jobfile=%%a
set jobname=!jobfile:~0,-4!
echo %%a
echo !jobfile!
echo !jobname!
echo !jobfile! >> makerecord.dat
xelatex.exe --synctex=-1 !jobfile!
biber !jobname!
xelatex.exe --synctex=-1 !jobfile!
)
setlocal DISABLEDELAYEDEXPANSION

setlocal enabledelayedexpansion
for  %%a in ( cls*.tex ) do (
call makeclear
set jobfile=%%a
set jobname=!jobfile:~0,-4!
echo %%a
echo !jobfile!
echo !jobname!
echo !jobfile! >> makerecord.dat
xelatex.exe --synctex=-1 !jobfile!
biber !jobname!
xelatex.exe --synctex=-1 !jobfile!
)
setlocal DISABLEDELAYEDEXPANSION

setlocal enabledelayedexpansion
for  %%a in ( opt*.tex ) do (
call makeclear
set jobfile=%%a
set jobname=!jobfile:~0,-4!
echo %%a
echo !jobfile!
echo !jobname!
echo !jobfile! >> makerecord.dat
xelatex.exe --synctex=-1 !jobfile!
biber !jobname!
xelatex.exe --synctex=-1 !jobfile!
)
setlocal DISABLEDELAYEDEXPANSION

setlocal enabledelayedexpansion
for  %%a in ( code*.tex ) do (
call makeclear
set jobfile=%%a
set jobname=!jobfile:~0,-4!
echo %%a
echo !jobfile!
echo !jobname!
echo !jobfile! >> makerecord.dat
pdflatex.exe --synctex=-1 !jobfile!
biber !jobname!
pdflatex.exe --synctex=-1 !jobfile!
pdflatex.exe --synctex=-1 !jobfile!
)
setlocal DISABLEDELAYEDEXPANSION

call makeclear


del *.bbx /Q
del *.cbx /Q
del *.def /Q


::pause
