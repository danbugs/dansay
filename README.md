# dansay

This is a test application for CI/CD for C++ console apps.

These are the supported targets:
- linux target: x86_64-unknown-linux-gnu
- windows target: x86_64-pc-windows-msvc
- osx target: x86_64-apple-darwin17.7.0

## How to install on MacOS and Linux?

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/danbugs/dansay/main/install.sh)"
```

## How to install on Windows?

```
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/danbugs/dansay/main/install.ps1'))
```

## How to use?

If you enter:
```
dansay hello
```

... You get:
```
hello
```