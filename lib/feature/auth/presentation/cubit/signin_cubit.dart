import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wa7ed/feature/auth/presentation/states/signin_states.dart';

class SignInCubit extends Cubit<SignInStates>{
  SignInCubit() : super(SignInInitialState());
  bool isOccurred = true;
  bool confirmIsOccurred = true;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String selectedCountryCode = "+20";

  @override
  Future<void>close(){
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  void togglePassword(){
    isOccurred = !isOccurred;
    emit(SignInTogglePasswordState());
  }

  void confirmTogglePassword(){
    confirmIsOccurred = !confirmIsOccurred;
    emit(SignInTogglePasswordState());
  }

}