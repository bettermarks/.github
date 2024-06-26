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
git config --global core.excludesfile $PWD/.github/.gitignore
```

### git-hooks

Provides common pre-commit hooks that can be reused in other repositories with minimal configuration.

There are two widely used options for pre-commit hooks configured inside a repository:
- <https://pre-commit.com> (language agnostic)
- <https://typicode.github.io/husky/> (most streamlined npm/pnpm/yarn integration)

Since some repositories use `pre-commit`, 
to not forget to run `pre-commit install` after cloning repository:
1. install `pre-commit`
using your package manager of choice or by following [the docs](https://pre-commit.com/#install)
2. configure global (user level) init template for git 
```bash
gh repo clone bettermarks/.github
git config --global init.templateDir $PWD/.github/git-hooks/init-template
```
3. in the directory containing the repositories you already cloned,
   activate pre-commit in every repository containing a `.pre-commit-config.yaml`:
```bash
find . -maxdepth 2 -name .pre-commit-config.yaml -type f -execdir pwd \; -execdir pre-commit install \;
```

Once a repository reaches a state in which contributors need to run certain checks before committing,
pick one of the options that best fits your project setup:

#### add a hook to a repo using pre-commit

`pre-commit` is a "language agnostic" tool which hides away the complexity 
of installing the required tools and configuring multiple checks for each hook,
but the integration is not ideal for npm/pnpm/yarn based projects.

1. run `touch .pre-commit-config.yaml`, open the file in an editor and add the following
```yaml
# See https://github.com/bettermarks/.github#git-hooks for more information
# See https://pre-commit.com/hooks.html for more hooks
repos:
  - repo: https://github.com/bettermarks/.github
    # to get the latest SHA use `gh api /repos/bettermarks/.github/commits/HEAD -q .sha`
    rev: SHA
    hooks:
      - id: no-commit-to-default-branch
        # the default branch of the repository containing this yaml file
        args: [main]
      - id: pre-commit-autoupdate
```
3. run `gh api /repos/bettermarks/.github/commits/HEAD` and replace SHA in the file with the output
2. to enable the configured git hooks for the repository on your machine run `pre-commit install`
3. commit and push the file to a feature branch (you should see some pre-commit output)
4. Make sure that the setup docs in the repository provide a hint to run  `pre-commit install`,
   and tell the other contributors about it.
5. evaluate what [other hooks/checks](https://pre-commit.com/hooks.html) should to be added, widespread ones are
   - black
   - flake8
   - actionlint

#### add hook to a repo using husky

if the repository is a top level npm/pnpm/yarn project, 
you most likely prefer to use (husky)[https://typicode.github.io/husky/].

1. install `husky` as a devDependency: `pnpm add --save-dev husky`
2. add the initial configuration: `pnpm exec husky init`
3. Download a copy of the check you would like to add to the `.husky` directory, e.g. 
```bash
(cd .husky && \
 curl -LO https://github.com/bettermarks/.github/raw/main/git-hooks/no-commit-to-default-branch && \
 chmod +x no-commit-to-default-branch)
```
and invoke it from your pre-commit hook, by passing the default branch name as the first argument
```bash
echo ".husky/no-commit-to-default-branch main" >> .husky/pre-commit
```
4. add/commit and push the new `.husky` directory to the version control system, 
   you should already see some additional output.
5. evaluate what other checks need to be added, widespread ones are
   - eslint
   - prettier
6. in case you are using `nvm` or something similar to configure the node version,
   you might want to add `git-hooks/init.sh` as described in the file 
