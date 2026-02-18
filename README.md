# Air Quality Modeling in R

![Language: R](https://img.shields.io/badge/language-R-276DC3?logo=r&logoColor=white)

🌐 [Project page](https://nikolailen.github.io/air-quality-ml/)  
👤 Project contact: [Nikolai Len](https://www.linkedin.com/in/niklen/)  
📄 [Documentation](./air-quality-modeling-research-2025.pdf)

Primary language: **R**.

## Overview

This repository contains a reproducible R research project on air quality modeling with two datasets:
- ozone concentration modeling with constrained vs unconstrained regression
- PM10 pollution modeling with multiple statistical and machine learning approaches

The repository includes a full Markdown mirror of the report in `index.md` and the full PDF report in `air-quality-modeling-research-2025.pdf`.

## Objectives

- Compare constrained and unconstrained linear regression for ozone data.
- Benchmark multiple model families for classification and regression tasks.
- Evaluate model quality with train/test split and cross-validation.
- Publish reproducible outputs in R Markdown, Markdown, and PDF.

## Methods Covered

- Constrained multiple regression (`restriktor`)
- Regularized models: LASSO, Ridge, Elastic Net (`glmnet`)
- CART (`rpart`, `rpart.plot`)
- Random Forest and VSURF-based feature selection (`randomForest`, `VSURF`)
- Performance metrics:
  - Classification: AUC, sensitivity, specificity, accuracy
  - Regression: MSE, RMSE, R-squared

## Datasets

- `ozone_air_quality_data.csv`
  - Ozone-focused dataset used for constrained vs unconstrained modeling.
- `advanced_classification_data.RData`
  - Classification dataset containing object `A` with `X` and `Y`.

## Repository Structure

```text
.
├── air-quality-modeling-research-2025.Rmd
├── air-quality-modeling-research-2025.pdf
├── index.md
├── index_files/
├── README.md
├── LICENSE
├── ozone_air_quality_data.csv
├── advanced_classification_data.RData
└── scripts/
    └── build_index_from_rmd.R
```

## Reproducibility

### Requirements

- R (tested with R 4.5.x)
- Packages used in the report include:
  - `rmarkdown`, `knitr`
  - `restriktor`, `ggplot2`, `glmnet`
  - `rpart`, `rpart.plot`, `randomForest`, `VSURF`
  - `pROC`, `corrplot`, `car`

### Build Commands

Render the PDF report:

```bash
Rscript -e "rmarkdown::render('air-quality-modeling-research-2025.Rmd')"
```

Build `index.md` from the Rmd:

```bash
Rscript scripts/build_index_from_rmd.R
```

## License

This repository is licensed under the [MIT License](./LICENSE).
