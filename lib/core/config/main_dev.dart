import '../../main.dart';
import '../util/FlavorConfig.dart';

void main() {
  FlavorConfig(
    // todo update here
    flavor: Flavor.DEV,
    baseUrl: "https://development/api/",
  );
  mainDelegate();
}
