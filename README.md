# SileX App

Second version of TFG. Now with MVVM, Clean Architecture and lots of fun!

## Introduction

This project pretends to be the second version of the App that is intended to be develop as Final
Project.

This version pretends to implement a MVVM architecture so the code is easier to develop in the
future.

This project complements with the NodeJS API: https://github.com/Javidroid/SileX_API

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