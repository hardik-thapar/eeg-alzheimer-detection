#!/bin/bash

echo "🚀 Starting automated Git deployment..."

# Ensure we are in the right directory
cd /Users/hardikthapar/Desktop/eeg/eeg-alzheimer-detection

# Copy .gitignore from parent if it exists, otherwise create a good default
if [ -f "../.gitignore" ]; then
    cp ../.gitignore .
else
    echo "data/" > .gitignore
    echo ".DS_Store" >> .gitignore
    echo ".ipynb_checkpoints/" >> .gitignore
    echo "__pycache__/" >> .gitignore
fi

# Create a professional requirements.txt based on our pipeline
cat << 'REQ_EOF' > requirements.txt
torch>=2.0.0
mne>=1.6.0
numpy>=1.24.0
pandas>=2.0.0
scikit-learn>=1.3.0
scipy>=1.11.0
matplotlib>=3.7.0
seaborn>=0.12.0
tqdm>=4.66.0
imblearn>=0.11.0
REQ_EOF

# Ensure results directories exist and are trackable
mkdir -p results/figures results/metrics
touch results/figures/.gitkeep
touch results/metrics/.gitkeep

# Initialize git and set remote
git init
git remote remove origin 2>/dev/null
git remote add origin https://github.com/hardik-thapar/eeg-alzheimer-detection.git

# ── COMMIT 1: Infrastructure ──
git add .gitignore requirements.txt push_to_github.sh
git commit -m "chore: setup project environment, dependencies, and gitignore"

# ── COMMIT 2: Documentation ──
git add README.md
git commit -m "docs: add comprehensive project README and architecture details"

# ── COMMIT 3: EDA Notebook ──
git add notebooks/01_data_exploration.ipynb
git commit -m "feat(eda): implement initial data exploration and signal processing"

# ── COMMIT 4: Baseline Notebook ──
git add notebooks/02_svm_baseline_loso.ipynb
git commit -m "feat(baseline): implement strict SVM baseline with LOSO validation"

# ── COMMIT 5: EEGNet Notebook ──
git add notebooks/03_eegnet_loso.ipynb
git commit -m "feat(dl): implement standard EEGNet architecture with strict LOSO evaluation"

# ── COMMIT 6: SIR-EEGNet Notebook ──
git add notebooks/04_sir_eegnet_loso.ipynb
git commit -m "feat(model): introduce SIR-EEGNet with Subject-Invariant Representation gradient reversal"

# ── COMMIT 7: Cross-Dataset ADSZ ──
git add notebooks/05_SIREEGNet_CrossDataset_ADSZ.ipynb
git commit -m "feat(benchmark): add mathematical resampling pipeline for ADSZ cross-dataset testing"

# ── COMMIT 8: Cross-Dataset FSU ──
git add notebooks/06_SIREEGNet_CrossDataset_FSU.ipynb
git commit -m "feat(benchmark): implement standardized 4s epoch cross-dataset validation against FSU dataset"

# ── COMMIT 9: Figures Dir ──
git add results/figures/.gitkeep
git commit -m "chore(results): initialize output directory structure for visualization figures"

# ── COMMIT 10: Metrics Dir ──
git add results/metrics/.gitkeep
git commit -m "chore(results): initialize output directory structure for evaluation metrics"

echo "✅ Commits created successfully! Pushing to GitHub..."

# Push to main branch
git branch -M main
git push -u origin main --force

echo "🎉 All done! Your 10 professional commits are now live on GitHub."
