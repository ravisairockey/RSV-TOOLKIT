# RSV-TOOLKIT

![RSV-TOOLKIT](https://raw.githubusercontent.com/ravisairockey/RSV-TOOLKIT/main/RSV-TOOLKIT.png)

A command-line toolkit for pentesters and security researchers, designed to streamline common tasks in Kali Linux. This toolkit provides a menu-driven interface for file transfers, proxying, and reconnaissance setup.

---

## ❯ Features

- **Transfile**: Generate one-liners for transferring files to Windows or Linux targets using various methods like `wget`, `PowerShell`, `certutil`, `netcat`, and `scp`.
- **Proxify**: Quickly set up reverse proxy connections using `ligolo` or `chisel`. It provides the necessary commands for both the attacker (Kali) and target machines.
- **Autorecon Init**: Automate the initial setup for a new target machine for reconnaissance with `autorecon`. It creates a dedicated directory, sets up a CherryTree template, and starts `autorecon`.

---

## ❯ Getting Started

### Prerequisites

- [Kali Linux](https://www.kali.org/) or a similar Debian-based distribution.
- `tput` for text formatting (usually pre-installed).
- `autorecon` for the Autorecon Init feature.
- `ligolo` and `chisel` binaries for the Proxify feature.

### Installation

1.  **Clone the repository (or download the script):**
    ```bash
    git clone https://github.com/your-username/RSV-TOOLKIT.git
    cd RSV-TOOLKIT
    ```
    *Alternatively, you can just use the `rsv-toolkit.sh` script you have.*

2.  **Make the script executable:**
    ```bash
    chmod +x rsv-toolkit.sh
    ```

### Running the Toolkit

To launch the toolkit, run the script from your terminal:

```bash
./rsv-toolkit.sh
```

---

## ❯ Usage

Upon running the script, you will be presented with a menu of options.

```
RRRRRRRRRRRRRRRRR      SSSSSSSSSSSSSSS VVVVVVVV           VVVVVVVV
R::::::::::::::::R   SS:::::::::::::::SV::::::V           V::::::V
R::::::RRRRRR:::::R S:::::SSSSSS::::::SV::::::V           V::::::V
RR:::::R     R:::::RS:::::S     SSSSSSSV::::::V           V::::::V
  R::::R     R:::::RS:::::S             V:::::V           V:::::V
  R::::R     R:::::RS:::::S              V:::::V         V:::::V
  R::::RRRRRR:::::R  S::::SSSS            V:::::V       V:::::V
  R:::::::::::::RR    SS::::::SSSSS        V:::::V     V:::::V
  R::::RRRRRR:::::R     SSS::::::::SS       V:::::V   V:::::V
  R::::R     R:::::R       SSSSSS::::S       V:::::V V:::::V
  R::::R     R:::::R            S:::::S       V:::::V:::::V
  R::::R     R:::::R            S:::::S        V:::::::::V
RR:::::R     R:::::RSSSSSSS     S:::::S         V:::::::V
R::::::R     R:::::RS::::::SSSSSS:::::S          V:::::V
R::::::R     R:::::RS:::::::::::::::SS            V:::V
RRRRRRRR     RRRRRRR SSSSSSSSSSSSSSS               VVV

crafted by @RSVamil | GitHub :- https://github.com/ravisairockey

Choose option:
1) Transfile
2) Proxify
3) Autorecon Init
Enter choice:
```

### 1. Transfile

This option helps you generate commands to transfer files.

-   **Enter filename**: The name of the file you want to transfer (e.g., `shell.exe`).
-   **Platform (w/l)**: `w` for Windows targets, `l` for Linux targets.
-   **Port (default 80)**: The port your local web server is running on.

### 2. Proxify

This option helps you set up a proxy.

-   **Platform (w/l)**: `w` for Windows targets, `l` for Linux targets.
-   **Method (l=ligolo/c=chisel)**: `l` for `ligolo`, `c` for `chisel`.

### 3. Autorecon Init

This option initializes the reconnaissance process for a new machine.

-   **Enter machine name**: A name for the target machine (e.g., `HTB-Lame`). This will be used to create a directory.
-   You will then be prompted to enter the IP address for `autorecon`.

---

## ❯ Contributing

Contributions are welcome! If you have ideas for new features, improvements, or bug fixes, feel free to open an issue or submit a pull request.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

---

## ❯ License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

Crafted with ❤️ by [@RSVamil](https://github.com/ravisairockey)
