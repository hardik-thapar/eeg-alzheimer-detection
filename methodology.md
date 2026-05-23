# Methodology

## Evaluation Protocol

All models in this project use strict subject-level 
leave-one-subject-out (LOSO) cross-validation.

In each fold, one subject is completely excluded from 
training. No epoch from the test subject appears in 
any training or validation fold at any point.

Epoch-level predictions are aggregated to a single 
subject-level label by majority vote.

This is in contrast to epoch-level cross-validation, 
which is common in published EEG literature but allows 
data from the same patient to appear in both training 
and test sets (subject leakage).

## Why This Matters

On ds004504, epoch-level CV reports 92.46% accuracy.  
Subject-level LOSO reports 83.08%.  
The 9.38pp difference is the leakage inflation.

## Preprocessing

- Target sampling rate: 250 Hz (all datasets)
- Epoch length: 4 seconds (1000 samples at 250 Hz)
- Epoching: non-overlapping, trailing data discarded
- Normalization: StandardScaler fitted on training 
  subjects only, applied to validation and test
- Channels: 19 standard 10-20 electrodes

## Feature Extraction (SVM)

Relative Band Power (RBP) computed using Welch's 
method over 5 bands:
- Delta: 0.5-4 Hz
- Theta: 4-8 Hz  
- Alpha: 8-13 Hz
- Beta: 13-30 Hz
- Gamma: 30-45 Hz

19 channels x 5 bands = 95-dimensional feature vector
