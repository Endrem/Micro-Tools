[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
![C++](https://img.shields.io/badge/C++-C++20-blue.svg)
![PowerShell](https://img.shields.io/badge/powershell-7-blue.svg)
![Python](https://img.shields.io/badge/python-v3.9-blue.svg)
[![Donate](https://img.shields.io/badge/donate-PayPal-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=XH8R7VFJQE3YQ&currency_code=USD)

# Micro-Tools
Collection of small tools. (Written in various languages)

## Descriptions
### Arguments-Grabber (C++ | win-64)
Arguments that are passed to this program will be copied to the clipboard.  This program was originally created to grab magnet links from a web browser when copying was not an option.

### DDC-Hierarchy (PowerShell)
Creates a folder hierarchy based on the Dewey Decimal Classification.  This script utilizes the DDC23 classes and summaries set by OCLC (See: [ddc23-summaries.pdf](https://www.oclc.org/content/dam/oclc/dewey/ddc23-summaries.pdf)).  The hierarchy that will be created includes the main classes, hundred divisions, and thousand sections.

### Duplication-Checker (PowerShell)
Scans directories for duplicate files.  Two scripts are included to allow duplication checking based on either filename or MD5-hash.  The scripts do **not** delete duplicate files and instead, saves the list to a CSV file.

### Duplication-Corrector (PowerShell)
Scans and deduplicates files within a chosen directory.  The duplication checking uses MD5 hashing.  The script does **not** delete duplicate files and instead saves a copy of each unique file to a destination directory.

## Author
The contents of this repository were created by [Cole Chapman](https://github.com/Endrem/).

## License
"Micro-Tools" collection is made available under the [MIT License](https://choosealicense.com/licenses/mit/).
