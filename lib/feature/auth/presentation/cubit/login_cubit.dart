import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wa7ed/feature/auth/presentation/states/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  bool isOccurred = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePassword() {
    isOccurred = !isOccurred;
    emit(LoginTogglePasswordState());
  }

  void updateForm(){
    emit(LoginUpdateFormState());
  }
}
