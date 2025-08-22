#!/usr/bin/env bash

clear
flatpak-builder --repo=testing-repo --force-clean build-dir org.prey06.Prey06.yaml
flatpak --user remote-add --if-not-exists --no-gpg-verify prey06-testing-repo testing-repo
flatpak --user install prey06-testing-repo org.prey06.Prey06 -y
flatpak --user install prey06-testing-repo org.prey06.Prey06.Debug -y
flatpak update -y
