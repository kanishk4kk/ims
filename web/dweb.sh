#!/bin/sh
set -e
cd ..
mvn -o clean install -Dmaven.test.skip
cd web
mvnDebug -o -Dmaven.tomcat.uriEncoding=UTF-8 tomcat:run
