@ECHO OFF 
:: Another commentary
set dateToday=%Date%
set yearToday=%dateToday~6%
set monthToday=%dateToday~3,2%
set dayToday=%dateToday~0,2%
set count=0
for /r %%i in (%1) do (
  set fileName=%%i
  set yearFile=%fileName~10,4%
  set monthFile=%fileName~15,2%
  set dayFile=%fileName~18,2%
  if (yearFile==yearToday AND monthFile==monthToday AND dayFile==dayToday) count+=1     
)
if count==0 