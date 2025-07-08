<div align="center">

# 🛡️ RSV-TOOLKIT 🛡️

**A command-line toolkit for pentesters and security researchers, designed to streamline common tasks in Kali Linux.**

</div>

<p align="center">
  <img src="https://img.shields.io/github/license/ravisairockey/RSV-TOOLKIT?style=for-the-badge&color=blue" alt="License">
  <img src="https://img.shields.io/github/stars/ravisairockey/RSV-TOOLKIT?style=for-the-badge&color=yellow" alt="Stars">
  <img src="https://img.shields.io/github/forks/ravisairockey/RSV-TOOLKIT?style=for-the-badge&color=green" alt="Forks">
  <img src="https://img.shields.io/github/issues/ravisairockey/RSV-TOOLKIT?style=for-the-badge&color=red" alt="Issues">
</p>

---

## ✨ Features

This toolkit provides a menu-driven interface for:

-   **Transfile**: Generate one-liners for transferring files to Windows or Linux targets using various methods like `wget`, `PowerShell`, `certutil`, `netcat`, and `scp`.
-   **Proxify**: Quickly set up reverse proxy connections using `ligolo` or `chisel`. It provides the necessary commands for both the attacker (Kali) and target machines.
-   **Autorecon Init**: Automate the initial setup for a new target machine for reconnaissance with `autorecon`. It creates a dedicated directory, sets up a CherryTree template, and starts `autorecon`.
-   **gMSA Hash Cracker**: Crack the NTLM hash from a Group Managed Service Account's `msDS-ManagedPassword` data blob.

---

## 🚀 Getting Started

### Prerequisites

-   [Kali Linux](https://www.kali.org/) or a similar Debian-based distribution.
-   `tput` for text formatting (usually pre-installed).
-   `autorecon` for the Autorecon Init feature.
-   `ligolo` and `chisel` binaries for the Proxify feature.
-   `python3` and `pip` for the gMSA Hash Cracker.
-   `impacket` and `pycryptodomex` Python libraries. Install them with:
    ```bash
    pip install impacket pycryptodomex
    ```

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/ravisairockey/RSV-TOOLKIT.git
    cd RSV-TOOLKIT
    ```

2.  **Make the scripts executable:**
    ```bash
    chmod +x rsv-toolkit.sh gmsa_hash_cracker.py
    ```

### Running the Toolkit

To launch the toolkit, run the script from your terminal:

```bash
./rsv-toolkit.sh
```

---

## 🛠️ Usage

Upon running the script, you will be presented with a menu of options.

### **1. Transfile**
This option helps you generate commands to transfer files.
-   **Enter filename**: The name of the file you want to transfer (e.g., `shell.exe`).
-   **Platform (w/l)**: `w` for Windows targets, `l` for Linux targets.
-   **Port (default 80)**: The port your local web server is running on.

### **2. Proxify**
This option helps you set up a proxy.
-   **Platform (w/l)**: `w` for Windows targets, `l` for Linux targets.
-   **Method (l=ligolo/c=chisel)**: `l` for `ligolo`, `c` for `chisel`.

### **3. Autorecon Init**
This option initializes the reconnaissance process for a new machine.
-   **Enter machine name**: A name for the target machine (e.g., `HTB-Lame`). This will be used to create a directory.
-   You will then be prompted to enter the IP address for `autorecon`.

### **4. gMSA Hash Cracker**
This option takes the raw data blob from a gMSA's `msDS-ManagedPassword` attribute and calculates the corresponding NTLM hash.
-   **Blob**: Paste the blob as a single line of comma-separated byte values (e.g., `1,0,0,0,36,2,...`).
-   The script will output the calculated NTLM hash, which can be used for Pass-the-Hash attacks.

---

## 🤝 Contributing

Contributions are welcome! If you have ideas for new features, improvements, or bug fixes, feel free to open an issue or submit a pull request.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

<div align="center">
Crafted with ❤️ by <a href="https://github.com/ravisairockey">@RSVamil</a>
</div>
