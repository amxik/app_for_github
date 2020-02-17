

import 'package:flutter/material.dart';


class NavigationRoutes{
  static final String repos = "/repos";
  static final String issues = "/issues";
}

class NavigationService{

  const NavigationService();

  openReposPage(BuildContext context){
    Navigator.pushNamed(context, NavigationRoutes.repos);
  }


}