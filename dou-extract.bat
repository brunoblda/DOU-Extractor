::@ECHO OFF 
:: %1 = pasta para salvar

For /f "tokens=1-6 delims=/: " %%A in ('robocopy "|" . /njh ^| find ":"') do  (
    set "_YYYY=%%A" & set "_month=%%B" & set "_day=%%C" 
    set "_hour=%%D" & set "_min=%%E"   & set "_sec=%%F"
)

set yearToday=%_YYYY%
set monthToday=%_month%
set dayToday=%_day%
set a/ count=0

set downloadFileName=IN-Jornal-%yearToday%_%monthToday%_%dayToday%_do2.pdf
set fileResult=%1%downloadFileName%
ECHO %fileResult%

FOR /R %1 %%F in (*.pdf*) do (
  set fileName=%%F
  set yearFile=2023
  set monthFile=01
  set dayFile=16
  if %yearFile%==%yearToday% (
    if %monthFile%==%monthToday% (
      if %dayFile%==%dayToday% (
        ECHO %%count%%))) 
)

:: if count==0 curl http://diariooficialhoje.com.br/IN-Jornal-2023_01_17_do2.pdf --output %1

:: if count GTR 0 curl http://diariooficialhoje.com.br/IN-Jornal-2023_01_16_do2.pdf -O

:: if count GTR 0 curl http://diariooficialhoje.com.br/IN-Jornal-2023_01_16_do2.pdf --output %1

if count EQU 0 curl -O --output-dir %1 http://diariooficialhoje.com.br/IN-Jornal-2023_01_16_do2.pdf

:: curl http://diariooficialhoje.com.br/IN-Jornal-2023_01_16_do2.pdf -O