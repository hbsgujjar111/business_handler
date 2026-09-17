class UserDataModel {
  final String? fullName;
  final int? userId;
  final String? userName;
  final String? riderCnic;
  final String? riderBikeNo;
  final String? riderAddress;
  final String? contactNo;
  final int? riderId;
  final int? branchId;
  final RiderCompanyInfo? riderCompanyInfo;

  UserDataModel({
    this.fullName,
    this.userId,
    this.userName,
    this.riderCnic,
    this.riderBikeNo,
    this.riderAddress,
    this.contactNo,
    this.riderId,
    this.branchId,
    this.riderCompanyInfo,
  });

  factory UserDataModel.fromMap(Map<String, dynamic> json) => UserDataModel(
    fullName: json["FullName"],
    userId: json["UserID"],
    userName: json["UserName"],
    riderCnic: json["RiderCNIC"],
    riderBikeNo: json["RiderBikeNo"],
    riderAddress: json["RiderAddress"],
    contactNo: json["ConatactNo"],
    riderId: json["RiderID"],
    branchId: json["BranchID"],
    riderCompanyInfo: json["RiderCompanyInfo"] == null ? null : RiderCompanyInfo.fromMap(json["RiderCompanyInfo"]),
  );

  Map<String, dynamic> toMap() => {
    "FullName": fullName,
    "UserID": userId,
    "UserName": userName,
    "RiderCNIC": riderCnic,
    "RiderBikeNo": riderBikeNo,
    "RiderAddress": riderAddress,
    "ConatactNo": contactNo,
    "RiderID": riderId,
    "BranchID": branchId,
    "RiderCompanyInfo": riderCompanyInfo?.toMap(),
  };
}

class RiderCompanyInfo {
  final int? companyId;
  final String? companyCode;
  final String? companyName;
  final bool? companyStatus;
  final String? companyLogo;
  final String? companyContactNo;
  final String? companyLogoWeb;
  final List<BranchesList>? branchesList;

  RiderCompanyInfo({
    this.companyId,
    this.companyCode,
    this.companyName,
    this.companyStatus,
    this.companyLogo,
    this.companyContactNo,
    this.companyLogoWeb,
    this.branchesList,
  });

  factory RiderCompanyInfo.fromMap(Map<String, dynamic> json) => RiderCompanyInfo(
    companyId: json["CompanyID"],
    companyCode: json["CompanyCode"],
    companyName: json["CompanyName"],
    companyStatus: json["CompanyStatus"],
    companyLogo: json["CompanyLogo"],
    companyContactNo: json["CompanyContactNo"],
    companyLogoWeb: json["CompanyLogoWeb"],
    branchesList: json["BranchesList"] == null
        ? []
        : List<BranchesList>.from(json["BranchesList"]!.map((x) => BranchesList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "CompanyID": companyId,
    "CompanyCode": companyCode,
    "CompanyName": companyName,
    "CompanyStatus": companyStatus,
    "CompanyLogo": companyLogo,
    "CompanyContactNo": companyContactNo,
    "CompanyLogoWeb": companyLogoWeb,
    "BranchesList": branchesList == null ? [] : List<dynamic>.from(branchesList!.map((x) => x.toMap())),
  };
}

class BranchesList {
  final int? branchId;
  final String? branchName;
  final String? branchLat;
  final String? branchLong;
  final String? branchContact;
  final String? branchManagerName;
  final String? branchImgUrl;
  final String? branchApiUrl;

  BranchesList({
    this.branchId,
    this.branchName,
    this.branchLat,
    this.branchLong,
    this.branchContact,
    this.branchManagerName,
    this.branchImgUrl,
    this.branchApiUrl,
  });

  factory BranchesList.fromMap(Map<String, dynamic> json) => BranchesList(
    branchId: json["Branch_ID"],
    branchName: json["Branch_Name"],
    branchLat: json["Branch_Lat"],
    branchLong: json["Branch_Long"],
    branchContact: json["Branch_Contact"],
    branchManagerName: json["Branch_Manager_Name"],
    branchImgUrl: json["Branch_Img_Url"],
    branchApiUrl: json["Branch_API_Url"],
  );

  Map<String, dynamic> toMap() => {
    "Branch_ID": branchId,
    "Branch_Name": branchName,
    "Branch_Lat": branchLat,
    "Branch_Long": branchLong,
    "Branch_Contact": branchContact,
    "Branch_Manager_Name": branchManagerName,
    "Branch_Img_Url": branchImgUrl,
    "Branch_API_Url": branchApiUrl,
  };
}
