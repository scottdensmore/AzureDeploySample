@echo off
@REM ----------------------------------------------------------------------------------
@REM Build Azure Services Management Tools Solution
@REM ----------------------------------------------------------------------------------

set verbosity=quiet
set pause=true

:: Check for 64-bit Framework
@REM if exist %SystemRoot%\Microsoft.NET\Framework64\v4.0.30319 (
@REM  set msbuild=%SystemRoot%\Microsoft.NET\Framework64\v4.0.30319\msbuild.exe
@REM  goto :run
@REM )
:: Check for 32-bit Framework
if exist %SystemRoot%\Microsoft.NET\Framework\v4.0.30319 (
  set msbuild=%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe
  goto :run
)

@echo Building "AzureManagementTools.Cmdlets.csproj"
:run
call %msbuild% "..\..\..\..\code\AzureManagementTools.Cmdlets\AzureManagementTools.Cmdlets.csproj" /t:ReBuild /verbosity:%verbosity%

@if errorlevel 1 goto :error
@echo Build Complete

@goto :exit

:error
@echo An Error Occured building the Azure Services Management Tools Solution

:exit