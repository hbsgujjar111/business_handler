import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../features/authentication/models/login_data_model.dart';
import '../../features/authentication/models/user_data_model.dart';
import '../../utils/constants/app_constants.dart';

class StorageService {
  StorageService._();

  static final _box = GetStorage();

  static const _selectedBusinessKey = 'selected_business_id';

  static Future<void> saveSelectedBusiness(String id) => _box.write(_selectedBusinessKey, id);

  static String? getSelectedBusiness() => _box.read<String>(_selectedBusinessKey);

  static Future<void> clear() => _box.erase();

  ///

  static const String basicDataKey = "basicData";
  static const String loginDataKey = "loginData";
  static const String userDataKey = "userData";
  static const String isOnlineKey = "isOnline";

  // static const String appLanguageKey = "appLanguage";
  // static const String appThemeKey = "appTheme";

  /// save & get login data
  /// save login data
  static Future<void> saveLoginData({required LoginDataModel loginData}) async {
    final box = GetStorage();

    box.remove(loginDataKey);
    final jsonString = jsonEncode(loginData.toMap());
    box.write(loginDataKey, jsonString);

    AppConstants.loginData = loginData;

    Logger().i("Login data saved ${loginData.toMap()})");
  }

  /// get login data
  static Future<void> getLoginData() async {
    try {
      final box = GetStorage();

      final storedData = box.read(loginDataKey);

      Logger().d("login data fetched $storedData");
      if (storedData != null) {
        final storedUser = LoginDataModel.fromMap(jsonDecode(storedData));
        AppConstants.loginData = LoginDataModel();
        AppConstants.loginData = storedUser;
      }
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  /// save, get & remove user data
  /// save user data
  static Future<void> saveUserData({required UserDataModel userData}) async {
    final box = GetStorage();
    final jsonString = jsonEncode(userData.toMap());
    box.remove(userDataKey);
    box.write(userDataKey, jsonString);

    AppConstants.userData = userData;

    Logger().i("user data saved ${userData.toMap()}");
  }

  /// get user data
  static Future<void> getUserData() async {
    try {
      final box = GetStorage();

      final storedData = box.read(userDataKey);

      Logger().d("user data fetched $storedData");
      if (storedData != null) {
        final storedUser = UserDataModel.fromMap(jsonDecode(storedData));
        AppConstants.userData = UserDataModel();
        AppConstants.userData = storedUser;
      }
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  /// remove user data
  static Future<void> removeUserData() async {
    final box = GetStorage();

    await box.remove(userDataKey);

    AppConstants.userData = UserDataModel();
    AppConstants.loginData = AppConstants.loginData.copyWith(isLoggedIn: false);
    saveLoginData(loginData: AppConstants.loginData);
  }

  /// save, get user online status data
  /// save user online status
  static Future<void> saveUserStatus({required bool status}) async {
    final box = GetStorage();
    box.remove(isOnlineKey);
    box.write(isOnlineKey, status);

    Logger().i("user online status saved $status");
  }

  /// get app language data
  static bool getUserStatus() {
    try {
      final box = GetStorage();
      final storedData = box.read(isOnlineKey);

      Logger().d("user online status fetched $storedData");
      return storedData ?? false;
    } catch (e) {
      Logger().e(e.toString());
      return false;
    }
  }

  static Future<void> logout() async {
    final box = GetStorage();

    box.erase();
    Logger().i("All stored data erased");
  }

  // /// save, get app language data
  // /// save app language data
  // static Future<void> saveAppLanguageData({required Map language}) async {
  //   final box = GetStorage();
  //   final jsonString = jsonEncode(language);
  //   box.remove(appLanguageKey);
  //   box.write(appLanguageKey, jsonString);
  //
  //   Logger().i("app language data saved $language");
  // }
  //
  // /// get app language data
  // static Future<Map> getAppLanguageData() async {
  //   try {
  //     final box = GetStorage();
  //     final storedData = box.read(appLanguageKey);
  //
  //     Logger().d("app language data fetched $storedData");
  //     if (storedData != null) {
  //       return jsonDecode(storedData);
  //     } else {
  //       return AppConstants.languageList.first;
  //     }
  //   } catch (e) {
  //     Logger().e(e.toString());
  //     return AppConstants.languageList.first;
  //   }
  // }
  //
  // /// save & get app theme data
  // /// save app theme data
  // static Future<void> saveAppThemeData({required Map theme}) async {
  //   final box = GetStorage();
  //   final jsonString = jsonEncode(theme);
  //   box.remove(appThemeKey);
  //   box.write(appThemeKey, jsonString);
  //
  //   Logger().i("app theme data saved $theme");
  // }
  //
  // /// get app theme data
  // static Future<Map> getAppThemeData() async {
  //   try {
  //     final box = GetStorage();
  //     final storedData = box.read(appThemeKey);
  //
  //     Logger().d("app theme data fetched $storedData");
  //     if (storedData != null) {
  //       return jsonDecode(storedData);
  //     } else {
  //       return AppConstants.themeList.first;
  //     }
  //   } catch (e) {
  //     Logger().e(e.toString());
  //     return AppConstants.themeList.first;
  //   }
  // }
}
