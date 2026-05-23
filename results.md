# Results

## Within-Dataset LOSO (ds004504, Binary AD vs HC, N=65)

| Model | Accuracy | F1-W | AD Recall | HC Recall |
|---|---|---|---|---|
| SVM + RBP | 83.1% | 83.0% | 88.9% | 75.9% |
| EEGNet | 78.5% | -- | -- | -- |
| Hybrid SIR-EEGNet | 81.5% | 81.3% | 88.9% | 72.4% |

McNemar test (SVM vs SIR-EEGNet): p = 1.00  
No statistically significant difference at subject level.

## Leakage Demonstration

| Protocol | Accuracy |
|---|---|
| Epoch-level 5-fold CV (incorrect) | 92.46% |
| Subject-level LOSO (correct) | 83.08% |
| Inflation | 9.38pp |

## Cross-Dataset Generalization (Train: ds004504)

| Test Dataset | Model | Accuracy | HC Recall |
|---|---|---|---|
| FSU (80 AD, 12 HC) | SVM | 86.96% | 0% |
| FSU | SIR-EEGNet | 86.96% | 0% |
| ADSZ (24 AD, 24 HC) | SVM | 50.00% | 0% |
| ADSZ | SIR-EEGNet | 50.00% | 0% |

All models collapse to majority-class prediction 
on external datasets due to inter-dataset domain shift.
