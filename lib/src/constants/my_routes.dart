import 'package:flutter/material.dart';
import 'package:moviesapp/src/pages/login_page.dart';
import 'package:moviesapp/src/pages/movie_detail_screen.dart';
import 'package:moviesapp/src/pages/peticion_token.dart';

enum Routes { login, peticionT, detail }

class MyRoutes {
  static final routes = {
    Routes.login.name: (BuildContext context) => LoginPage(),
    Routes.peticionT.name: (BuildContext context) => PeticionToken(),
    Routes.detail.name: (BuildContext context) => MovieDetailScreen()
  };
}
