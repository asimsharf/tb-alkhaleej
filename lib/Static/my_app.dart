import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tb_alkhalij/Language/scope_model_wrapper.dart';
import 'package:tb_alkhalij/Language/translation.dart';
import 'package:tb_alkhalij/Static/SplashScreenPage.dart';
import 'package:tb_alkhalij/Static/routes.dart';
import 'package:tb_alkhalij/Static/style.dart';
import 'package:tb_alkhalij/homepage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => new MaterialApp(
            locale: model.appLocal,
            localizationsDelegates: [
              const TranslationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('ar', ''), // Arabic
              const Locale('en', ''), // English
            ],
            debugShowCheckedModeBanner: false,
            theme: hrTheme,
            title: 'طب الخليج الدائم',
            home: new SplashScreenPage(),
            routes: routes,
            onGenerateRoute: (RouteSettings settings) {
              final List<String> pathElements = settings.name.split('/');
              if (pathElements[0] != '') {
                return null;
              }
              return null;
            },
            onUnknownRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (BuildContext context) => HomePage(),
              );
            },
          ),
    );
  }
}
