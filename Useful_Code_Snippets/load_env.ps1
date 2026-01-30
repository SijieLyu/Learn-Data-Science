# load-env.ps1
param(
  [string]$EnvPath = ".\.env"
)

$ErrorActionPreference = "Stop"

function Remove-BomAndZeroWidth([string]$s) {
  if ($null -eq $s) { return $s }
  return ($s -replace "^\uFEFF","" -replace "[\u200B-\u200D\u2060]","")
}

function Is-CommentOrBlank([string]$line) {
  if ([string]::IsNullOrWhiteSpace($line)) { return $true }
  $t = $line.Trim()
  return $t.StartsWith("#")
}

function Strip-OuterQuotes([string]$val) {
  if ($null -eq $val) { return $val }
  $v = $val.Trim()
  if ($v.Length -ge 2) {
    if (($v.StartsWith('"') -and $v.EndsWith('"')) -or ($v.StartsWith("'") -and $v.EndsWith("'"))) {
      return $v.Substring(1, $v.Length - 2)
    }
  }
  return $val.Trim()
}

function Get-BracketDelta([string]$s) {
  # Counts [ and ] while ignoring content inside quotes (simple JSON-safe approach)
  $inString = $false
  $escape = $false
  $delta = 0

  foreach ($ch in $s.ToCharArray()) {
    if ($escape) { $escape = $false; continue }
    if ($ch -eq "\") { if ($inString) { $escape = $true }; continue }
    if ($ch -eq '"') { $inString = -not $inString; continue }

    if (-not $inString) {
      if ($ch -eq '[') { $delta++ }
      elseif ($ch -eq ']') { $delta-- }
    }
  }
  return $delta
}

$lines = Get-Content -LiteralPath $EnvPath

$inJson = $false
$jsonKey = ""
$jsonBuffer = New-Object System.Collections.Generic.List[string]
$bracketBalance = 0

for ($i = 0; $i -lt $lines.Count; $i++) {
  $raw = $lines[$i]
  $line = $raw.Trim()

  if (-not $inJson) {
    if (Is-CommentOrBlank $line) { continue }

    # allow "export KEY=VALUE"
    if ($line.StartsWith("export ")) { $line = $line.Substring(7).Trim() }

    if (-not $line.Contains("=")) { continue }

    $kv = $line.Split("=", 2)
    $key = Remove-BomAndZeroWidth($kv[0]).Trim()
    $val = $kv[1]  # keep as-is (may be blank for multiline start)

    if ([string]::IsNullOrWhiteSpace($key)) { continue }

    # ---- MULTILINE JSON START ----
    if ($key -eq "DR_TARGETS_JSON") {
      $inJson = $true
      $jsonKey = $key
      $jsonBuffer.Clear()

      # Add whatever is after '=' on the same line (could be empty)
      $first = $val.Trim()
      if ($first.Length -gt 0) {
        $jsonBuffer.Add($first)
        $bracketBalance = Get-BracketDelta($first)
      } else {
        $bracketBalance = 0
      }

      # If JSON was single-line and balanced, finalize immediately
      if ($bracketBalance -eq 0 -and $jsonBuffer.Count -gt 0) {
        $jsonText = ($jsonBuffer -join "`n").Trim()
        [System.Environment]::SetEnvironmentVariable($jsonKey, $jsonText, "Process")
        $inJson = $false
        $jsonKey = ""
      }

      continue
    }

    # ---- NORMAL KEY=VALUE ----
    $valueFinal = Strip-OuterQuotes($val)
    [System.Environment]::SetEnvironmentVariable($key, $valueFinal, "Process")
  }
  else {
    # We are inside DR_TARGETS_JSON multiline block
    if (Is-CommentOrBlank $line) { continue }  # ignore blank/comment lines inside block

    # append raw (trimmed) line
    $jsonBuffer.Add($line)

    $bracketBalance += Get-BracketDelta($line)

    if ($bracketBalance -eq 0 -and $jsonBuffer.Count -gt 0) {
      $jsonText = ($jsonBuffer -join "`n").Trim()
      [System.Environment]::SetEnvironmentVariable($jsonKey, $jsonText, "Process")

      # reset
      $inJson = $false
      $jsonKey = ""
      $jsonBuffer.Clear()
      $bracketBalance = 0
    }
  }
}

if ($inJson) {
  throw "DR_TARGETS_JSON block did not close properly. Check brackets in .env."
}

Write-Host "Loaded .env into current PowerShell session."

