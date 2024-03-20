import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kp/ReusableWidgets/reusable_textfield.dart';
import 'package:kp/controllers/auth_controller.dart';
// import 'package:kp/secondpage.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpView());
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpView();
}

class _SignUpView extends ConsumerState<SignUpView> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Call dispose() on each TextEditingController
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
        email: mailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    // final isLoading = ref.watch(authControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Sign Up'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthField(myController: mailController, hintText: ' Your email'),
              const SizedBox(
                height: 15,
              ),
              AuthField(myController: passwordController, hintText: 'Password'),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: onSignUp, child: const Text('Submit')),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: 'Sign in',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signIn');
                          })
                  ]))
            ],
          ),
        )),
      ),
    );
  }
}
