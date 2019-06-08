# v2.3.0
## Added
- Finder relaunch automatically.

## Changed
- Order modules by priority at `common.sh`.
- Setup Finder to show hidden files at the beginning in favor of future errors.
- Intellij IDEA and Android Studio download links changed to JetBrains toolbox.
- Minor things in README to make it clearer.
- Google Drive client for OS X now is only suggested via the official download page.
- Tomcat to v9.0.20.
- Install ZSH only when isn't already installed.

## Fixed
- GIT properties now are configured ok. #66
- Directories tree now is fully created.
- `tail` command in README as well as logs.
- Fallback when cding because currently it's not exiting right.
- Not going back to EFU's execution directory after installing Android utilities.
- Tomcat installation was breaking the script.
- `java` command execution on OS X without having it installed.

## Removed
- Deprecated links and graphics from README.
- Dex2Jar Android utility in favor of user specific needs.
- Go language in favor of user's specific needs.

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
