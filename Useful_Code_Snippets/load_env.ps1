# Load .env into current PowerShell process environment (safe)
$path = ".\.env"
$lineNo = 0

Get-Content -LiteralPath $path | ForEach-Object {
  $lineNo++
  $raw = $_

  # Trim whitespace
  $line = $raw.Trim()

  # Skip blanks and comments
  if ([string]::IsNullOrWhiteSpace($line)) { return }
  if ($line.StartsWith("#")) { return }

  # Allow optional "export KEY=VALUE"
  if ($line.StartsWith("export ")) {
    $line = $line.Substring(7).Trim()
  }

  # Must contain '='
  if (-not $line.Contains("=")) {
    Write-Host "Skipping line $lineNo (no '='): $raw"
    return
  }

  # Split only on first '='
  $kv = $line.Split("=", 2)
  if ($kv.Count -ne 2) {
    Write-Host "Skipping line $lineNo (bad split): $raw"
    return
  }

  # Remove BOM/zero-width chars that can break keys
  $key = ($kv[0] -replace "^\uFEFF", "" -replace "[\u200B-\u200D\u2060]", "").Trim()
  $val = ($kv[1]).Trim()

  # Validate key
  if ([string]::IsNullOrWhiteSpace($key)) {
    Write-Host "Skipping line $lineNo (empty key): $raw"
    return
  }

  # Strip surrounding quotes in value
  if (($val.StartsWith('"') -and $val.EndsWith('"')) -or ($val.StartsWith("'") -and $val.EndsWith("'"))) {
    if ($val.Length -ge 2) {
      $val = $val.Substring(1, $val.Length - 2)
    }
  }

  [System.Environment]::SetEnvironmentVariable($key, $val, "Process")
}
