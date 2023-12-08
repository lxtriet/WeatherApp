<h1 align="center">
  <br>
  <img src="assets/icons/ic_launcher_pro.png" alt="Weather App Logo" width="350"></a>
  <br>
   Weather App 
  <br>
</h1>

## Table of Contents
* [About the Project](#about-the-project)
* [Key Features](#key-features)
* [Project environment](#project-environment)
* [Requirements](#requirements)
* [Install, build and run!](#install-build-and-run)
* [Dependencies](#dependencies)

## About the project
Weather App  is an application that allows users to look up the weather in cities via name or zipcode

## Key Features
- Fetch weather by city name or zipcode
- Change language

* **State management**: BloC, repository patterns.
* **Backend connection**: 
- https://openweathermap.org/api

## 🔥 Project Environment

  1. Flutter version 3.16.0

  2. Dart version 3.2.0

## ✨ Requirements

* Any Operating System (ie. MacOS X, Linux, Windows)
* Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio, VSCode etc)
* A little knowledge of Dart and Flutter

## Install, build and run!

Make sure you have Flutter installed on your local machine. For more instructions on how to install flutter, look [here](https://flutter.io/docs/get-started/install).

Clone and run this application, you'll need [Git](https://git-scm.com) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/lxtriet/WeatherApp.git

# Go into the repository
$ cd WeatherApp
```

Download Android Studio or Visual Studio with Flutter editor plugins. After that, open the project and install dependencies from pubspec.yaml by running the following command:
```bash
$ flutter pub get
```
🔥 Run time(Make sure you have a connected mobile device or simulator):

```bash
# Run with environment:
- For dev:
$ flutter run --flavor dev -t lib/main_dev.dart

- For staging:
$ flutter run --flavor stg -t lib/main_stg.dart

- For production:
$ flutter run --flavor pro -t lib/main_pro.dart
```

🔥 Build:

```bash
# Build APK for Android
$ flutter build apk --release --split-per-abi --flavor pro -t lib/main_pro.dart


# Build IPA for iOS
$ flutter build ipa --release -obfuscate --split-debug-info --flavor pro -t lib/main_pro.dart

```

## ✨ Dependencies
This software uses the following packages:

- [Dartz](https://pub.dev/packages/dartz)
- [Intl](https://pub.dev/packages/intl)
- [Get_It](https://pub.dev/packages/get_it)
...
