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
3. Edit `properties.sh` with your custom info. Properties are required in order tu setup GIT.
4. `sh install.sh [osx | ubuntu | lubuntu]`

On OS X, also:
5. In a new tab of your terminal: `tail –f ~/Downloads/efu.log`
6. Once finished, take a look to: `~/Downloads/summary.efu.log`

So you will have 3 tabs:
- One for the main script: `install.sh` ⇐ *You should check this tab because it will ask you for some things.*
- One for `efu.log` output. ⇐ *Full script output.*
- One for `summary.efu.log` output. ⇐ *Most cases this will be enough.*

## What does EFU do for me?
With a little of your interaction, EFU will:
- Create a directories tree under ~/Coding for coders.
- Install (and setup) many software:
  - Android
    - [ClassyShark](https://github.com/google/android-classyshark/)
    - [Dex2Jar](https://github.com/pxb1988/dex2jar)
    - [Pidcat](https://github.com/JakeWharton/pidcat)
  - Gimp
  - GIT
  - Go language
  - [Google Drive command line client](https://github.com/odeke-em/drive)
  - Gradle  
  - Google App Engine SDK
  - Heroku toolbelt
  - Maven  
  - [Mixxx](http://www.mixxx.org/): DJ software
  - NodeJS 
  - [sdkman](http://sdkman.io/)
  - Tomcat  
  - ZSH and [Oh-My-ZSH](https://github.com/robbyrussell/oh-my-zsh)
- Install (and setup) many software (OS X only):
  - Homebrew (OS X only)
- Install (and setup) many software (Ubuntu only):
  - Common packages to compress and uncompress common files
  - Dropbox
  - GParted with NTFS support
  - Mega sync client
  - MongoDB and a desktop client: Robomongo
  - Rhythmbox music player
  - TeamViewer
  - WebP command line tools
  - ++
- Suggest (with links) to download latest version of:
  - Android Studio
  - Java 7 and 8
  - [JDownloader](http://jdownloader.org/home/index)
  - JetBrains [Intellij IDEA](https://www.jetbrains.com/idea/) (EAP)
  - [Macs Fan Control](http://www.crystalidea.com/macs-fan-control)
  - Transmission torrents client

## Contributing

The repo uses [this branching model](http://nvie.com/posts/a-successful-git-branching-model/).