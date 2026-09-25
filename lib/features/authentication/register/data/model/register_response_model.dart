class RegisterResponseModel {
  final String accessToken;
  final String expirationDate;
  final int id;

  RegisterResponseModel({
    required this.accessToken,
    required this.expirationDate,
    required this.id,
  });
}
