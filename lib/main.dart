import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'config/routes.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const AngicalTurismoApp(),
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  bool _isHighContrast = false;

  bool get isHighContrast => _isHighContrast;

  void toggleTheme() {
    _isHighContrast = !_isHighContrast;
    notifyListeners();
  }
}

class AngicalTurismoApp extends StatelessWidget {
  const AngicalTurismoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Angical Turismo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.highContrastTheme,
      themeMode: themeProvider.isHighContrast ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/login',
      onGenerateRoute: AppRoutes.generateRoute,
      builder: (context, child) {
        return child ?? const SizedBox();
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
         Locale('pt', 'BR'),
      ],
    );
  }
}
