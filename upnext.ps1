$data = @{
    
}

do {


    Clear-Host
    Write-Host "DDD Adelaide"
    Write-Host "============"
    Write-Host ""
    Write-Host "On now:"
    Write-Host ""
    Write-Host "Registration"
    Write-Host ""
    Write-Host "At 8:45"
    Write-Host ""
    Write-host "Welcome (in room 1)"

    [Console]::SetCursorPosition([Console]::BufferWidth - 8, [Console]::BufferHeight - 1)
    Write-Host ([datetime]::Now.ToString("hh:MM tt"))
    Start-Sleep -Seconds 60
} while ($true)