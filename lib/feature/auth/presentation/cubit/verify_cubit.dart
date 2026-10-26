import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wa7ed/feature/auth/presentation/states/verify_states.dart';

class VerifyCubit extends Cubit<VerifyStates> {
  VerifyCubit() : super(VerifyInitialState());

  Timer? timer;
  int seconds = 30;
  bool get canResend => seconds == 0;

  void startTimer() {
    timer?.cancel();
    seconds = 30;
    emit(VerifyReloadTimeState());
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds > 0) {
        seconds--;
        emit(VerifyReloadTimeState());
        if (seconds == 0) {
          t.cancel();
        }
      } else {
        t.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
