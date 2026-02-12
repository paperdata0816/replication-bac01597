# Replication materials (peer review)

This repository provides the data and Stata code required to reproduce the empirical results reported in the manuscript:
**“Governance Fragmentation and Transboundary Climate Action: Environmental Decentralization, Market Integration, and Regional Collaborative Emission Reduction in China.”**

## Contents

- `core data.dta`: cleaned province–year panel dataset (31 provinces, 2007–2023).
- `code.do`: Stata script to reproduce the main results (tables/figures).
- `data_dictionary.xlsx`: variable definitions, sources, and construction notes.

Recommended folder structure (optional but helpful):
```
/data        (datasets)
/code        (do-files)
/docs        (dictionary/notes)
/output      (generated tables/figures)
```

## Software requirements

- Stata 18 (recommended).
- Packages used by the script: `estout` (for `esttab/eststo`).  
  Install once in Stata:
  ```
  ssc install estout, replace
  ```

## How to reproduce results

1. Download this repository as a ZIP (green **Code** button → **Download ZIP**) and unzip it.
2. Open Stata and set the working directory to the folder that contains your `.dta` file and `code.do`.
3. Run:
   ```
   do code.do
   ```

### Notes on paths (important)

To keep the script portable, avoid hard-coded local paths such as `C:\Users\...\Desktop\...`.
Write outputs to a relative folder (e.g., `./output/`) so that editors/referees can run the script on their machines.

## Data sources and licensing

The shared dataset is a cleaned dataset constructed for analysis. Where any underlying raw inputs are subject to third‑party licensing terms, those raw inputs cannot be redistributed. Source descriptions and variable construction notes are provided in `data_dictionary.xlsx` and in the manuscript.


