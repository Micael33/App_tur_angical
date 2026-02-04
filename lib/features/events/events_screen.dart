import 'package:flutter/material.dart';
import '../../core/l10n/strings.dart';
import '../../core/accessibility/semantics_helper.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.categoryEvents),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildEventItem(
            context, 
            "Festejos de Angical", 
            "24 de Julho", 
            "O maior evento religioso e cultural da cidade.",
          ),
          const SizedBox(height: 16),
           _buildEventItem(
            context, 
            "Festival de Cultura", 
            "Novembro", 
            "Apresentações de dança, música e teatro local.",
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(BuildContext context, String title, String date, String description) {
    return SemanticsHelper.wrapWithSemantics(
      label: "Evento: $title, data: $date. $description",
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.event_available, size: 40, color: Colors.orange),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
