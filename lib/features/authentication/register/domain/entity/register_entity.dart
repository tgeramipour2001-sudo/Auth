class RegisterEntity {
  //final String accessToken;
  final String username;
  final String password;
  final bool saveInfo;

  RegisterEntity({
    required this.username,
    required this.password, required this.saveInfo,
  //  required this.accessToken,
  });
}
