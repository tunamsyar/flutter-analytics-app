# Default target
.PHONY: run run-web run-android run-ios run-macos run-linux run-windows run-dev

run: run-web

run-web:
	flutter run -d chrome

run-android:
	flutter run -d android

run-ios:
	flutter run -d ios

run-macos:
	flutter run -d macos

run-linux:
	flutter run -d linux

run-windows:
	flutter run -d windows

run-dev:
	flutter run
