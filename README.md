# Linux-Phyrebird

**Linux-Phyrebird** is a quality-of-life wrapper that lets you run **Phyrebird** on Linux without manually installing Wine, Lutris, or Heroic.

Since Phyrebird doesn't have a native Linux build, this repo bundles it with a **portable Wine build** (`wine-11.1-amd64-wow64`) and a simple launch script so you can just clone, run, and play.

This project exists to let Linux users run Phyrebird easily by bundling it with a portable Wine build, avoiding the hassle of installing or configuring Wine, Lutris, or Heroic.

## Installation & Running

Clone the repository **recursively** (this is important for submodules):

```bash
git clone --recurse-submodules https://github.com/ilman01/Linux-Phyrebird.git
```

Enter the project directory:

```bash
cd Linux-Phyrebird
```

Make the launcher executable (if needed):

```bash
chmod +x ./run.sh
```

> **Important:** Make sure to add at least one song to `./phyrebird/Songs` before running Phyrebird, or the game will crash.

Run Phyrebird:

```bash
./run.sh
```

## Updating

To update both the repo and its submodules:

```bash
git pull origin main --recurse-submodules
```

## Important Notes

Please read these, Phyrebird *will* crash if they’re ignored:

* **You must add at least one song** to Phyrebird before playing, or the game will crash.
* Make sure to **calibrate your offset** for proper input timing on your system.

## Credits

* **Phyrebird**
  [https://github.com/rayden-61/phyrebird](https://github.com/rayden-61/phyrebird)

* **Wine build (wine-11.1-amd64-wow64)**
  [https://github.com/Kron4ek/Wine-Builds](https://github.com/Kron4ek/Wine-Builds)
  
* **DXVK build (Version 2.7.1)**
  [https://github.com/doitsujin/dxvk](https://github.com/doitsujin/dxvk)
