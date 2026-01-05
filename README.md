# s[ug]id-clearer
The `s[ug]id-clearer` is a shell script that reads a list of files and disables their S[UG]ID bits to enhance system security. Manual auditing of these files is crucial to ensure that essential binaries are not inadvertently affected, which could lead to the system not functioning as expected.

## Usage
```
usage: sugid-clearer [-c|--clear] [-f|--file]
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
