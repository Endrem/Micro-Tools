# Set the folder that we want to save unique files to.
# This folder should be empty.
$OutputFolder = 'C:\Users\Admin\Desktop\Deduped'

# Get each file within the chosen directory, resursively.  Get the MD5 hash for each of those files. 
$HashedFiles = Get-ChildItem -Path "C:\Users\Admin\Desktop\Duped" -Recurse -File | Get-FileHash -Algorithm MD5

# The 'Unique' flag for Sort-Object will eliminate duplicate members of the property (Hash).
$UniqueFiles = $HashedFiles | Sort-Object -Property Hash -Unique | Select-Object Path

# Take the unique list and copy the selected file to the output folder.
# Copy-Item's default behavior will be to overwrite existing files.  We have to rename files if they already exist.
$UniqueFiles | ForEach-Object {
    $SourcePath = $_.Path
    $File = [System.IO.Path]::GetFileNameWithoutExtension($SourcePath)
    $Extension = [System.IO.Path]::GetExtension($SourcePath)

    $Destination = ($OutputFolder + '\' + $File + $Extension)

    # Rename destination if it already exists.
    If (Test-Path $Destination) {
        $Iterator = 0
        While (Test-Path $Destination) {
            $Iterator += 1
            $Destination = ($OutputFolder + '\' + $File + $Iterator + $Extension)
        }
    }

    # Copy the file to the destination folder.
    # LiteralPath removes characters that throw wildcard errors during Copy-Item operation.
    Copy-Item -LiteralPath $SourcePath -Destination $Destination
}