#!/bin/bash
# Created by Nahuel Barrios on 17/3/16.

export SDKMAN_DIR="$HOME/Coding/xDKs/sdkman" && curl -s get.sdkman.io | bash

log "Installing Gradle through sdkman"
sdk install gradle

echo "# The Gradle daemon aims to improve the startup and execution time of Gradle." >> ~/.gradle/gradle.properties &&
echo "# When set to true the Gradle daemon is to run the build." >> ~/.gradle/gradle.properties &&
echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties &&
echo "" >> ~/.gradle/gradle.properties &&
echo "# Specifies the JVM arguments used for the daemon process." >> ~/.gradle/gradle.properties &&
echo "# The setting is particularly useful for tweaking memory settings." >> ~/.gradle/gradle.properties &&
echo "# Default value: -Xmx10248m -XX:MaxPermSize=256m" >> ~/.gradle/gradle.properties &&
echo "org.gradle.jvmargs=-Xmx2048m -XX:MaxPermSize=512m -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8" >> ~/.gradle/gradle.properties &&
echo "" >> ~/.gradle/gradle.properties &&
echo "# When configured, Gradle will run in incubating parallel mode." >> ~/.gradle/gradle.properties &&
echo "# This option should only be used with decoupled projects. More details, visit" >> ~/.gradle/gradle.properties &&
echo "# http://www.gradle.org/docs/current/userguide/multi_project_builds.html#sec:decoupled_projects" >> ~/.gradle/gradle.properties &&
echo "org.gradle.parallel=true" >> ~/.gradle/gradle.properties &&
echo "" >> ~/.gradle/gradle.properties &&
echo "# Enables new incubating mode that makes Gradle selective when configuring projects." >> ~/.gradle/gradle.properties &&
echo "# Only relevant projects are configured which results in faster builds for large multi-projects." >> ~/.gradle/gradle.properties &&
echo "# http://www.gradle.org/docs/current/userguide/multi_project_builds.html#sec:configuration_on_demand" >> ~/.gradle/gradle.properties &&
echo "org.gradle.configureondemand=true" >> ~/.gradle/gradle.properties &&

log "Gradle installed and configured successfully. Check ~/.gradle/gradle.properties to see current configuration"


log "Installing Apache Ant through sdkman"
sdk install ant

log "Installing Kotlin through sdkman"
sdk install kotlin

log "Installing Grails through sdkman"
sdk install grails