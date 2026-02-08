import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  // Sample events data
  final List<Map<String, dynamic>> events = [
    {
      'title': 'Festival de Música',
      'date': '14 de Fevereiro',
      'location': 'Praça Central',
      'description': 'Grande festival com bandas nacionais e regionais',
      'image': Icons.music_note,
    },
    {
      'title': 'Trilha Ecológica',
      'date': '21 de Fevereiro',
      'location': 'Parque da Natureza',
      'description': 'Caminhada guiada pela mata nativa com guia especialista',
      'image': Icons.nature,
    },
    {
      'title': 'Gastrofestival',
      'date': '28 de Fevereiro',
      'location': 'Centro de Eventos',
      'description': 'Showcase de gastronomia local e internacional',
      'image': Icons.restaurant,
    },
    {
      'title': 'Noite de Cinema',
      'date': '7 de Março',
      'location': 'Praça Central',
      'description': 'Cinema ao ar livre com filmes brasileiros',
      'image': Icons.movie,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8);
    final surfaceColor = isDark ? const Color(0xFF1E293B) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Eventos',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              container: true,
              label: events.length.toString() + ' eventos disponíveis',
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return Semantics(
                    button: true,
                    enabled: true,
                    label: event['title'] + ', ' + event['date'],
                    onTap: () => _showEventDetails(context, event, surfaceColor, textColor, isDark),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () => _showEventDetails(context, event, surfaceColor, textColor, isDark),
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF137FEC).withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  event['image'] as IconData,
                                  color: const Color(0xFF137FEC),
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      event['title'] as String,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      event['date'] as String,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 13,
                                        color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 14,
                                          color: const Color(0xFF137FEC),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          event['location'] as String,
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 12,
                                            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: const Color(0xFF137FEC),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEventDetails(
    BuildContext context,
    Map<String, dynamic> event,
    Color surfaceColor,
    Color textColor,
    bool isDark,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: surfaceColor,
        title: Text(
          event['title'] as String,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Semantics(
                enabled: false,
                child: Text(
                  'Data: ${event['date']}',
                  style: GoogleFonts.plusJakartaSans(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Semantics(
                enabled: false,
                child: Text(
                  'Local: ${event['location']}',
                  style: GoogleFonts.plusJakartaSans(
                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Semantics(
                enabled: false,
                child: Text(
                  event['description'] as String,
                  style: GoogleFonts.plusJakartaSans(
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Semantics(
            button: true,
            label: 'Fechar detalhes do evento',
            onTap: () => Navigator.pop(context),
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Fechar',
                style: GoogleFonts.plusJakartaSans(),
              ),
            ),
          ),
          Semantics(
            button: true,
            label: 'Comprar ingressos para ' + (event['title'] as String),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ingressos para ${event['title']} adicionados ao carrinho'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              Navigator.pop(context);
            },
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Ingressos para ${event['title']} adicionados ao carrinho'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF137FEC),
              ),
              child: Text(
                'Comprar Ingressos',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
