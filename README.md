# EFU

EFU (Easy-Fast-Upgradable): The SH script you need to finish your Ubuntu/MacOS X installation if you're a developer.

## Project status
[![GitHub version](https://badge.fury.io/gh/barriosnahuel%2Fefu.svg)](http://github.com/barriosnahuel/efu/releases)
[![Semver](http://img.shields.io/SemVer/2.0.0.png)](http://semver.org/spec/v2.0.0.html)
[![stable](https://img.shields.io/badge/stability-stable-green.svg)](https://nodejs.org/api/documentation.html#documentation_stability_index)
[![Build Status](https://travis-ci.org/barriosnahuel/efu.svg?branch=master)](https://travis-ci.org/barriosnahuel/efu)

## Issues: [![Stories ready to be worked on](https://badge.waffle.io/barriosnahuel/efu.png?label=ready&title=Ready)](https://waffle.io/barriosnahuel/efu) [![Stories in progress](https://badge.waffle.io/barriosnahuel/efu.png?label=in progress&title=In Progress)](https://waffle.io/barriosnahuel/efu)


## Use it
1. Download [latest release](https://github.com/barriosnahuel/efu/releases).
2. `cd` into downloaded directory.
3. Edit `properties.sh` with your custom info.
4. `sh install.sh [osx | ubuntu]`
5. In a new tab of your terminal: `tail –f ~/Downloads/efu.log`
6. Once finished, take a look to: `~/Downloads/summary.efu.log`

## Repo usage
*Do not clone or push to* **master** *branch.*

Create branch or fork from **develop**, then push or create pull requests (if you don't have access) to that branch.

The repo uses [this branching model](http://nvie.com/posts/a-successful-git-branching-model/).
