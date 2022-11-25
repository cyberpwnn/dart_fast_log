Super simple colored logging for the impatient developer

## Features

Simple logging with colors

## Usage

```dart
// If you are on flutter in main or somewhere make sure to run
// This is to ensure printing only happens in debug mode.
lDebugMode = kDebugMode;

info(42);
success("Hello world");
warning(73.77);
error("Hello world");
verbose(Object());
navigation("Hello world");
actioned("Hello world");
```