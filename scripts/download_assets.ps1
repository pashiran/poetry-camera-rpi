# Download image assets from the original repository asset pages and save locally
# Usage: Right-click this file in VS Code and run with PowerShell, or run from a PowerShell prompt.

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$assetsDir = Join-Path $repoRoot 'assets'
if (-not (Test-Path $assetsDir)) {
  New-Item -ItemType Directory -Path $assetsDir | Out-Null
}

$items = @(
  @{ name = 'a7da1fae.png'; url = 'https://github.com/carolynz/poetry-camera-rpi/assets/1395087/a7da1fae-9521-431c-af47-5fe07e8dd43b' },
  @{ name = '43c619a8.png'; url = 'https://github.com/carolynz/poetry-camera-rpi/assets/1395087/43c619a8-a416-4c18-8013-4ff36d1d1ba6' },
  @{ name = 'ebbbc23e.png'; url = 'https://github.com/carolynz/poetry-camera-rpi/assets/1395087/ebbbc23e-1e92-4d5a-84de-f761f32720f3' },
  @{ name = 'd482c0de.png'; url = 'https://github.com/carolynz/poetry-camera-rpi/assets/1395087/d482c0de-cca5-4ce3-ae4e-0ebc0bef1693' },
  @{ name = '4fad7574.png'; url = 'https://github.com/carolynz/poetry-camera-rpi/assets/1395087/4fad7574-2933-448f-a556-d0d7990596ec' },
  @{ name = '209bbe14.png'; url = 'https://github.com/carolynz/poetry-camera-rpi/assets/1395087/209bbe14-b494-4826-8851-61561f4f34ac' },
  @{ name = 'b3507b14.png'; url = 'https://github.com/carolynz/poetry-camera-rpi/assets/1395087/b3507b14-3b12-4fbc-99fa-ffc5c589bf93' },
  @{ name = '5196a5ee.png'; url = 'https://github.com/carolynz/poetry-camera-rpi/assets/1395087/5196a5ee-d70e-4b69-91fd-e165cc368f7e' },
  @{ name = 'f1340f50.png'; url = 'https://github.com/carolynz/poetry-camera-rpi/assets/1395087/f1340f50-e492-4696-bd9f-2196155552ec' },
  @{ name = '90120571.png'; url = 'https://github.com/carolynz/poetry-camera-rpi/assets/1395087/90120571-7d96-4e9a-b14c-e1e6228f2403' },
  @{ name = 'dca36686.png'; url = 'https://github.com/carolynz/poetry-camera-rpi/assets/1395087/dca36686-fcfa-43ba-86f6-155bd1aab0e5' }
)

foreach ($item in $items) {
  $outFile = Join-Path $assetsDir $item.name
  if (Test-Path $outFile) {
    Write-Host "Skip (exists): $($item.name)"
    continue
  }
  Write-Host "Downloading: $($item.url) -> $($item.name)"
  try {
    Invoke-WebRequest -Uri $item.url -OutFile $outFile -ErrorAction Stop
    Write-Host "  Success: $($item.name)"
  } catch {
    Write-Warning "  Failed to download $($item.name): $_"
  }
}

Write-Host "Done. Saved assets to: $assetsDir"