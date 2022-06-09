import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({required AuthService authService})
      : _authService = authService,
        super(const LoginState.initial());

  Future<void> signIn() async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.loading));
      await _authService.signIn();
    } catch (e, s) {
      log('Erro Ao Realizar Login no Google', error: e, stackTrace: s);
      emit(state.copyWith(
          loginStatus: LoginStatus.failure,
          message: 'Erro Ao Realizar Login Google'));
    }
  }
}