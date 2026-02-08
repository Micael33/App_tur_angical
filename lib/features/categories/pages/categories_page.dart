import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8);

    final categories = [
      {
        'label': 'Natureza',
        'icon': Icons.forest,
        'color': Colors.green,
        'bgColorLight': const Color(0xFFDCFCE7),
        'bgColorDark': const Color(0x4D14532D),
        'description': 'Explorar cachoeiras, trilhas e paisagens naturais',
        'itemCount': 15,
      },
      {
        'label': 'Eventos',
        'icon': Icons.event,
        'color': Colors.orange,
        'bgColorLight': const Color(0xFFFFEDD5),
        'bgColorDark': const Color(0x4D7C2D12),
        'description': 'Festivais, shows e eventos culturais',
        'itemCount': 12,
      },
      {
        'label': 'História',
        'icon': Icons.castle,
        'color': Colors.amber,
        'bgColorLight': const Color(0xFFFEF3C7),
        'bgColorDark': const Color(0x4D78350F),
        'description': 'Pontos históricos e patrimônios culturais',
        'itemCount': 8,
      },
      {
        'label': 'Restaurantes e Hotéis',
        'icon': Icons.restaurant,
        'color': Colors.red,
        'bgColorLight': const Color(0xFFFEE2E2),
        'bgColorDark': const Color(0x4D7F1D1D),
        'description': 'Hospedagem, alimentação e gastronomia',
        'itemCount': 24,
      },
      {
        'label': 'Aventura',
        'icon': Icons.paragliding,
        'color': Colors.blue,
        'bgColorLight': const Color(0xFFDEF7FF),
        'bgColorDark': const Color(0x4D0C4A6E),
        'description': 'Atividades radicais e esportes de aventura',
        'itemCount': 10,
      },
      {
        'label': 'Arte e Cultura',
        'icon': Icons.palette,
        'color': Colors.purple,
        'bgColorLight': const Color(0xFFEDE9FE),
        'bgColorDark': const Color(0x4D5B21B6),
        'description': 'Museus, galerias e espaços culturais',
        'itemCount': 7,
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Categorias',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              container: true,
              label: 'Selecione uma categoria para explorar',
              child: Text(
                'Explore todas as categorias disponíveis na região',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF64748B),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _CategoryListItem(
                    label: category['label'] as String,
                    icon: category['icon'] as IconData,
                    color: category['color'] as Color,
                    bgColorLight: category['bgColorLight'] as Color,
                    bgColorDark: category['bgColorDark'] as Color,
                    description: category['description'] as String,
                    itemCount: category['itemCount'] as int,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryListItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final Color bgColorLight;
  final Color bgColorDark;
  final String description;
  final int itemCount;

  const _CategoryListItem({
    required this.label,
    required this.icon,
    required this.color,
    required this.bgColorLight,
    required this.bgColorDark,
    required this.description,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      button: true,
      label: 'Categoria $label com $itemCount itens disponíveis',
      enabled: true,
      onTap: () {
        Navigator.pushNamed(context, '/category-details', arguments: label);
      },
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/category-details', arguments: label);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E293B) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: isDark ? bgColorDark : bgColorLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF137FEC).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '$itemCount itens',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF137FEC),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF94A3B8),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
