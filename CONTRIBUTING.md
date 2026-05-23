# Contributing to EEG-Alzheimer-Detection

Thank you for your interest in contributing! We welcome contributions that help improve model architectures, evaluation protocols, and documentation.

To maintain research integrity and code quality, please adhere to the following guidelines.

## Code of Conduct

We expect all contributors to maintain a professional, respectful, and collaborative environment.

## How to Contribute

### 1. Reporting Bugs & Feature Requests
- Check open issues to see if your bug or request has already been reported.
- If not, open a new issue describing the problem or the proposed feature with clear details.

### 2. Submitting Pull Requests (PRs)
- **Branch Naming**: Use descriptive branch names (e.g., `feature/add-gru-model`, `bugfix/fix-loso-index`).
- **Strict Requirement**: Ensure your code adheres to our **Zero Subject Leakage** policy. Any model updates must be evaluated using the subject-level Leave-One-Subject-Out (LOSO) cross-validation protocol defined in `methodology.md`. Epoch-level evaluations will be rejected.
- **Code Styling**: Follow standard Python PEP 8 styling. Ensure all notebooks are cleared of large unnecessary outputs before committing.
- **Documentation**: Update the corresponding `.md` files (`methodology.md`, `results.md`, or `datasets.md`) if your changes introduce new methods, results, or data.

## Code Structure

- `notebooks/`: For step-by-step pipeline execution, exploration, and model prototyping.
- `results/`: Save all figures in `results/figures/` and raw metrics in `results/metrics/`.
- Root files contain core configurations and documentation.

## License

By contributing, you agree that your contributions will be licensed under the project's [MIT License](LICENSE).
