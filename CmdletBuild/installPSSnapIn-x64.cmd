@echo off
%~d0
cd "%~dp0"

ECHO ----------------------------------------
ECHO Installing AzureManagementTools PSSnapIn
ECHO ----------------------------------------

ECHO "Build solution..."
call .\build-x64.cmd

@REM IF EXIST %WINDIR%\SysWow64 (
	set installUtilDir=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319
@REM ) ELSE (
@REM	set installUtilDir=%WINDIR%\Microsoft.NET\Framework\v4.0.30319
@REM )

set assemblyPath="..\..\..\..\code\AzureManagementTools.Cmdlets\bin\Debug\Microsoft.Samples.AzureManagementTools.PowerShell.dll"

ECHO "Installing PSSnapIn..."
%installUtilDir%\installutil.exe -i %assemblyPath%

@PAUSE