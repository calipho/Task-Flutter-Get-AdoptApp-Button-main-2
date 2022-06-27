import 'package:adopt_app/pages/home_page.dart';
import 'package:adopt_app/pages/signin_page.dart';
import 'package:adopt_app/pages/signup_page.dart';
import 'package:adopt_app/providers/auth_providers.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      // ChangeNotifierProvider(
      //   create: (context) => PetsProvider(),
      //   child: MyApp(),
      // ),
      MultiProvider(
    providers: [
      ChangeNotifierProvider<PetsProvider>(create: (_) => PetsProvider()),
      ChangeNotifierProvider<AuthProviders>(create: (_) => AuthProviders()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: "/signup",
        builder: (context, state) => SignUp(),
      ),
      GoRoute(
        path: "/signin",
        builder: (context, state) => SignIn(),
      ),
    ],
  );
}
