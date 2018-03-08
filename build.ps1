$versionUrl = "https://storage.googleapis.com/kubernetes-release/release/stable.txt"
$version = $(Invoke-WebRequest -UseBasicParsing -Uri $versionUrl).Content.Trim()
$cleanedVersion = $version -Replace "^v",""
$downloadLink = "https://storage.googleapis.com/kubernetes-release/release/$version/bin/windows/386/kubectl.exe"
Invoke-WebRequest -UseBasicParsing -Uri $downloadlink -OutFile kubectl.exe
(Get-Content kubernetes.nuspec).replace('#{KuberenetesVersion}', $cleanedVersion) | Set-Content kubernetes-processed.nuspec