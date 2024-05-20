# Clip OTP from 1password

## Feature

Just run `clipotp.ps1` to copy the OTP to the clipboard.

## Require condition

- This is a powershell script, so you can only run on Windows.
- Install 1password-cli and enable `Integrate with 1Password CLI` on 1password(Desktop app).
    - The official document is [here](https://developer.1password.com/docs/cli/get-started).
- Create `config/clipotp.json` before using.
    - Please refer to `clipotp.json.example` for creating.

## Usage

Create a shortcut to your desktop.

```
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy RemoteSigned -File "C:\<<<The path to clipotp.ps1>>>"
```