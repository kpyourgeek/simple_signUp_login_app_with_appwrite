import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kp/pages/homepage.dart';
import 'package:kp/pages/signup_view.dart';
import 'pages/signin_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'signUp',
      routes: {
        '/': (context) => const SignUpView(),
        '/signIn': (context) => const SignInView(),
        '/signUp': (context) => const SignUpView(),
      },
      title: 'Creating User',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
