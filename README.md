# PH 306 – Computational Physics: First-Day Assignment

Welcome! This assignment walks you through the tools we will use all semester: **GitHub Codespaces**, **Python scripting**, and **CodeGrade** autograding.

## Your Goal

Complete the two problems in **`assignment.py`**, verify your work in the notebook, then **commit and push** to submit.

## Step-by-Step

### 1. Open the assignment in Codespaces

Click the green **Code** button → **Codespaces** tab → **Create codespace on main**.  
Wait for the environment to build (this takes a minute the first time).

### 2. Implement the two problems

Open **`assignment.py`** and fill in each function that raises `NotImplementedError`.

| Problem | Function | Task |
|---------|----------|------|
| 1 | `problem1_array_operations` | Return `x` (100 evenly-spaced values from 0 to 2π) and `y = sin(x)` |
| 2 | `problem2_numerical_integration` | Return `(result, error)` for $\int_{-\infty}^{+\infty} e^{-x^2}\,dx$ using `scipy.integrate.quad` |

### 3. Check your work

**Option A – Notebook**

Open `assignment.ipynb` and run all cells (**Run → Run All Cells**).  
Green check marks mean the public checks passed.

**Option B – Terminal**

```bash
python assignment.py
```

### 4. Run the autograder tests locally (optional)

```bash
pytest tests/test_public.py -v
```

### 5. Commit and push to submit

In the **Source Control** panel (Ctrl+Shift+G):

1. Stage all changes (click **+** next to changed files).
2. Enter a commit message, e.g. `"Complete problems 1 and 2"`.
3. Click **Commit**, then **Sync Changes** (push).

CodeGrade picks up the push automatically and runs the autograder.

## Files

| File | Description |
|------|-------------|
| `assignment.py` | **Edit this file.** Contains the problem stubs you must implement. |
| `assignment.ipynb` | Driver notebook – run it to visualize and check your work. |
| `tests/test_public.py` | Public tests used by the CodeGrade autograder. |
| `environment.yml` | Conda environment spec (`ph306`) used by Codespaces. |

## Hints

- **Problem 1:** [`numpy.linspace`](https://numpy.org/doc/stable/reference/generated/numpy.linspace.html) and [`numpy.sin`](https://numpy.org/doc/stable/reference/generated/numpy.sin.html) are your friends.
- **Problem 2:** [`scipy.integrate.quad`](https://docs.scipy.org/doc/scipy/reference/generated/scipy.integrate.quad.html) accepts a function and integration limits; use `numpy.inf` for ±∞.  The exact answer is $\sqrt{\pi} \approx 1.7725$.
