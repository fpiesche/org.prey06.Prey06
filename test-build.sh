#!/usr/bin/env bash

clear
flatpak-builder --repo=testing-repo --force-clean build-dir org.dhewm3.Dhewm3.yaml
flatpak --user remote-add --if-not-exists --no-gpg-verify dhewm3-testing-repo testing-repo
flatpak --user install dhewm3-testing-repo org.dhewm3.Dhewm3 -y
flatpak --user install dhewm3-testing-repo org.dhewm3.Dhewm3.Debug -y
flatpak update -y
