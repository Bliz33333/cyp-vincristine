
# Collaborative Workflow for cyp-vincristine

This document outlines how our team will collaborate using GitHub.

## 1. Clone the Repository
Each team member should clone the repository to their local machine:
```bash
git clone https://github.com/Bliz33333/cyp-vincristine.git
cd cyp-vincristine
```

## 2. Create a Branch for Your Work
Each person should create a separate branch from `main`. Use meaningful branch names, such as:
```bash
git checkout -b feature-analysis  # Example branch name
```

## 3. Make Changes and Commit
Edit the code, add files, and commit your changes:
```bash
git add .
git commit -m "Added feature extraction module"
```

## 4. Push Your Branch to GitHub
Push your branch so others can access your work:
```bash
git push origin your-branch-name
```

## 5. Create a Pull Request (PR)
When your work is ready, create a PR to merge it into `main`:
1. Go to the repository on GitHub.
2. Click on **Pull Requests** > **New Pull Request**.
3. Select your branch and compare it with `main`.
4. Click **Create Pull Request**.
5. Add a description and assign reviewers.

## 6. Review and Merge
Teammates should review PRs, suggest changes, and merge them when approved.

## 7. Keep Your Branch Updated
Regularly sync your branch with the latest changes from `main`:
```bash
git checkout main
git pull origin main
git checkout your-branch-name
git merge main
```

## Additional Tips
- **Use Issues:** Track tasks and assign them.
- **Communicate:** Comment on PRs and use GitHub Discussions.
- **Avoid Merge Conflicts:** Keep branches updated frequently.

Happy coding! 🚀


# cyp-vincristine


**function [BLC] = blood_level_conc(BV,k_m,V_max,dose_schedule,t_step,t_max)**

Inputs: 
- BV,k_m,V_max,t_step,t_max : numbers in agreeing units
- dose_schedule: N*2 Matrix, where N is number of drug adminstrations per cycle
      - Column 1 = Dose time (note first dose must be at t=0)
      - Column 2 = Dose amount

Outputs:
- BLC: M*2 Matrix, where M is the number of time points simulated (t_max/t_step + 1)
      - Column 1 = Time (starting at t=0 and increasing in increments of t_step)
      - Column 2 = Blood Level Concentration

