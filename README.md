# s[ug]id-clearer
The `s[ug]id-clearer` is a shell script that reads a list of files and disables their S[UG]ID bits to enhance system security. Manual auditing of these files is crucial to ensure that essential binaries are not inadvertently affected, which could lead to the system not functioning as expected.

## Usage
```
usage: sugid-clearer [-c|--clear] [-f|--file]
```

## Examples
Find files with either the SUID or SGID bit enabled:
```
$ sugid-clearer
S[UG]ID files
---s--x--- 1 root dbus 141K Mar  2  2025 /usr/lib/dbus-daemon-launch-helper
-rws--x--x 1 root root 327K Oct 25 10:36 /usr/lib/ssh/ssh-keysign
-rwsr-xr-x 1 root root 19K Jan 15  2025 /usr/lib/polkit-1/polkit-agent-helper-1
-rwsr-xr-x 1 root root 79K Jun 27  2025 /usr/bin/passwd
-rwsr-xr-x 1 root root 252K Aug 14 17:41 /usr/bin/sudo
-rwsr-sr-x 1 root root 27K Jun 19  2025 /usr/bin/unix_chkpwd
-rwsr-xr-x 1 root root 27K Jan 15  2025 /usr/bin/pkexec
```

Disable SUID and SGID bits for the files listed in `/etc/sugid-clearer/sugid_files.txt`:
```
# sugid-clearer -c
/usr/bin/gpasswd: S[UG]ID bit turned off
/usr/bin/groupmems: S[UG]ID bit turned off
/usr/bin/passwd: S[UG]ID bit turned off
/usr/bin/mount: S[UG]ID bit turned off
/usr/bin/umount: S[UG]ID bit turned off
/usr/lib/Xorg.wrap: S[UG]ID bit turned off
```

## Installation
### From git
```
git clone https://github.com/programadoroccidental/sugid-clearer
cd sugid-clearer
sudo make install
```

### Arch Linux
`s[ug]id-clearer` is available in the [Arch User Repository](https://aur.archlinux.org/packages/sugid-clearer).

```
paru -S sugid-clearer  # or your preferred AUR install method
