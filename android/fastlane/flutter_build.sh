#!/bin/bash
cd ../../
if [ "$1" == "--clean" ]
then
   echo "Running clean..."
   flutter clean
else
   echo "Skipping clean..."
fi
if [ "$1" == "--staging_apk" ]
then
   echo "Building Staging APK..."
   flutter clean
   flutter build apk --release --flavor staging -t lib/core/flavour/main_staging.dart
elif [ "$1" == "--production_apk" ]
then
   echo "Building Production APK..."
   flutter clean
   flutter build apk --release --flavor prod -t lib/core/flavour/main_prod.dart
else
   echo "Building AAB..."
   flutter clean
   flutter build appbundle --release --flavor prod -t lib/core/flavour/main_prod.dart
fi