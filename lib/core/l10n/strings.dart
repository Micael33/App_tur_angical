import 'package:flutter/material.dart';

// Simple localization class to avoid complex generation setup in this environment if needed, 
// though we added flutter_localizations. 
// For this MVP, we will use a simple map-based approach or basic localized resource class 
// if generation fails/is too complex to automate here.
// But let's try to do it the right way with `AppLocalizations` if generation works.
// Since I cannot run `flutter gen-l10n` easily without configuring l10n.yaml, 
// I will create a simple wrapper for now to ensure compile safety.

class Strings {
  static const String appTitle = "Angical Turismo";
  static const String homeWelcome = "Bem-vindo a Angical do Piauí";
  static const String categoryTouristSpots = "Pontos Turísticos";
  static const String categoryEvents = "Eventos e Cultura";
  static const String categoryServices = "Serviços e Informações";
  static const String accessibility = "Acessibilidade";
  static const String highContrast = "Alto Contraste";
}
