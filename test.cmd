@echo off

set opencover=%UserProfile%\.nuget\packages\OpenCover\4.6.519\tools\OpenCover.Console.exe
set reportgenerator=%UserProfile%\.nuget\packages\ReportGenerator\2.5.2\tools\ReportGenerator.exe

if not exist TestResults mkdir TestResults || goto :eof

"%opencover%" -target:dotnet.exe -targetargs:"test test\NeinMath.Tests --configuration Release --framework net461 -xml TestResults\NeinMath.netframework.result.xml" -output:TestResults\NeinMath.netframework.report.xml -register:user -filter:+[NeinMath]* -returntargetcode -oldstyle || goto :eof
"%opencover%" -target:dotnet.exe -targetargs:"test test\NeinMath.Tests --configuration Release --framework netcoreapp1.1 -xml TestResults\NeinMath.netcoreapp.result.xml" -output:TestResults\NeinMath.netcoreapp.report.xml -register:user -filter:+[NeinMath]* -returntargetcode -oldstyle || goto :eof

"%reportgenerator%" -reports:TestResults\*.report.xml -targetdir:TestResults\report -reporttypes:Badges;Html || goto :eof
