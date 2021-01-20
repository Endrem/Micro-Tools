# Get each file within the chosen directory, resursively.
$Files = Get-ChildItem -Path "C:\Users\Admin\Desktop\Dupe-Test" -Recurse -File

# Group-Object is used to retrieve a count on all filenames.  The filenames with counts greater than 1 (duplicates) are kept.
$Duplicates = $Files | Group-Object -Property Name -NoElement | Where-Object -Property Count -GT 1

# Only keep files whos filenames match duplicate filenames.  Sort to keep the output organized.
$Output = $Files | Where-Object {$_.Name -in $Duplicates.Name} | Sort-Object -Property BaseName | Select-Object -Property Name, FullName

# Save output to file.
Set-Content -Path "Results.txt" -Value ($Output | Out-String)
