import 'package:app_for_github/services/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      onGenerateRoute: Routes.generateRoute,
    ));
