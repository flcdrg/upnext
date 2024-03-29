param (
    [switch] $Test
)

$ErrorActionPreference = "Stop"

$data = [ordered] @{
"6:00" = "Early"

"8:00" = "    Registration"

"8:45" = "Room 1:

    Welcome (starting 8.45am)"

"9:00" = "Room 1:
    Keynote - Lars Klint
    Rise of the Machines – Technology in Humanity"

"9:50" = "Room 1: 
    Elena Casciano
    Where did all the women go? 
    
Room 2: 
    Jakob Pennington
    Shifting Left: DevSecOps as an Approach to Building Secure Products"

"10:35" = "Level 8 foyer:

    Morning tea"

"11:00" = "Room 1:
    Rob Crowley
    GraphQL, gRPC or REST? Resolving the API Developer's Dilemma

Room 2:
    Dan Harris
    On the Origin of CSS: Evolution of a Stylesheet"

"11:50" = "Room 1:	
    Dasith Wijesiriwardena
    Modern Authentication 101

Room 2:
    Scott Cabot
    Making gaming accessible: Leveraging cloud services to build games everyone can play"

"12:35" = "Level 8 foyer:

    Lunch"

"13:20" = "Room 1:
    Ming Johanson
    What to do with our unconscious bias.

Room 2:
    William Tulloch
    It's 2019, time to talk about web components (again)"

"14:10" = "Room 1:	
    Jaime Febres
    TypeScript: Beyond 101
        
Room 2:
    Amy Kapernick
    CSS Grid - What is this Magic?!"

"15:00" = "Room 1:
    Ashley Mannix
    A run through a .NET runtime - How does my app actually work?
        
Room 2:
    Jess Budd
    Making React Apps Accessible: It's easier than you think"

"15:45" ="Level 8 foyer:

    Afternoon tea"

"16:10" = "Room 1:
    Liam McLennan
    Turning great individuals into a great team
        
Room 2:
    Josh Parnham
    Micro Frontends: Breaking up your Monolithic User Interface"

"17:00" = "Room 1:
    Locknote - Matt Fitzgerald
    Working in a High-Frequency Organization"

"17:45" = "Room 1:
    Prize Draw, Thank Yous, and Wrap Up"

"18:15" = "After Conference Social"

"23:58" = "Time to go to sleep!"
"23:59" = "Zzzzzzzzzzzzzzzzzzzz"
}


# testing bits
$t = [DateTime]::Today.AddHours(7)
if ($Test.IsPresent) {
    $delay = 2
} else {
    $delay = 60
}

do {
    Clear-Host

    if ($Test.IsPresent) {
        $now = $t
        $t = $t.AddMinutes(15)
    } else {
        $now = [datetime]::Now
    }

    $decimalNow = $now.TimeOfDay

    $onNow = ($data.Keys | Where-Object { ([TimeSpan] $_) -le $decimalNow } | Select-Object -Last 1)

    $onNext = ($data.Keys | Where-Object { ([TimeSpan] $_) -gt $decimalNow } | Select-Object -first 1)

    [Console]::ForegroundColor = [System.ConsoleColor]::Red
    [Console]::Write("D")
    [Console]::ForegroundColor = [System.ConsoleColor]::Yellow
    [Console]::Write("D")
    [Console]::ForegroundColor = [System.ConsoleColor]::DarkGreen
    [Console]::Write("D")
    [Console]::ForegroundColor = [System.ConsoleColor]::White
    Write-Host " Adelaide"
    Write-Host "============"
    Write-Host ""
    Write-Host "On Now"
    Write-Host "------"
    Write-Host ""
    Write-Host $data[$onNow]
    Write-Host ""
    Write-Host "At $onNext"
    Write-Host "--------"
    Write-Host ""
    Write-host $data[$onNext]

    [Console]::SetCursorPosition([Console]::BufferWidth - 9, [Console]::BufferHeight - 2)
    Write-Host ($now.ToString("hh:mm tt"))

    Start-Sleep -Seconds $delay
} while ($true)