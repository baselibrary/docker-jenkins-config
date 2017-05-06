#!/bin/bash

#enable job control in script
set -e -m

#####   variables  #####

#run command in background
if [[ "$#" -lt 1 ]] || [[ "$1" == "--"* ]]; then
  ##### pre scripts  #####
  echo "========================================================================"
  echo "initialize:"
  echo "========================================================================"
  mkdir -p "$JENKINS_HOME"

  echo "update templates"
  confd -onetime -backend vault -node "$VAULT_ADDR" -auth-type token -auth-token "$VAULT_TOKEN"
  echo "update configurations"
  find /usr/share/jenkins/ref/ -type f -exec bash -c '. /usr/local/bin/jenkins-support; for arg; do copy_reference_file "$arg"; done' _ {} +

  ##### run scripts  #####
  echo "========================================================================"
  echo "startup:"
  echo "========================================================================"
  exec java "$JAVA_OPTS" -jar /usr/share/jenkins/jenkins.war "$JENKINS_OPTS" "$@" &

  ##### post scripts #####
  echo "========================================================================"
  echo "configure:"
  echo "========================================================================"

  #bring command to foreground
  fg
else
  exec "$@"
fi
