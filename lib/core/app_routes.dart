import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:exman_ruben_alvarado_62111565/screens/home_screen.dart';
import 'package:exman_ruben_alvarado_62111565/screens/second_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/second',
      builder: (context, state) => SecondScreen(),
    ),
  ],
);
