import 'flavors.dart';
import 'main.dart';

Future<void> main() async {
  F.appFlavor = Flavor.STAGING;
  await mainCommon();
}
