$podmanSetupPath = "$env:TEMP\podman-setup"
$podmanSetupMsi = $podmanSetupPath + ".msi"
Invoke-WebRequest https://github.com/containers/podman/releases/download/v4.1.0/podman-v4.1.0.msi -OutFile $podmanSetupMsi

$DataStamp = get-date -Format yyyyMMddTHHmmss
$logFile = '{0}-{1}.log' -f $podmanSetupMsi,$DataStamp
$MSIArguments = @(
    "/i"
    ('"{0}"' -f $podmanSetupMsi)
    "/qn"
    "/norestart"
    "/L*v"
    $logFile
)
Start-Process "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow 