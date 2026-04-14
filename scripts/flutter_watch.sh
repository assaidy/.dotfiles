#!/usr/bin/env bash

set -euo pipefail

PID_FILE="/tmp/flutter_app.pid"

watchexec -w ./lib/ -e dart -- "cat $PID_FILE | xargs kill -s USR1" &
watchexec -w ./ -f pubspec.yaml -- "cat $PID_FILE | xargs kill -s USR2" &

echo "Watching..."
echo "Hot reload: ./lib/*.dart | Hot restart: pubspec.yaml"
flutter run --debug --pid-file="$PID_FILE"
