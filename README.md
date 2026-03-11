## Project - Simulation and Analysis of CSMA CA in NS3

This project simulates and analyzes client loss ratios in a wireless network using ns-3, focusing on CSMA/CA, and visualizes the results.

---

## Pre-Setup

- I have used **ns-3-dev**, cloned from the official GitLab repository:
  ```
  https://gitlab.com/nsnam/ns-3-dev.git
  ```

- This Networks_Project should be placed inside your `/ns-3-dev/` directory.

Clone the project inside your ns-3 directory:

```bash
cd ~/ns-3-dev/
git clone https://github.com/shravankumarrsk/Networks_Project
```

Move the necessary files:
1) Move main.cc from `/ns-3-dev/Networks_Project/` to `/ns-3-dev/scratch/`
2) Move main.sh from `/ns-3-dev/Networks_Project/` to `/ns-3-dev/`

```bash
cd ~/ns-3-dev/
mv Networks_Project/main.cc scratch/
mv Networks_Project/main.sh .
```

Ensure your structure looks like this **before running main.sh**:

```
~/ns-3-dev/
├── main.sh
├── scratch/
│   └── main.cc
├── Networks_Project/
│   ├── analyze.py
│   ├── plot.py
│   ├── compare.py
│   ├── analyzeall.sh
│   ├── summerize.sh
└── (other ns-3 core files)
```

---

## How to Use

### 1. Run Simulations

```bash
cd ~/ns-3-dev/
bash main.sh
```

**main.sh**
- Creates directories:
  - `Networks_Project/flowData/`
  - `Networks_Project/flowData/sv0-ps512/`
  - `Networks_Project/flowData/sv0-ps1500/`
  - `Networks_Project/animData/`
  - `Networks_Project/animData/sv0-ps512/`
  - `Networks_Project/animData/sv0-ps1500/`
  - `Networks_Project/analyzedData/`
  - `Networks_Project/analyzedData/sv0-ps512/`
  - `Networks_Project/analyzedData/sv0-ps1500/`
  - `Networks_Project/summarizedData/`
- Builds ns-3.
- Runs simulations for node counts 2 to 30 for two packet sizes (512 and 1500 bytes).
- Moves FlowMonitor and NetAnim output files into appropriate folders.

Ensure your structure looks like this **after running main.sh**:

```
~/ns-3-dev/
├── main.sh
├── scratch/
│   └── main.cc
├── Networks_Project/
│   ├── analyze.py
│   ├── plot.py
│   ├── compare.py
│   ├── analyzeall.sh
│   ├── summerize.sh
│   ├── flowData/
│   │    ├── sv0-ps512/
│   │    └── sv0-ps1500/
│   ├── animData/
│   │    ├── sv0-ps512/
│   │    └── sv0-ps1500/
│   ├── analyzedData/
│   │    ├── sv0-ps512/
│   │    └── sv0-ps1500/
│   └── summarizedData/
└── (other ns-3 core files)
```

---

### 2. Analyze Simulation Results

```bash
cd ~/ns-3-dev/Networks_Project/
bash analyzeall.sh sv0-ps512
bash analyzeall.sh sv0-ps1500
```

**analyzeall.sh**
- Takes a configuration name as an argument (e.g., `sv0-ps512`).
- Analyzes each XML file using `analyze.py`.
- Generates `.txt` reports inside `analyzedData/<config>/`.
- Appends summarized client loss ratios to `summarizedData/<config>.csv`.

---

### 3. Summarize Important Metrics

```bash
bash summerize.sh sv0-ps512
bash summerize.sh sv0-ps1500
```

**summerize.sh**
- Takes a configuration name as an argument.
- Extracts and prints packet loss summaries from analyzed `.txt` files.

---

### 4. Plot and Compare Results

#### Single Configuration Plot
```bash
python3 plot.py summarizedData/sv0-ps512.csv
python3 plot.py summarizedData/sv0-ps1500.csv
```

**plot.py**
- A lightweight plotting tool.
- Plots a simple visualization of client loss ratio for a single configuration.
- Saves the plot as a PDF next to the input `.csv` file.

#### Compare Both Configurations
```bash
python3 compare.py
```

**compare.py**
- Reads `sv0-ps512.csv` and `sv0-ps1500.csv` from `summarizedData/`.
- Plots and compares Client Loss Ratios for both 512 and 1500 packet sizes.
- Saves the comparison plot as `summarizedData/client_loss_comparison.pdf`.

---

## Output Files

- **FlowMonitor outputs** → `Networks_Project/flowData/`
- **NetAnim animation files** → `Networks_Project/animData/`
- **Analysis reports** → `Networks_ProjectProject/analyzedData/`
- **Summarized CSV files** → `Networks_Project/summarizedData/`
- **Comparison graph PDF** → `Networks_Project/summarizedData/client_loss_comparison.pdf`

---

## Notes

- All directories are created automatically by scripts.
- Simulations run automatically for node counts from 2 to 30.
- CSV summaries are generated automatically by `analyze.py`.
- Optional simple plotting available with `plot.py`.
- Full comparison plotting available with `compare.py`.

---

