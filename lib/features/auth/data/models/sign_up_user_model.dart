class SignUpUserModel {
  final String password, email, username, name, surname, phoneNumber;
  final DateTime dateOfBirth;
  SignUpUserModel(
      {
      required this.password,
      required this.email,
      required this.username,
      required this.name,
      required this.surname,
      required this.dateOfBirth,
      required this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "firstName": name,
      "lastName": surname,
      "email": email,
      "phoneNumber": phoneNumber,
      "birthDate": "${dateOfBirth.year}-${dateOfBirth.month}-${dateOfBirth.day}",
      "password": password,
    };
  }
}
