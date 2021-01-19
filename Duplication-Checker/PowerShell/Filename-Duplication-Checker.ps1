# Get all files (recursively) within the directory we want to scan.
$files = Get-ChildItem -Path "C:\Users\Admin\Desktop\Dupe-Test" -Recurse -File
# Ordered hashtable that holds all of the duplicates.
$masterdupe = [ordered]@{}

foreach($file in $files)
{
    $filename = ($file.BaseName + $file.Extension)

    # Saves steps by ignoring filenames that have already been checked.
    if($masterdupe.Contains($filename)){continue}

    $duplicates = @()
    foreach($dupefile in $files)
    {
        # If this is a match, it will add the path to the 'duplicates' array.
        if($filename -eq ($dupefile.BaseName + $dupefile.Extension))
        {
            $duplicates += $dupefile
        }
    }

    # If more than one (aka duplicates), the duplicates array is added to the hashtable using the Key $filename.
    if($duplicates.Count -gt 1)
    {
        $masterdupe.Add($filename, $duplicates)
    }
}
# Clear Results.txt before saving contents.
Clear-Content -Path 'Results.txt'

# Save the results by iterating through the Value of each Key.
$masterdupe.Keys | ForEach-Object{ Add-Content 'Results.txt' "$_ :`n`t $($masterdupe.$_)" }

# For saving the content as a CSV, use the following code:
# $masterdupe.GetEnumerator() | 
#     Select-Object -Property @{N='Filename';E={$_.Key}},
#     @{N='Duplicate Paths';E={$_.Value}} | 
#         Export-Csv -NoTypeInformation -Path 'Results.csv'