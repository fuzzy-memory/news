import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './helpers/articles.dart';
import './screens/about_screen.dart';
import './screens/main_screen.dart';
import './screens/splash_screen.dart';
import './screens/webview_screen.dart';
import 'screens/bookmarks.dart';

Color red = Color.fromRGBO(189, 22, 40, 1);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NewsProvider()),
      ],
      child: Consumer<NewsProvider>(
        builder: (ctx, newsProvider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NewsMate',
          darkTheme: ThemeData(
            primarySwatch: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: "RobotoSlab",
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.dark,
          home: SplashScreen(),
          routes: {
            MainScreen.routeName: (ctx) => MainScreen(),
            WebviewScreen.routeName: (ctx) => WebviewScreen(),
            SplashScreen.routeName: (ctx) => SplashScreen(),
            BookMarksScreen.routeName: (ctx) => BookMarksScreen(),
            AboutScreen.routeName: (ctx) => AboutScreen(),
          },
        ),
      ),
    );
  }
}
