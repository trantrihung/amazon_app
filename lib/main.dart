import 'package:amazon_app/constants/global_variable.dart';
import 'package:amazon_app/features/auth/screens/signin_screen.dart';
import 'package:amazon_app/features/auth/screens/signup_screen.dart';
import 'package:amazon_app/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariable.secondaryColor,
        ),
        scaffoldBackgroundColor: GlobalVariable.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const SignUp(),
    );
  }
}
// Scaffold(
//         appBar: AppBar(
//           title: const Text("Hello"),
//         ),
//         body: Column(
//           children: [
//             Builder(builder: (context) {
//               return ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, AuthScreen.routeName);
//                 },
//                 child: Text("Click"),
//               );
//             }),
//           ],
//         ),
//       ),
