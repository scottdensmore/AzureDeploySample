# Windows Azure Deployment Sample

This sample shows how you can combine MSBuild and PowerShell to create
a simple build system to build and deploy your Windows Azure based solution.

## What's in this Sample

``Solution`` - an example cloud solution that includes both a worker role and 
web role to deploy.

``Build Scripts`` - a set of scripts to build the Windows Azure Commandlets.
These have builds for each type (x86 / x64) depending on your needs. When you 
use a 32bit build msbuild, you get the 32 bit version of PowerShell (see 
msbuild script). Since this is the norm, you will need to build the 32 bit versions
of the commandlets to install. Copy the .bat and .cmd fils into 
[place where you installed commandlets]\setup\scripts\tasks.  Then run
either installPSSnapin-x86.cmd or installPSSnapin-x64.cmd to get the version
that works for you. When you want to uninstall run either uninstallPSSnappin-x86.bat
or uninstallPSSnappin-x64.bat based on what you installed.

``Deploy Powershell Scripts`` - a set of PowerShell scripts that will deploy your
Windows Azure pacakage and certificates using the Windows Azure Commandlets.

``MSBuild Sample Build Script`` - a script that you can use to start / customize
for your bulds. You can then use this for your CI server to build and deploy.

## Blog Post(s)

* Azure Deployment for your Build Server - 
<http://scottdensmore.typepad.com/blog/2010/03/azure-deployment-for-your-build-server.html>
* Windows Azure Deployment for your Build Server Part 2 : Deploy Certs - 
<http://scottdensmore.typepad.com/blog/2010/04/windows-azure-deployment-for-your-build-server-part-2-deploy-certs.html>
* Using MSBuild to deploy to multiple Windows Azure environments - 
<http://blogs.msdn.com/b/tomholl/archive/2011/02/23/using-msbuild-to-deploy-to-multiple-windows-azure-environments.aspx>