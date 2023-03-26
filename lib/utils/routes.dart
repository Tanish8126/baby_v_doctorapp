import 'package:baby_v_doctorapp/screens/appointment/appointment_screen.dart';
import 'package:baby_v_doctorapp/screens/profile_screen.dart';
import 'package:flutter/widgets.dart';

import '../screens/home/components/notification_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login_check.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  LoginCheckScreen.routeName: (context) => const LoginCheckScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  AppointmentScreen.routeName: (context) => const AppointmentScreen(),
  NotificationScreen.routename: (context) => const NotificationScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
