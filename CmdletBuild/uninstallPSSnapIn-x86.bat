@echo off
%~d0
cd "%~dp0"

ECHO ----------------------------------------
ECHO Uninstall AzureManagementTools PSSnapIn
ECHO ----------------------------------------

@REM IF EXIST %WINDIR%\SysWow64 (
@REM	set installUtilDir=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319
@REM ) ELSE (
	set installUtilDir=%WINDIR%\Microsoft.NET\Framework\v4.0.30319
@REM )


set assemblyPath="..\..\..\..\code\AzureManagementTools.Cmdlets\bin\Debug\Microsoft.Samples.AzureManagementTools.PowerShell.dll"

ECHO "Uninstalling PSSnapIn..."
%installUtilDir%\installutil.exe -u %assemblyPath%

@PAUSE