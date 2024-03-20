import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kp/ReusableWidgets/reusable_textfield.dart';
import 'package:kp/controllers/auth_controller.dart';
// import 'package:kp/secondpage.dart';

class SignInView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignInView());
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInView();
}

class _SignInView extends ConsumerState<SignInView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Call dispose() on each TextEditingController
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onSignIn() {
    ref.read(authControllerProvider.notifier).logIn(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Sign In'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthField(myController: emailController, hintText: 'Your email'),
              const SizedBox(
                height: 15,
              ),
              AuthField(myController: passwordController, hintText: 'Password'),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: onSignIn, child: const Text('Submit')),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signUp');
                          })
                  ]))
            ],
          ),
        )),
      ),
    );
  }
}
