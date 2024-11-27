# Cybersecurity Piscine – ft_otp

**Nothing ever lasts forever... except secure one-time passwords.**

---

## Summary

**ft_otp** is a project in the Cybersecurity Piscine that focuses on implementing a TOTP (Time-based One-Time Password) system. You will create a program capable of generating secure, ephemeral passwords based on a master key and timestamps, following the RFC 6238 specification. This project emphasizes security best practices, cryptographic algorithms, and secure file handling.

---

## Features

### Core Functionality

1. **Key Management**:
   - Generate and store a secure hexadecimal key in an encrypted file (`ft_otp.key`).

2. **One-Time Password Generation**:
   - Generate secure 6-digit passwords based on the HOTP algorithm (RFC 4226).
   - Ensure the generated password is ephemeral and changes based on the timestamp.

3. **Command-Line Interface**:
   - **`-g`**: Save the provided hexadecimal key securely.
   - **`-k`**: Generate a one-time password using the stored key.

---

## Structure

### Directories and Files

- **`src/`**:
  - Contains the implementation of the `ft_otp` program.
  - Includes functions for key encryption, HOTP calculation, and file management.

- **`Makefile`**:
  - Automates compilation (if applicable) and sets up the program environment.

---

## Usage

### Command Syntax

The program accepts the following arguments:
```bash
./ft_otp -g <key_file>
./ft_otp -k <key_file>
```

### Key Management
Generate and save a key:

```
./ft_otp -g key.hex
```
The key must be a minimum of 64 hexadecimal characters.
Saved securely in an encrypted file (ft_otp.key).

### Example:
```
$ echo -n "NEVER GONNA GIVE YOU UP" > key.txt
$ ./ft_otp -g key.txt
./ft_otp: error: key must be 64 hexadecimal characters.
$ cat key.hex | wc -c
64
$ ./ft_otp -g key.hex
Key was successfully saved in ft_otp.key.
```
## One-Time Password Generation
### Generate a 6-digit password:
```
./ft_otp -k ft_otp.key
```

### Example:
```
$ ./ft_otp -k ft_otp.key
836492
$ sleep 60
$ ./ft_otp -k ft_otp.key
123518
```

### Verification
You can verify the correctness of your program using tools like Oathtool:
```
oathtool --totp $(cat key.hex)
```

## Requirements
### Mandatory Part
Key Storage:
Encrypt and store the provided key in ft_otp.key.

### Password Generation:
Implement the HOTP algorithm (RFC 4226).
Generate 6-digit passwords that vary with time.
### Error Handling:
Handle invalid key lengths and missing arguments gracefully.
### External Tools:
Use libraries or functions for accessing system time but avoid using prebuilt TOTP libraries.
Learning Outcomes
### Cryptographic Algorithms:
Understand and implement HOTP (RFC 4226).
### Secure File Handling:
Safely store and retrieve sensitive data like encryption keys.
### Security Awareness:
Learn the importance of ephemeral passwords in protecting sensitive systems.

ft_otp – A step toward better password security! 🔒
