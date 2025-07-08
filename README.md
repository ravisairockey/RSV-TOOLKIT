<div align="center">

<h1 align="center">🛡️ RSV-TOOLKIT 🛡️</h1>

<p align="center">
  <strong>A command-line toolkit for pentesters and security researchers, designed to streamline common tasks in Kali Linux.</strong>
</p>

</div>

---

<p align="center">
  <a href="#-features">Features</a> •
  <a href="#-getting-started">Getting Started</a> •
  <a href="#️-usage">Usage</a> •
  <a href="#-contributing">Contributing</a> •
  <a href="#-license">License</a>
</p>

---

## ✨ Features

| Feature            | Description                                                                                                                            |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------- |
| **Transfile**      | Generate one-liners for transferring files to Windows or Linux targets using `wget`, `PowerShell`, `certutil`, `netcat`, and `scp`.      |
| **Proxify**        | Quickly set up reverse proxy connections using `ligolo` or `chisel`. Provides commands for both the attacker and target machines.        |
| **Autorecon Init** | Automate the initial setup for `autorecon`. Creates a dedicated directory, sets up a CherryTree template, and starts the scan.          |
| **gMSA Cracker**   | Crack the NTLM hash from a Group Managed Service Account's `msDS-ManagedPassword` data blob, ready for Pass-the-Hash attacks.          |

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

---

## 🛠️ Usage

To launch the toolkit, run the script from your terminal:

```bash
./rsv-toolkit.sh
```

You will be presented with a menu of options to choose from.

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
