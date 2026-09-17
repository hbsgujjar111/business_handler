import 'user_data_model.dart';

class LoginDataModel {
  final bool? isLoggedIn;
  final String? devAppId;
  final String? username;
  final String? password;
  final String? fcmToken;
  final BranchesList? selectedBranch;

  LoginDataModel({this.isLoggedIn, this.devAppId, this.username, this.password, this.fcmToken, this.selectedBranch});

  LoginDataModel copyWith({
    bool? isLoggedIn,
    String? devAppId,
    String? username,
    String? password,
    String? fcmToken,
    BranchesList? selectedBranch,
  }) => LoginDataModel(
    isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    devAppId: devAppId ?? this.devAppId,
    username: username ?? this.username,
    password: password ?? this.password,
    fcmToken: fcmToken ?? this.fcmToken,
    selectedBranch: selectedBranch ?? this.selectedBranch,
  );

  factory LoginDataModel.fromMap(Map<String, dynamic> json) => LoginDataModel(
    isLoggedIn: json["isLoggedIn"],
    devAppId: json["devAppId"],
    username: json["username"],
    password: json["password"],
    fcmToken: json["fcmToken"],
    selectedBranch: json["selectedBranch"] == null ? null : BranchesList.fromMap(json["selectedBranch"]),
  );

  Map<String, dynamic> toMap() => {
    "isLoggedIn": isLoggedIn,
    "devAppId": devAppId,
    "username": username,
    "password": password,
    "fcmToken": fcmToken,
    "selectedBranch": selectedBranch?.toMap(),
  };
}
