# Generate SSH Keypair

```shell
mkdir .ssh;

# GENERATE KEYPAIR
ssh-keygen -t ed25519 -C "example@gmail.com" -f .ssh/id-ed25519 -q -N 'pw123'
ssh-keygen -t ed25519 -C "example@gmail.com" -f .ssh/id-ed25519 -q -N ''

# VERIFY PASSPHRASE
ssh-keygen -y -f .ssh/id-ed25519
```

# Permissions

| File / Dir                      | Permission       |
| ------------------------------- | ---------------- |
| .ssh/                           | 700 (drwx------) |
| public key (.pub file)          | 644 (-rw-r--r--) |
| private key (id_rsa)            | 600 (-rw-------) |
| Configuration file: .ssh/config | 600 (-rw-------) |
| authorized_keys                 | 600 (-rw-------) |
| known_hosts                     | 600 (-rw-------) |

## References

> https://www.tecmint.com/set-ssh-directory-permissions-in-linux/ > https://jonasbn.github.io/til/ssh/permissions_on_ssh_folder_and_files.html
