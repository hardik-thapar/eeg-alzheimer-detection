# EEG-Based Alzheimer's Disease Detection

Research on automated Alzheimer's disease classification from 
resting-state EEG signals using classical machine learning and 
deep learning approaches, with rigorous subject-level evaluation.

Conducted under the supervision of Prof. Kang-Ming Chang,
National Kaohsiung University of Science and Technology (NKUST), Taiwan.

---

## Overview

This repository contains the complete experimental pipeline for 
binary classification of Alzheimer's disease (AD) versus healthy 
controls (HC) using 19-channel resting-state EEG. All models are 
evaluated under strict subject-level leave-one-subject-out (LOSO) 
cross-validation with no epoch-level data leakage.

A key finding of this work is that standard epoch-level evaluation, 
commonly used in published EEG-AD literature, inflates reported 
accuracy by approximately 9.4 percentage points compared to honest 
subject-level evaluation.

---

## Dataset

Primary: OpenNeuro ds004504
- 88 subjects: 36 AD, 23 FTD, 29 HC
- 19 channels, 500 Hz, resting-state eyes-closed EEG
- Freely available at: https://openneuro.org/datasets/ds004504
- Binary task uses 65 subjects (AD vs HC)

The dataset is not included in this repository. Download from 
OpenNeuro and place under data/ds004504/.

---

## Results

Binary AD vs HC classification, subject-level LOSO, ds004504 (N=65):

| Model              | Accuracy | F1 (W) | AD Recall |
|--------------------|----------|--------|-----------|
| SVM + RBP          | 83.1%    | 83.0%  | 88.9%     |
| EEGNet             | 78.5%    | —      | —         |
| Hybrid SIR-EEGNet  | 81.5%    | 81.3%  | 88.9%     |

Leakage demonstration: epoch-level CV reports 92.5% vs 83.1% 
under correct subject-level evaluation — a 9.4pp inflation.

---

## Notebooks

| Notebook | Description |
|----------|-------------|
| 01_data_exploration | Dataset loading, EDA, DTABR biomarker analysis |
| 02_svm_baseline_loso | SVM + RBP features, strict LOSO evaluation |
| 03_eegnet_loso | EEGNet baseline under LOSO |
| 04_sir_eegnet_loso | Hybrid SIR-EEGNet proposed model trained on ds04504 and tested on ds04504 |
| 05_sir_eegnet_cross_dataset_FSU | Hybrid SIR-EEGNet proposed model trained on ds04504 and tested on FSU dataset |
| 06_sir_eegnet_cross_dataset_ADSZ | Hybrid SIR-EEGNet proposed model trained on ds04504 and tested on ADSZ dataset |

---

## Model Architecture

Hybrid SIR-EEGNet combines:
- EEGNet backbone for temporal-spatial feature learning from raw EEG
- Relative Band Power (RBP) branch encoding known AD biomarkers
- Gradient Reversal Layer (GRL) for subject-adversarial training

The GRL forces the shared feature extractor to learn 
disease-relevant representations that are invariant to 
subject-specific noise, following Ganin et al. (2016).

---

## Evaluation Protocol

All models use strict subject-level LOSO:
- Each fold leaves one subject entirely out for testing
- Scaler fitted on training subjects only
- Epoch-level predictions aggregated by majority vote
- Zero subject leakage guaranteed

---

## Requirements

Python 3.9+, MNE-Python, PyTorch, scikit-learn, scipy, 
numpy, pandas, matplotlib, seaborn

---

## Citation

If you use this code, please cite the ds004504 dataset:

Miltiadous et al. (2023). A Dataset of Scalp EEG Recordings 
of Alzheimer's Disease, Frontotemporal Dementia and Healthy 
Subjects. Data, 8(6), 95.

---

## Acknowledgements

This work was conducted under the supervision of Prof. Kang-Ming 
Chang, Department of Computer and Communication Engineering, 
National Kaohsiung University of Science and Technology, Taiwan.