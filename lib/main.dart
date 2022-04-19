import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'core/utils/constants.dart';
import 'core/utils/theme.dart';
import './ui/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    int theme = prefs.getInt('theme') ?? 0;
    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(themes[theme]),
        child: MaterialApp(
          theme: themes[theme],
          /* theme: ThemeData(
            primaryColor: Colors.greenAccent,
          ), */
          title: 'Wallpapers',
          debugShowCheckedModeBanner: false,
          routes: {
            '/home': (context) => HomePage(),
          },
          home: HomePage(),
        ),
      ),
    );
  });
}
