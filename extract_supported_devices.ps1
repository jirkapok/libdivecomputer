$file = 'src\descriptor.c'

$found = Select-String $file -pattern '{"(?<Manufacturer>.*)", "{1}(?<Model>.*)",' -AllMatches


$template = "# Supported devices`r`n`r`n"
$template += "| Manufacturer | Device |`r`n"
$template += "| --- | --- |`r`n"


$found.Matches | Foreach-Object { 
    $template += "| $($_.Groups[1].value) | $($_.Groups[2].value) |`r`n"
}

$template | Out-File -FilePath 'supported_devices.md' -Encoding utf8