# How to update

Each run of the `build.ps1` script will download the latest stable version of `kubectl.exe`.

The URL to Helm needs to be updated manually in the `build.ps1` script.

The version of the resulting nuget package is based on the `kubectl.exe` version, although this may need to be changed in future.