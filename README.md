Kitty quick-access terminal with Karabiner

Network shares only appear under /Volumes after macOS mounts them. Macintosh HD is the local system disk; the SMB share should appear separately as /Volumes/Media.

Mount the SMB shares
open "smb://192.168.0.110/Media"
open "smb://192.168.0.110/Vault"

Verify:

ls -la /Volumes
mount | grep smbfs
ls -la "/Volumes/Media/music"

Configure Kew:

kew path "/Volumes/Media/music/"
kew
Karabiner rule

Add this complex modification to Karabiner-Elements:

{
    "description": "Command-Space toggles kitty quick access",
    "manipulators": [
        {
            "type": "basic",
            "from": {
                "key_code": "spacebar",
                "modifiers": {
                    "mandatory": ["command"],
                    "optional": ["any"]
                }
            },
            "to": [
                {
                    "shell_command": "cd \"$HOME\" && nohup /Applications/kitty.app/Contents/MacOS/kitten quick-access-terminal --instance-group global-quick-access >/tmp/kitty-quick-access.log 2>&1 &"
                }
            ]
        }
    ]
}

Do not replace the command with open -a kitty --args ...; that launches a normal Kitty window instead of the hovering quick-access terminal.

Useful troubleshooting command:

cat /tmp/kitty-quick-access.log
