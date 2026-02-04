import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/home/home_screen.dart';
import 'core/widgets/vlibras_widget.dart';

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
      darkTheme: AppTheme.highContrastTheme, // Using darkTheme slot for high contrast for now, or custom
      themeMode: themeProvider.isHighContrast ? ThemeMode.dark : ThemeMode.light,
      home: const HomeScreen(),
      builder: (context, child) {
        return Stack(
          children: [
             if (child != null) child,
             const Positioned(
               right: 16,
               top: 200, // Arbitrary position for VLibras widget
               child: VLibrasWidget(),
             ),
          ],
        );
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
