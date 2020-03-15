# EFU

EFU (Easy-Fast-Upgradable): The SH script you need to finish your Ubuntu/MacOS X installation if you're a developer.

## Project status
[![GitHub version](https://badge.fury.io/gh/barriosnahuel%2Fefu.svg)](http://github.com/barriosnahuel/efu/releases)
[![Semver](http://img.shields.io/badge/SemVer-v2.0.0-green.png)](http://semver.org/spec/v2.0.0.html)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/011979e103b14efbb00573f2fc47795d)](https://www.codacy.com/app/barrios.nahuel/efu?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=barriosnahuel/efu&amp;utm_campaign=Badge_Grade)
[![stable](https://img.shields.io/badge/stability-stable-green.svg)](https://nodejs.org/api/documentation.html#documentation_stability_index)
[![Build Status](https://travis-ci.org/barriosnahuel/efu.svg?branch=master)](https://travis-ci.org/barriosnahuel/efu)

## Use it
1. Download [latest release](https://github.com/barriosnahuel/efu/releases).
2. `cd` into downloaded directory.
3. Edit `properties.sh` with your custom info.
4. `sh install.sh [osx | ubuntu | lubuntu]`
5. *\[OS X only]* In a new tab of your terminal: `tail ~/Downloads/efu.log –f`
6. *\[OS X only]* In a new tab of your terminal: `tail ~/Downloads/summary.efu.log -f`

So you will have 3 tabs:
- One for the main script you're running: `install.sh` ⇐ *You should check this tab because it will ask you for some things.*
- One for `efu.log` output. ⇐ *Full script output.*
- One for `summary.efu.log` output. ⇐ *Most cases this will be enough.*

Tip: For CMD lovers...

```
wget --content-disposition https://codeload.github.com/barriosnahuel/efu/zip/v2.6.1 \
&& unzip efu-2.6.1.zip \
&& rm -rf efu-2.6.1.zip \
&& cd efu-2.6.1 \
&& sh install.sh ubuntu
```

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
  - Google Drive command line client
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

### Testing

Manually running tests from `test.sh` by: `sh test.sh`
