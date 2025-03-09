# SileX App

Now with MVVM, Clean Architecture and lots of fun!

The GitHub repository of this project is https://github.com/Javidroid/SileX_app

## Introduction

This project is an app for my Degree's Final Project

This version now implements a MVVM architecture so the code is easier to develop in the
future.

This project complements with its respective NodeJS API: https://github.com/Javidroid/SileX_API

> Disclaimer: Base project comes
> from https://github.com/worldline-spain/flutter_architecture_template

## Envs

- dev
- prod

## Run

To run each environment:

- dev: ```flutter run --flavor dev --dart-define-from-file=.env/dev.json```
- prod: ```flutter run --flavor prod --dart-define-from-file=.env/prod.json```

## Generate dependency injections

When adding a new injectable class or interface, run the following command to generate the
corresponding code:

```flutter packages pub run build_runner build```
