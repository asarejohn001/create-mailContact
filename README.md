# Mail Contact
In Exchange Online organizations, mail contacts are mail-enabled objects that contain information about people outside the organization.
Learn more about mail contact at https://learn.microsoft.com/en-us/exchange/recipients-in-exchange-online/recipients-in-exchange-online

## Script
The script [create-mailContact.ps1](create-mailContact.ps1) helps 365 engineers and administrators create multiple mail contacts in their environment. 
It imports the [ExchangeOnlineManagement module](https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell-v2?view=exchange-ps). It uses the [New-MailContact](https://learn.microsoft.com/en-us/powershell/module/exchange/new-mailcontact?view=exchange-ps) cmdlet, with the help of a for statement, to loop through a CSV file that has the DisplayName, ExternalEmailAddress, and Alias to create the Mail Contact.

### Important!
> [!IMPORTANT]  
> Please ensure you have changed the variables in the script to fit your environment. $logFilePath and $csvFilePath need to be set to fit your environment.
