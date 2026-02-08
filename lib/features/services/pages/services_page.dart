import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      'name': 'Hospedagem',
      'icon': Icons.hotel,
      'description': 'Hotéis, pousadas e resorts',
      'available': 24,
    },
    {
      'name': 'Restaurantes',
      'icon': Icons.restaurant,
      'description': 'Culinária local e internacional',
      'available': 18,
    },
    {
      'name': 'Guia Turístico',
      'icon': Icons.person,
      'description': 'Guias profissionais certificados',
      'available': 12,
    },
    {
      'name': 'Transporte',
      'icon': Icons.directions_car,
      'description': 'Aluguel de carros e transfers',
      'available': 8,
    },
    {
      'name': 'Aventura',
      'icon': Icons.hiking,
      'description': 'Trilhas, rafting e esportes radicais',
      'available': 6,
    },
    {
      'name': 'Spa & Bem-estar',
      'icon': Icons.spa,
      'description': 'Relaxamento e terapias',
      'available': 4,
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
          'Serviços',
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
              label: services.length.toString() + ' categorias de serviços disponíveis',
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Semantics(
                    button: true,
                    enabled: true,
                    label: service['name'] + ', ' + service['available'].toString() + ' opções disponíveis',
                    onTap: () => _showServiceDetails(context, service, surfaceColor, textColor, isDark),
                    child: Container(
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
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () => _showServiceDetails(context, service, surfaceColor, textColor, isDark),
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF137FEC).withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  service['icon'] as IconData,
                                  color: const Color(0xFF137FEC),
                                  size: 28,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    service['name'] as String,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${service['available']} opções',
                                    textAlign: TextAlign.center,
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

  void _showServiceDetails(
    BuildContext context,
    Map<String, dynamic> service,
    Color surfaceColor,
    Color textColor,
    bool isDark,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: surfaceColor,
        title: Text(
          service['name'] as String,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        content: Semantics(
          enabled: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                service['description'] as String,
                style: GoogleFonts.plusJakartaSans(
                  color: textColor,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${service['available']} opções disponíveis em Angical',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFF137FEC),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Semantics(
            button: true,
            label: 'Fechar',
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
            label: 'Reservar ' + (service['name'] as String),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Buscando ${service['name']}...'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              Navigator.pop(context);
            },
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Buscando ${service['name']}...'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF137FEC),
              ),
              child: Text(
                'Reservar',
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
