# Mail Contact
In Exchange Online organizations, mail contacts are mail-enabled objects that contain information about people outside the organization.
Learn more about mail contact at https://learn.microsoft.com/en-us/exchange/recipients-in-exchange-online/recipients-in-exchange-online

## Script
The script [create-mailContact.ps1](create-mailContact.ps1) help 365 engineers and administrators creates multiple mail contact in their environment. 
It imports the [ExchangeOnlineManagement module](https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell-v2?view=exchange-ps) and uses the [New-MailContact](https://learn.microsoft.com/en-us/powershell/module/exchange/new-mailcontact?view=exchange-ps) cmdlet, with the help of a for statemnet, to loop through a csv file that has the DisplayName, ExternalEmailAddress, and Alias to create the Mail Contact.

### Warnings and cautions
> [!IMPORTANT]  
> Crucial information necessary for users to succeed.
