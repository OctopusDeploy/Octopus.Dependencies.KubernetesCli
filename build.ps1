$versionUrl = "https://storage.googleapis.com/kubernetes-release/release/stable.txt"
$version = $(Invoke-WebRequest -UseBasicParsing -Uri $versionUrl).Content.Trim()
$cleanedVersion = $version -Replace "^v",""
$downloadLink = "https://storage.googleapis.com/kubernetes-release/release/$version/bin/windows/386/kubectl.exe"
Start-BitsTransfer $downloadlink -DisplayName "Getting KubeCTL from $downloadlink" -Destination "."
(Get-Content kubernetes.nuspec).replace('#{KuberenetesVersion}', $cleanedVersion) | Set-Content kubernetes-processed.nuspec