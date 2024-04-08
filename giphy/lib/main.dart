import 'package:flutter/material.dart';
import 'package:giphy/screens/HomeScreen.dart';
import 'package:giphy/services/GifService.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<BaseModel>(
      create: (_) => BaseModel(),
    ),
    ChangeNotifierProvider<GiphsModel>(
      create: (_) => GiphsModel(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(
        useMaterial3: true,
      ),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Giphy Demo',
        theme: theme,
        darkTheme: darkTheme,
        home: HomeScreen(),
      ),
    );
  }
}
