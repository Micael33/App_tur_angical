import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TouristSpotsPage extends StatelessWidget {
  const TouristSpotsPage({super.key});

  // Sample tourist spots data
  List<Map<String, dynamic>> get _spots => [
    {
      'name': 'Cachoeira do Rio Claro',
      'rating': 4.8,
      'distance': '15 km',
      'description': 'Bela cachoeira com piscina natural cercada por mata preservada',
      'icon': Icons.water,
      'reviews': 312,
    },
    {
      'name': 'Gruta da Lapa',
      'rating': 4.6,
      'distance': '22 km',
      'description': 'Gruta subterrânea histórica com formações cristalinas raras',
      'icon': Icons.layers,
      'reviews': 248,
    },
    {
      'name': 'Pico da Aventura',
      'rating': 4.9,
      'distance': '8 km',
      'description': 'Trilha com vista panorâmica de Angical e arredores',
      'icon': Icons.landscape,
      'reviews': 425,
    },
    {
      'name': 'Praia Fluvial',
      'rating': 4.5,
      'distance': '5 km',
      'description': 'Praia de rio com areia branca ideal para piqueniques',
      'icon': Icons.beach_access,
      'reviews': 189,
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
          'Pontos Turísticos',
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
              label: _spots.length.toString() + ' pontos turísticos em Angical',
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _spots.length,
                itemBuilder: (context, index) {
                  final spot = _spots[index];
                  return Semantics(
                    button: true,
                    enabled: true,
                    label: spot['name'] + ', ' + spot['rating'].toString() + ' estrelas',
                    onTap: () => _showSpotDetails(context, spot, surfaceColor, textColor, isDark),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                          width: 1.5,
                        ),
                      ),
                      child: InkWell(
                        onTap: () => _showSpotDetails(context, spot, surfaceColor, textColor, isDark),
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      spot['name'] as String,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF137FEC).withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          spot['rating'].toString(),
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                spot['description'] as String,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 13,
                                  color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 14,
                                        color: const Color(0xFF137FEC),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        spot['distance'] as String,
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 12,
                                          color: const Color(0xFF137FEC),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${spot['reviews']} avaliações',
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

  void _showSpotDetails(
    BuildContext context,
    Map<String, dynamic> spot,
    Color surfaceColor,
    Color textColor,
    bool isDark,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: surfaceColor,
        title: Text(
          spot['name'] as String,
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
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${spot['rating']} (${spot['reviews']} avaliações)',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Semantics(
                enabled: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Distância: ${spot['distance']}',
                      style: GoogleFonts.plusJakartaSans(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      spot['description'] as String,
                      style: GoogleFonts.plusJakartaSans(
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Semantics(
            button: true,
            label: 'Fechar detalhes do ponto turístico',
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
            label: 'Marcar caminhada para ' + (spot['name'] as String),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${spot['name']} adicionado aos favoritos!'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              Navigator.pop(context);
            },
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${spot['name']} adicionado aos favoritos!'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF137FEC),
              ),
              child: Text(
                'Adicionar aos Favoritos',
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
