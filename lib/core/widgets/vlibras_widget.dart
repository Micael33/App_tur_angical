import 'package:flutter/material.dart';

class VLibrasWidget extends StatelessWidget {
  const VLibrasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // In a real app, this would integrate with the VLibras plugin or WebView.
    // Here we provide a semantic floating button simulation.
    return Semantics(
      label: "Tradutor de Libras (VLibras)",
      button: true,
      child: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text("VLibras"),
              content: Text("O componente VLibras estaria ativo aqui."),
            ),
          );
        },
        tooltip: 'VLibras',
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.sign_language, color: Colors.white),
      ),
    );
  }
}
