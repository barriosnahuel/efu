# v2.7.0
## Removed
- Tomcat installation. 

# v2.6.1
## Fixed
- Stop trying to run script for Ubuntu 15.04.

## Removed
- Legacy Ubuntu scripts.

# v2.6.0
## Changed
- Apache Tomcat upgrade to v9.0.31.

## Fixed
- Typo in log messages.
- Sublime Text APT repository.
- Ubuntu core software now it's installed ok and before custom software.

## Removed
- Heroku toolbelt.
- Freemind because it's no longer being developed.

# v2.5.0
## Added
- Add curl to core Ubuntu/Lubuntu module. #113
- Add basic script in README to download and execute EFU. #112

## Changed
- Current logged user is taken automatically and there's no need to declare it on `properties.sh` #112

## Fixed
- SSH installation failure because of a typo. #87
- SSH setup on OS X now will store credentials on keychain. #73

See all changes through the version's milestone: [v2.5.0](https://github.com/barriosnahuel/efu/milestone/13?closed=1).

# v2.4.1
## Fixed
- Duplicated logs.
- NodeJS and npm installation.

# v2.4.0
## Added
- GIT diff-so-fancy to use `git diff` the right way. #70
- `~/Coding/tools` directory to PATH.
- Link to Audacity download on OS X.
- Log at summary to remember the user to add Android Build Tools to PATH manually. #43

## Changed
- Always install latest Ruby even if it's already installed.

# v2.3.0
## Added
- Finder relaunch automatically.
- Comments in Android related env vars in .bashrc and .zshrc.
- ERROR/WARN/INFO preffix for logs.
- `DEFAULT_USER` environment variable. #74
- GIT remote to the oh-my-zsh info. #80

## Changed
- Order modules by priority at `common.sh`.
- Setup Finder to show hidden files at the beginning in favor of future errors.
- Intellij IDEA and Android Studio download links changed to JetBrains toolbox.
- Minor things in README to make it clearer.
- Google Drive client for OS X now is only suggested via the official download page.
- Tomcat to v9.0.20.
- Install ZSH only when isn't already installed.
- Java installed through sdkman.
- Log files are cleaned on each run.

## Fixed
- GIT properties now are configured ok. #66
- Directories tree now is fully created.
- `tail` command in README as well as logs.
- Fallback when cding because currently it's not exiting right.
- Not going back to EFU's execution directory after installing Android utilities.
- Tomcat installation was breaking the script.
- `java` command execution on OS X without having it installed.
- Missing logs on summary.

## Removed
- Deprecated links and graphics from README.
- Dex2Jar Android utility in favor of user specific needs.
- Go language in favor of user's specific needs.
- Global Gradle properties in favor of per project optimized settings.
- Duplicated logs.

# v2.2.0
## Added
- History changelog to let user view the diff.
- Fit POSIX standards in if statements.
- jq JSON beautifer. #84

## Changed
- Upgraded NVM and NodeJS.
- README improvements.

## Fixed
- Default theme not applied. #51
- Terminal tabs not opened automatically. #79

## Removed
- Many software which is specific for a kind of user, in favor of each user specific needs.
- 'command-not-found' plugin from Oh-My-Zsh #82.

For more info, view changes through the [milestone](https://github.com/barriosnahuel/efu/issues?q=milestone%3Av2.2.0+is%3Aclosed)

# v2.1.4
## Added
- Let users disable each module. #65 
- Improvements in summary log. #65 
- Documentation improvements. #65

For more info, view changes through the [milestone](https://github.com/barriosnahuel/efu/issues?q=milestone%3Av2.1.4+is%3Aclosed)

# v2.1.4
## Added
- Added Idea/AS plugins. #45
- Finder now shows hidden files. #50

## Changed
- Replaced Transmission command line client with download url. #56

## Fixed
- Fixes in Java. #52 

## Removed 
- Stop configuring Gradle's memory. 

For more info, view changes through the [milestone](https://github.com/barriosnahuel/efu/issues?q=milestone%3Av2.1.3+is%3Aclosed)

# v2.1.2
## Fixed
- Fix current working directory after executing some modules.

# v2.1.0
## Added
- Android utilities:
  - Pidcat
  - ClassyShark
  - Dex2Jar
- Macs Fan Control download site.

To get more detail see the [closed issues](https://github.com/barriosnahuel/efu/issues?utf8=%E2%9C%93&q=milestone%3Av2.1.0+is%3Aclosed+is%3Aissue), or if you want a really deep look just see every [merged PR](https://github.com/barriosnahuel/efu/pulls?q=milestone%3Av2.1.0+is%3Aclosed+is%3Apr).

# v2.0.0
## Added
- Support for:
  - Ubuntu
  - Mac OS X
  - Lubuntu

To get more detail see the [closed issues](https://github.com/barriosnahuel/efu/issues?utf8=%E2%9C%93&q=milestone%3Av2.0.0+is%3Aclosed+is%3Aissue), or if you want a really deep look just see every [merged PR](https://github.com/barriosnahuel/efu/pulls?q=milestone%3Av2.0.0+is%3Aclosed+is%3Apr).

# v1.0.1
## Fixed
- Deleted some duplicted commands.

# v1.0.0
## Added
- Repo usage section in README.
- Many software for Ubuntu.

## Changed
- Gradle version as well as distribution type.
- Google Drive client
