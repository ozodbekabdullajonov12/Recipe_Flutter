import 'package:flutter/cupertino.dart';

import 'package:recipe_app/features/auth/data/repositories/user_repository.dart';

class AuthViewModel extends ChangeNotifier {

  AuthViewModel({required UserRepository authRepo}):_authRepo=authRepo;
  final UserRepository _authRepo;
  final TextEditingController loginController=TextEditingController();

  final TextEditingController passwordController=TextEditingController();

  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
   String? _errorMessage;
   String? get errorMessage=>_errorMessage;

    bool showObscureText=false;
   bool get hasError=> _errorMessage!=null;


   Future<bool> login() async{
     try{
       await _authRepo.login(login: loginController.text, password: passwordController.text);
       _errorMessage=null;
       notifyListeners();
       return true;
     }on Exception catch(e){
       _errorMessage=e.toString();
       notifyListeners();
       return false;
     }

   }


   void showPassword(){
   showObscureText= !showObscureText;
     notifyListeners();
   }
}