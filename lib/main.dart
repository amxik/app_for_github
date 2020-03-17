import 'package:app_for_github/services/navigation.dart';
import 'package:app_for_github/services/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      initialRoute: NavigationRoutes.repos,
      onGenerateRoute: Routes.generateRoute,
    ));
