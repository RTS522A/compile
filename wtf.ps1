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
Download "https://www.nuget.org/api/v2/package/wtl/10.0.10320" ".\wtl.zip"
Unzip ".\wtl.zip" ".\compile\compile\WMIExplorer\packages\wtl.10.0.10320\"
