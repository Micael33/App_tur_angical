import 'package:flutter/material.dart';
import '../../core/l10n/strings.dart';
import 'accessibility_info_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.categoryServices),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Informações de Acessibilidade"),
            leading: const Icon(Icons.accessibility_new),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AccessibilityInfoScreen()));
            },
          ),
           const Divider(),
          const ListTile(
            title: Text("Hospitais e Emergências"),
            leading: Icon(Icons.local_hospital),
          ),
          const ListTile(
            title: Text("Hotéis e Pousadas"),
            leading: Icon(Icons.hotel),
          ),
          const ListTile(
            title: Text("Restaurantes"),
            leading: Icon(Icons.restaurant),
          ),
        ],
      ),
    );
  }
}
