# Get each file within the chosen directory, resursively.  Get the MD5 hash for each of those files. 
$HashedFiles = Get-ChildItem -Path "C:\Users\Admin\Desktop\Dupe-Test" -Recurse -File | Get-FileHash -Algorithm MD5

# Group-Object is used to retrieve a count on all hashes.  The hashes with counts greater than 1 (duplicates) are kept.
$Duplicates = $HashedFiles | Group-Object -Property Hash -NoElement | Where-Object -Property Count -GT 1

# Only keep files whos hashes match duplicate hashes.  Sort to keep the output organized.
$Output = $HashedFiles | Where-Object {$_.Hash -in $Duplicates.Name} | Sort-Object -Property Hash

# Save output to CSV.
$Output | Export-CSV -Path "Results.CSV"
