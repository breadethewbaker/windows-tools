# Generate a random Alphanumeric string
$alphanumericsWSymbols = (0x21..0x2C)+(0x30..0x39)+( 0x41..0x5A)+( 0x61..0x7A)
$alphanumericsWOSymbols = (0x30..0x39)+( 0x41..0x5A)+( 0x61..0x7A)

Function Get-RandomAlphanumericString {
	
	[CmdletBinding()]
	Param (
        [int] $length = 16,
		[bool] $symbols = $True
	)

	Begin{
	}

	Process{
		if ($symbols){
			Write-Output ( -join ($alphanumericsWSymbols | Get-Random -Count $length  | % {[char]$_}) )
		} else {
			Write-Output ( -join ($alphanumericsWOSymbols | Get-Random -Count $length  | % {[char]$_}) )
		}
	}	
}

#symbols block
$x="$(Get-RandomAlphanumericString)"
Set-Clipboard -Value $x
Write-Host "Password: ${x} has been copied to your clipboard, press Ctrl+V to paste it into the password prompt."
Write-Host "If you would like to use a password that does not contain symbols, press Enter. Otherwise, close this window."

Pause

#no symbols block
$x="$(Get-RandomAlphanumericString -symbols $False)"
Set-Clipboard -Value $x
Write-Host "Password: ${x} has been copied to your clipboard, press Ctrl+V to paste it into the password prompt."
Pause