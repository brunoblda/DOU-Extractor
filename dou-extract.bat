@ECHO OFF 
:: %1 = pasta para salvar

For /f "tokens=1-6 delims=/: " %%A in ('robocopy "|" . /njh ^| find ":"') do  (
    set "_YYYY=%%A" & set "_month=%%B" & set "_day=%%C" 
    set "_hour=%%D" & set "_min=%%E"   & set "_sec=%%F"
)

set yearToday=%_YYYY%
set monthToday=%_month%
set dayToday=%_day%
set count=0

set downloadFileName=IN-Jornal-%yearToday%_%monthToday%_%dayToday%_do2.pdf
set fileResult=%1%downloadFileName%
ECHO %fileResult%

for /r %%i in (%1) do (
  set fileName=%%i
  set yearFile=%fileName~10,4%
  set monthFile=%fileName~15,2%
  set dayFile=%fileName~18,2%
  if (%yearFile%==%yearToday%) count+=1   
)
set downloadFileName=IN-Jornal-%yearToday%_%monthToday%_%dayToday%_do2.pdf
set fileResult=%1%downloadFileName%
ECHO %fileResult%
::if count==0 curl http://diariooficialhoje.com.br/IN-Jornal-2023_01_16_do2.pdf --output %1