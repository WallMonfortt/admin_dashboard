import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/services/services.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';

void main() async {
  await LocalStorage
      .configurePrefs(); // local storage configuration, if we have a token, we'll navigate to dashboard
  CafeApi.configureDio(); // configure dio
  Flurorouter.configureRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Providers for the app state management
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(
            create: (_) =>
                CategoriesProvider()), // we don't need to listen to this provider in the whole app, so we don't need to use lazy: false
        ChangeNotifierProvider(
          lazy:
              true, // we don't need to listen to this provider in the whole app, so we don't need to use lazy: false
          create: (_) => UsersProvider(),
        ),
        ChangeNotifierProvider(create: (_) => UserFormProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.messagerKey,
      builder: (_, child) {
        // return AuthLayout(child: child!);
        // return DashboardLayout(child: child!);
        final authProvider = Provider.of<AuthProvider>(context);
        if (authProvider.authStatus == AuthStatus.checking) {
          return SplashLayout();
        } else if (authProvider.authStatus == AuthStatus.unauthenticated) {
          return AuthLayout(child: child!);
        } else {
          return DashboardLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData().copyWith(
              thumbColor: MaterialStateProperty.all(
        Colors.grey.withOpacity(0.5),
      ))),
    );
  }
}
