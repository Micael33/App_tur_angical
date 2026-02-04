import 'package:flutter/material.dart';
import '../../core/l10n/strings.dart';

class AccessibilityInfoScreen extends StatelessWidget {
  const AccessibilityInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.accessibility)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Recursos de Acessibilidade",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          const ListTile(
            leading: Icon(Icons.visibility),
            title: Text("Deficiência Visual"),
            subtitle: Text("Suporte a leitores de tela e alto contraste."),
          ),
          const ListTile(
            leading: Icon(Icons.hearing),
            title: Text("Deficiência Auditiva"),
            subtitle: Text("Integração com VLibras e legendas (em breve)."),
          ),
          const ListTile(
            leading: Icon(Icons.touch_app),
            title: Text("Deficiência Motora"),
            subtitle: Text("Áreas de toque ampliadas e navegação por teclado."),
          ),
        ],
      ),
    );
  }
}
