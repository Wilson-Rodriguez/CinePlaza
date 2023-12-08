import 'package:flutter/material.dart';
import 'package:moviesapp/src/constants/globals.dart' as globals;
import 'package:moviesapp/src/constants/my_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:
          globals.token == null ? Routes.login.name : Routes.peticionT.name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      routes: MyRoutes.routes,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(),
            body: Text('La ruta ${settings.name} no existe'),
          ),
        );
      },
    );
  }
}
