[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

add-type -AssemblyName System.Windows.Forms


Function Send-Text {
    param(
        [Parameter(ValueFromPipeline)]
        [string] $Text,
        [int] $Seconds = 5
    )

    $input = $Text
    $timeout = $Seconds

    do {
        Write-Host "Sending Text in ${timeout} seconds"
        $timeout--

        Start-Sleep -Seconds 1

    } while ($timeout -gt 0)

    Write-Host "Sending Text" -NoNewline

    [System.Windows.Forms.SendKeys]::SendWait($input)

    Write-Host "... done"
}