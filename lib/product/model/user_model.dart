class UserModel {
  final String userName;
  final String userSurname;

  String get shortName => '${userName[0]}${userSurname[0]}';
  String get fullName => '${userName} ${userSurname}';

  UserModel(this.userName, this.userSurname);
  factory UserModel.fake() {
    return UserModel("Baris", "Kaya");
  }
}
