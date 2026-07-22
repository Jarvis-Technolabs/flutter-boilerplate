cd ../../
if [ "$1" == "--clean" ]
then
   echo "Running clean..."
   flutter clean
else
   echo "Skipping clean..."
fi
if [ "$1" == "--ios_staging" ]
then
   echo "Building ios staging app..."
   flutter clean
   gem install cocoapods --user-install
   cd ios
   flutter build ios --release --flavor staging -t lib/config/main_staging.dart
elif [ "$1" == "--ios_prod" ]
then
   echo "Building ios production app..."
   flutter clean
   gem install cocoapods --user-install
   cd ios
   flutter build ios --release --flavor prod -t lib/config/main_prod.dart
else
   echo "else part ..."
fi