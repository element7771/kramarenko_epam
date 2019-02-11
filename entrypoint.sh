#!/bin/bash
set -e


# Start notepad application with specific JVM_ARGS and SPRING_PROFILE
java ${JVM_ARGS} -jar /app/app.war
