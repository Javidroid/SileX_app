# tfg_v2

Second version of TFG. Now with architecture

## Introduction

This project pretends to be the second version of the App that is intended to be develop as Final
Project.

This version pretends to implement a MVVM architecture so the code is easier to develop in the
future.

This project complements with the NodeJS API.

## Execution

App has 2 environments:

- dev
- prod

To run the app in a particular environment, run:

- dev:

```bash
flutter run --flavor dev --dart-define-from-file=.env/dev.json
```

- prod:

```bash
flutter run --flavor prod --dart-define-from-file=.env/prod.json
```

Also, you can configure your IDE to automatically run a defined behaviour

## Dependency Injection

Depencency injection is done with [get_it](https://pub.dev/packages/get_it) and
[injectable](https://pub.dev/packages/injectable).

If a new dependency is added or changed, you must run:

```bash
dart run packages pub run build_runner build
```

## To-Do List

* Splash
* Revisar los colores de la IU
* Conectar con la API
    * http vs dio package
* Integrar arquitectura
* Repasar fuentes y ver una forma mejor de ponerlas
* Hacer los estilos de texto
    * Revisar fuentes
* Revisar themes
* Repasar inyección de dependencias
* Añadir localización
* Entornos
* Gestion de errores
    * Mirar Either
* Ver cómo separar las distintas carpetas de model
* Refactorizar a inglés