$src = "oscar_francisco_cv_v14_2.html"
$lines = Get-Content $src -Encoding UTF8

# CSS: lines index 1..835 (file lines 2-836, skipping <style> tag on line 1 and </style> on line 837)
$css = $lines[1..835] -join "`n"
Set-Content -Path "oscar_cv.css" -Value $css -Encoding UTF8
Write-Host "CSS saved: $($lines[1..835].Count) lines"

# JS: lines index 1310..1485 (file lines 1311-1486, skipping <script> and </script> wrapper lines)
$js = $lines[1310..1485] -join "`n"
Set-Content -Path "oscar_cv.js" -Value $js -Encoding UTF8
Write-Host "JS saved: $($lines[1310..1485].Count) lines"

Write-Host "Done."
