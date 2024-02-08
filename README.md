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
git config --global core.excludesfile ~/.github/.gitignore
```
