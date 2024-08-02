function Unzip
{
    param([string]$zipfile, [string]$outpath)
    Write-Output "Extracting $zipfile"
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

function Download
{
    param([string]$uri, [string]$outfile)
    Write-Output "Downloading $uri"
    $wc = New-Object net.webclient
    $wc.Downloadfile($uri, $outfile)
}

Set-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-PackageProvider Nuget –Force
Install-Module -Name NuGet -Force
Install-Package Microsoft.Windows.ImplementationLibrary -Version 1.0.201120.3
Install-Package wtl -Version 10.0.1032
Download "https://www.nuget.org/api/v2/package/wtl/10.0.10320" ".\wtl.zip"
Download "https://www.nuget.org/api/v2/package/Microsoft.Windows.ImplementationLibrary/1.0.201120.3" ".\mwli.zip"
Unzip ".\wtl.zip" "D:\a\compile\compile\WMIExplorer\WTLHelper\packages\wtl.10.0.10320"
Remove-Item -Path "D:\a\compile\compile\WMIExplorer\WTLHelper\packages\wtl.10.0.10320\Samples" -Recurse
Unzip ".\wtl.zip" "D:\a\compile\compile\WMIExplorer\WTLHelper\..\packages\wtl.10.0.10320"
Remove-Item -Path "D:\a\compile\compile\WMIExplorer\WTLHelper\..\packages\wtl.10.0.10320\Samples" -Recurse
Unzip ".\wtl.zip" "D:\a\compile\compile\WMIExplorer\WTLHelper\..\..\packages\wtl.10.0.10320"
Remove-Item -Path "D:\a\compile\compile\WMIExplorer\WTLHelper\..\..\packages\wtl.10.0.10320\Samples" -Recurse
Unzip ".\wtl.zip" "D:\a\compile\compile\WMIExplorer\WTLHelper\..\..\..\packages\wtl.10.0.10320"
Remove-Item -Path "D:\a\compile\compile\WMIExplorer\WTLHelper\..\..\..\packages\wtl.10.0.10320\Samples" -Recurse
Unzip ".\mwli.zip" "D:\a\compile\compile\WMIExplorer\WTLHelper\packages\Microsoft.Windows.ImplementationLibrary.1.0.201120.3"
Unzip ".\mwli.zip" "D:\a\compile\compile\WMIExplorer\WTLHelper\..\packages\Microsoft.Windows.ImplementationLibrary.1.0.201120.3"
Unzip ".\mwli.zip" "D:\a\compile\compile\WMIExplorer\WTLHelper\..\..\packages\Microsoft.Windows.ImplementationLibrary.1.0.201120.3"
Unzip ".\mwli.zip" "D:\a\compile\compile\WMIExplorer\WTLHelper\..\..\..\packages\Microsoft.Windows.ImplementationLibrary.1.0.201120.3"
Move-Item "D:\a\compile\compile\WMIExplorer\WTLHelper\..\..\..\packages\Microsoft.Windows.ImplementationLibrary.1.0.201120.3\include\wil\" "D:\a\compile\compile\WMIExplorer\WMIExp\wil\"
dir "D:\a\compile\compile\WMIExplorer\"
dir "D:\a\compile\compile\WMIExplorer\WMIExp\wil\"
