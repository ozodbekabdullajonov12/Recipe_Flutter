import 'package:flutter/material.dart';
import 'package:recipe_app/features/auth/data/repositories/user_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  final UserRepository _repo;

  SignUpViewModel({required UserRepository repo}) : _repo = repo;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool showObscureText=false;
  bool confirmShowObscureText=false;

  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  set selectedDate(DateTime? value) {
    _selectedDate = value ?? _selectedDate;
    notifyListeners();
  }

  Future<bool> signUp() async {
    final result = await _repo.signUp(
      name: nameController.text,
      surname: surnameController.text,
      username: usernameController.text,
      email: emailController.text,
      phoneNumber: numberController.text,
      dateOfBirth: selectedDate!,
      password: passwordController.text,
    );
    return result;
  }

  void showPassword(){
    showObscureText= !showObscureText;
    notifyListeners();
  }
  void confirmShowPassword(){
    confirmShowObscureText= !confirmShowObscureText;
    notifyListeners();
  }
}
