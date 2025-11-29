#!/bin/sh

sudo nixos-rebuild --flake .\#$(hostname) switch
home-manager switch --flake .
