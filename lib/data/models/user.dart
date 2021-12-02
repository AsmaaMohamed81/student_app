class User {
  User(
      {this.userId,
      this.fullName,
      this.userName,
      this.email,
      this.accessToken,
      this.userType,
      this.photo,
      this.mainRoleId,
      this.mainRoleType});

  int? userId;
  String? fullName;
  String? userName;
  String? email;
  String? accessToken;
  String? userType;
  String? photo;
  int? mainRoleId;
  String? mainRoleType;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        fullName: json["fullName"],
        userName: json["userName"],
        email: json["email"],
        accessToken: json["accessToken"],
        userType: json["userType"],
        photo: json["photo"],
        mainRoleId: json["mainRoleId"],
        mainRoleType: json["mainRoleType"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "userName": userName,
        "email": email,
        "accessToken": accessToken,
        "userType": userType,
        "photo": photo,
        "mainRoleId": mainRoleId,
        "mainRoleType": mainRoleType,
      };
}
