# This .github repository

is a "special repository" 
which contains ["default files"](https://docs.github.com/en/github/building-a-strong-community/creating-a-default-community-health-file)

**This repository has to be public for the "default file" mechanism to work!**

## 1. contains bettermarks "default files"

Every change to this repository has to be approved by two team members,
since it has an impact on the whole organization.

### PULL_REQUEST_TEMPLATE.md

[This file](https://github.com/bettermarks/.github/blob/main/PULL_REQUEST_TEMPLATE.md) is used 
[to prefill the pull request description](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/about-issue-and-pull-request-templates#pull-request-templates) 
in any repository that doesn't [define an own template](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository).

---
> there are more options for ["default files"](https://docs.github.com/en/github/building-a-strong-community/creating-a-default-community-health-file)
---

## 2. is a central place for some configuration files

that are independent of other things, have a dedicated scope and are used in many repositories.

They are **not** picked up as "default files" by GitHub,
so they **need to be copied manually** to use them.

> More complex shared configuration/set of files like
> - https://github.com/bettermarks/renovate-config (public)
> - [@bettermarks/browserslist-config-bettermarks](https://github.com/bettermarks/browserslist-config-bettermarks) :lock:
> - [@bettermarks/eslint-config](https://github.com/bettermarks/eslint-config) :lock:
> - [@bettermarks/semantic-release-configs](https://github.com/bettermarks/semantic-release-configs) :lock:
> - ...you name it...
>
> or GitHub actions/workflows go into their own (public of private) repository!

### .gitignore

Provides common ignore patterns for user specific files like secrets, notes, editor configs, 
and anything related to Typescript-based Infrastructure as Code.

you can download it to a project/repository:
```bash
curl -LO https://github.com/bettermarks/.github/raw/main/.gitignore
```

It can also be used as a default for the current user on your (bettermarks) machine, run:
```bash
cd ~
gh repo clone bettermarks/.github
git config --global core.excludesfile $(pwd)/.gitignore
```

### git-hooks

Provides common pre-commit hooks that can be reused in other repositories without a lot of config.

You have to deice for one of the below options, since they both the same mechanism,
so they would override each other.

#### with pre-commit

`pre-commit` is a "language agnostic" tool which hides away the complexity of installing the required tools globally,
but the integraiton i not ideal for npm base projects.

1. Install `pre-commit` to your system using your package manager of choice or by following [the docs](https://pre-commit.com/#install).
2. To enable the configured git hooks run `pre-commit install`
3. Make sure that the docs in the repository provide a hint that you should do step 2 when cloning the repository!
4. add the following under the `repos` key in the `.pre-commit-config.yaml`:
```yaml
  - repo: https://github.com/bettermarks/.github
    hooks:
      - id: no-commit-to-default-branch
        args: 
          - main # or master or whatever it your default branch
```

#### with husky

if the repository is a top level npm/pnpm/yarn project, you most likely prefer to use (husky)[https://typicode.github.io/husky/].

After configuring husky including the `prepare` script, there will be a `.husky` directory,
which needs ot be added to the version control system.

Download a copy of the hook you would like to add to the `.husky` directory
```bash
(cd .husky && curl -LO https://github.com/bettermarks/.github/raw/main/git-hooks/no-commit-to-default-branch)
```
and invoke it from your pre-commit hook, by passing the default branch name as the first argument
```bash
echo ".husky/no-commit-to-default-branch main" >> .husky/pre-commit
```
