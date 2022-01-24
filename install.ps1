$DANSAY_DIR="C:\dansay"

if(!(Get-Command git)) {
    ">>> GIT IS REQUIRED FOR THIS INSTALLATION."
    Exit
}

$DANSAY_LATEST_RELEASE="$(git ls-remote https://github.com/danbugs/dansay HEAD)"
$DANSAY_LATEST_RELEASE=$DANSAY_LATEST_RELEASE.Substring(0, $DANSAY_LATEST_RELEASE.IndexOf('H')-1)

$DANSAY_URL="https://github.com/danbugs/dansay/releases/download/$DANSAY_LATEST_RELEASE-windows/dansay.exe"

New-Item -ItemType Directory -Force -Path $DANSAY_DIR
">>> BINARY WILL BE STORED AT $DANSAY_DIR."
Invoke-WebRequest $DANSAY_URL -OutFile $DANSAY_DIR\dansay.exe
">>> DOWNLOADED BINARY."
[Environment]::SetEnvironmentVariable("Path", $env:Path +";$DANSAY_DIR" , [System.EnvironmentVariableTarget]::User)
Update-SessionEnvironment
">>> INSTALLED."


