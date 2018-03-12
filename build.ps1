$versionUrl = "https://storage.googleapis.com/kubernetes-release/release/stable.txt"
$helmUrl = "https://storage.googleapis.com/kubernetes-helm/helm-v2.8.2-windows-amd64.tar.gz"

Install-Package 7Zip4Powershell -Force
Invoke-WebRequest -UseBasicParsing -Uri $helmUrl -OutFile helm.tar.gz
Expand-7zip helm.tar.gz .
Expand-7zip helm.tar .
$version = $(Invoke-WebRequest -UseBasicParsing -Uri $versionUrl).Content.Trim()
$cleanedVersion = $version -Replace "^v",""
$downloadLink = "https://storage.googleapis.com/kubernetes-release/release/$version/bin/windows/386/kubectl.exe"
Invoke-WebRequest -UseBasicParsing -Uri $downloadlink -OutFile kubectl.exe
(Get-Content kubernetes.nuspec).replace('#{KuberenetesVersion}', $cleanedVersion) | Set-Content kubernetes-processed.nuspec
