@echo off
SET package=CounterFab
SET user=andremion
Powershell.exe -executionpolicy remotesigned -command "./download.ps1 -package %package% -user %user%"
msbuild Xamarin.Bindings.%package%.sln /p:Configuration=Release /p:Platform="Any CPU"
nuget pack package.nuspec