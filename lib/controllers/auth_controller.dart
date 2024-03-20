import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kp/apis/auth_api.dart';
import 'package:kp/core/utilis.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  final authApi = ref.watch(authAPIProvider);
  return AuthController(authApi: authApi);
});

class AuthController extends StateNotifier<bool> {
  final AuthApi _authAPI;

  AuthController({required AuthApi authApi})
      : _authAPI = authApi,
        super(false);
  // state = isLoading
  // _account.get() != null : HomeScreen : LogInScreen

  // remember to research why for states on signup and login why we set state first
  // as true and after response we set state to be false
  void signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.signUp(
      email: email,
      password: password,
    );
    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'Account created , Log in');

      // this is added please review

      // Navigator.pushNamed(context, 'signIn');
    });
  }

  void logIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.logIn(email: email, password: password);
    state = false;
    res.fold((l) => showSnackBar(context, l.message),
        (r) => showSnackBar(context, 'Login Successfully'));
  }
}
