# .github

Bettermarks wide "[default files](https://docs.github.com/en/github/building-a-strong-community/creating-a-default-community-health-file)".

**This repository has to be public, for this mechanism to work.**

Every change to this repository has to be approved by two team members.

## .gitignore

Is not automatically used, but you can copy/sync it using
```bash
curl -O https://github.com/bettermarks/.github/raw/main/.gitignore
```

If you want to make this the default for the current user on your (bettermarks) machine:
```bash
cd ~
gh repo clone bettermarks/.github
git config --global core.excludesfile ~/.github/.gitignore
```

## PULL_REQUEST_TEMPLATE.md

It is [used to prefill the pull request description](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/about-issue-and-pull-request-templates#pull-request-templates) 
in any repository that doesn't [define an own template](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository).
