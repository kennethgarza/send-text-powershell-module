# Send-Text Powershell Module
## Overview
Powershell module can be used to send text over a Remote Desktop Connection, when copy and pasting text is blocked.  This is essentially a very simple key stroke emulator.

## How to Setup
1. Create Folder `C:\Windows\System32\WindowsPowerShell\v1.0\Modules\SendText`
2. Download `SendText.psm1` and put in the created directory
3. Restart Powershell session if needed

## How to Use

```powershell
Send-Text "Text to send"
```
Default timeout is 5 seconds, within the timeout navigate to where you want the text to be typed out.  
Wait.  
DO NOT MESS WITH THE MOUSE OR KEYBOARD AS IT WILL DISRUPT THE TYPING.

## Other Usages

```powershell
## Explicit parameters
Send-Text -Text "text to send" -Seconds 10

## standard usage with timer set to 10 seconds
Send-Text "text to send" 10
```

## macOS zsh Version

A shell version is included for macOS at `send-text.sh` in the repository root.

### Setup
1. Ensure Terminal has Accessibility permissions in **System Settings > Privacy & Security > Accessibility**.
2. Make script executable if needed:

```zsh
chmod +x send-text.sh
```

### Usage

```zsh
./send-text.sh "Text to send"
./send-text.sh "Text to send" 10
```

## Caveats
* `Send-Text` (PowerShell module) works on Windows platforms as it uses `System.Windows.Forms`. Use `send-text.sh` for macOS zsh.  
* Some non latin characters do not work.  I tried with Chinese characters and it failed.
* Special Characters needs to be wrapped in `{}`, for example 

```powershell
## want to send "Hello $$$"
Send-Text "Hello {$}{$}{$}"
```

## Other cool stuff
You can use command keys (such as Enter, or DEL keys as well)  
https://www.jesusninoc.com/11/05/simulate-key-press-by-user-with-sendkeys-and-powershell/


## Credits
I take no credit for this.  I didnt write it. I stole most of it from a post on stackoverflow and I do not remember where. 

I find this tool to be extremely useful.  Hope you do as well.
