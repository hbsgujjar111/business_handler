import 'package:hooks_riverpod/legacy.dart';

import '../../features/authentication/models/login_data_model.dart';
import '../../features/authentication/models/user_data_model.dart';
import '../helpers/overlay_helper.dart';

class AppConstants {
  AppConstants._();

  static String appVersion = "0.0.0";
  static String appVersionFull = "0.0.0+1";

  static final isLoggedIn = StateProvider<bool>((ref) => false);
  static UserDataModel userData = UserDataModel();
  static LoginDataModel loginData = LoginDataModel();

  static OverlayHelper entry = OverlayHelper();
}
