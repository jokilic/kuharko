import 'package:alice/alice.dart';
import 'package:get/get.dart';

///
/// This is used to initialize `Alice` and use it when necessary
/// Check more about `Alice` here: https://pub.dev/packages/alice
///

class AliceService extends GetxService {
  ///
  /// VARIABLES
  ///

  final alice = Alice(showNotification: false);

  ///
  /// METHODS
  ///

  /// Opens a screen with `Alice`
  void openAlice() => alice.showInspector();
}
