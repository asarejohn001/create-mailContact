<#
Author: John Asare
Date: 09/19/2024

Description: Read more about this script from 
#>

# Install module if not already
#Install-Module -Name ExchangeOnlineManagement -Force -AllowClobber

# Import the exchangeonline module
Import-Module ExchangeOnlineManagement

# Fucntion to log output
function Get-Log {
    param (
        [string]$LogFilePath,
        [string]$LogMessage
    )

    # Create the log entry with the current date and time
    $logEntry = "{0} - {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $LogMessage

    # Append the log entry to the log file
    Add-Content -Path $LogFilePath -Value $logEntry
}

# Define the log file path
$logFilePath = ".\log.txt"

# Connect to EXO
try {
    # Attempt to connect to Exchange Online
    Connect-ExchangeOnline -UserPrincipalName 'example@domain.com' -ErrorAction Stop
    Get-Log -LogFilePath $logFilePath -LogMessage "Successfully connected to Exchange Online."
    
} catch {
    # Handle the error if connection fails
    Get-Log -LogFilePath $logFilePath -LogMessage "Failed to connect to Exchange Online. Exiting script. Error details: $_"
    Write-Host "Couldn't connect to EXO. Check log file"
    exit
}

# Import the CSV file and create mail contacts
$csvFilePath = "C:\path\to\your\contacts.csv"

# Import the CSV file
$contacts = Import-Csv -Path $csvFilePath

# Loop through each contact and create a new mail contact
foreach ($contact in $contacts) {
    try {
        New-MailContact -DisplayName $contact.DisplayName `
                        -ExternalEmailAddress $contact.ExternalEmailAddress `
                        -Alias $contact.Alias `

        # Log success message
        Get-Log -LogFilePath $logFilePath -LogMessage "Successfully created contact: $($contact.Name)"
    }
    catch {
        # Log error message
        Get-Log -LogFilePath $logFilePath -LogMessage "Error occurred while creating contact: $($contact.Name). Error: $($_.Exception.Message)"
        Write-Error "Error occurred while creating contact: $($contact.Name). Error: $($_.Exception.Message)"
    }
}
