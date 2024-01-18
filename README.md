This is a very silly script that chooses a random quote from the $waterQuotes array and sends it to a selection of emails at certain times throughout the day.


To run this yourself, firstly edit the "#set esub & ebod" section. These if statements are not the best way to check, however they do in a pinch. Ensure that you include the * wildcard if you're only checking for the hour.

If you want, edit the list of quotes. I took these from ChatGPT and made a few up myself.

Once you've edited all the times that it is checking for, you need to run the script.
Feed in the arguments in the order of SMTPServer, FromAddress, ToAddress
For example ".\HydrationQueen.ps1 EmailServer.domain.com Hydration.Queen@domain.com Thirsty.Recipient@domain.com"

I run this as a scheduled task. Again, probably not the most effective but I have multiple daily triggers that line up with the time checks in the script (this does feel like I've duplicated work, however I wanted to include the time in the email)

Hopefully this helps you stay hydrated
