$src = Get-Content 'oscar_francisco_cv_v14_2.html' -Encoding UTF8 -Raw
$match = [regex]::Match($src, 'src="(data:image[^"]+)"')
if ($match.Success) {
    $photoSrc = $match.Groups[1].Value
    Write-Host "Found photo, length: $($photoSrc.Length)"
    # Now replace the truncated placeholder in index.html
    $idx = Get-Content 'index.html' -Encoding UTF8 -Raw
    $placeholder = 'src="data:image/png;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gHYSUNDX1BST0ZJTEUAAQEAAAHIAAAAAAQwAABtbnRyUkdCIFhZWiAH4AABAAEAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAACRyWFlaAAABFAAAABRnWFlaAAABKAAAABRiWFlaAAABPAAAABR3dHB0AAABUAAAABRyVFJDAAABZAAAAChnVFJDAAABZAAAAChiVFJDAAABZAAAAChjcHJ0AAABjAAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAAgAAAAcAHMAUgBHAEJYWVogAAAAAAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9YWVogAAAAAAAA9tYAAQAAAADTLXBhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABtbHVjAAAAAAAAAAEAAAAMZW5VUwAAACAAAAAcAEcAbwBvAGcAbABlACAASQBuAGMALgAgADIAMAAxADb/2wBDAA..."'
    $replacement = "src=`"$photoSrc`""
    $idx = $idx.Replace($placeholder, $replacement)
    Set-Content -Path 'index.html' -Value $idx -Encoding UTF8
    Write-Host "Photo replaced in index.html"
} else {
    Write-Host "Photo not found in source"
}
