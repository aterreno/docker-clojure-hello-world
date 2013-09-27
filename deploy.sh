#!/bin/bash
tar cfz docker.tgz ./docker-hello-world
scp -P2222 docker.tgz vagrant@localhost:.