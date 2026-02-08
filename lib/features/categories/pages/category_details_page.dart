import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String categoryName;

  const CategoryDetailsPage({
    super.key,
    required this.categoryName,
  });

  // Sample data for each category
  static final categoryData = {
    'Natureza': [
      {
        'name': 'Cachoeira do Encanto',
        'rating': '4.8',
        'location': 'Parque Natural',
        'distance': '12 km',
        'reviews': 324,
        'price': 'Grátis',
        'image': 'https://images.unsplash.com/photo-1439066615861-d1af74d74000?w=500',
      },
      {
        'name': 'Trilha da Serra',
        'rating': '4.6',
        'location': 'Montanha Verde',
        'distance': '8 km',
        'reviews': 212,
        'price': 'Grátis',
        'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=500',
      },
      {
        'name': 'Piscina Natural',
        'rating': '4.7',
        'location': 'Rio Cristalino',
        'distance': '15 km',
        'reviews': 156,
        'price': 'Grátis',
        'image': 'https://images.unsplash.com/photo-1511632765486-a01980e01a18?w=500',
      },
    ],
    'Eventos': [
      {
        'name': 'Festival de Música',
        'rating': '4.9',
        'location': 'Praça Central',
        'distance': '2 km',
        'reviews': 456,
        'price': 'R\$ 80',
        'image': 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500',
      },
      {
        'name': 'Gastrofestival',
        'rating': '4.5',
        'location': 'Centro de Eventos',
        'distance': '5 km',
        'reviews': 189,
        'price': 'Grátis',
        'image': 'https://images.unsplash.com/photo-1555939594-58d7cb561404?w=500',
      },
      {
        'name': 'Noite de Cinema',
        'rating': '4.4',
        'location': 'Praça Central',
        'distance': '2 km',
        'reviews': 128,
        'price': 'R\$ 25',
        'image': 'https://images.unsplash.com/photo-1489599849228-ed4dc9ee86c3?w=500',
      },
    ],
    'História': [
      {
        'name': 'Igreja Matriz Histórica',
        'rating': '4.6',
        'location': 'Centro Histórico',
        'distance': '1 km',
        'reviews': 234,
        'price': 'Grátis',
        'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=500',
      },
      {
        'name': 'Museu Local',
        'rating': '4.3',
        'location': 'Rua das Flores',
        'distance': '3 km',
        'reviews': 145,
        'price': 'R\$ 15',
        'image': 'https://images.unsplash.com/photo-1578301978162-7aae4d755744?w=500',
      },
    ],
    'Restaurantes e Hotéis': [
      {
        'name': 'Hotel Boutique',
        'rating': '4.7',
        'location': 'Centro',
        'distance': '2 km',
        'reviews': 521,
        'price': 'R\$ 280/noite',
        'image': 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=500',
      },
      {
        'name': 'Restaurante Gourmet',
        'rating': '4.8',
        'location': 'Av. Principal',
        'distance': '1 km',
        'reviews': 398,
        'price': 'R\$ 95 p.p',
        'image': 'https://images.unsplash.com/photo-1504674900152-b8b80ce8b93b?w=500',
      },
    ],
    'Aventura': [
      {
        'name': 'Rapel na Cachoeira',
        'rating': '4.9',
        'location': 'Parque Aventura',
        'distance': '20 km',
        'reviews': 298,
        'price': 'R\$ 150',
        'image': 'https://images.unsplash.com/photo-1551632786-de41ec16a85e?w=500',
      },
      {
        'name': 'Parapente',
        'rating': '4.8',
        'location': 'Pico da Ventania',
        'distance': '25 km',
        'reviews': 187,
        'price': 'R\$ 200',
        'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=500',
      },
    ],
    'Arte e Cultura': [
      {
        'name': 'Galeria de Arte',
        'rating': '4.4',
        'location': 'Centro Cultural',
        'distance': '3 km',
        'reviews': 112,
        'price': 'R\$ 20',
        'image': 'https://images.unsplash.com/photo-1578301978162-7aae4d755744?w=500',
      },
      {
        'name': 'Teatro Municipal',
        'rating': '4.6',
        'location': 'Praça das Artes',
        'distance': '4 km',
        'reviews': 245,
        'price': 'R\$ 50',
        'image': 'https://images.unsplash.com/photo-1489599849228-ed4dc9ee86c3?w=500',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8);
    
    final items = categoryData[categoryName] ?? [];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          categoryName,
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
              label: '${items.length} itens encontrados na categoria $categoryName',
              child: Text(
                '${items.length} itens encontrados',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF64748B),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _CategoryItemCard(
                    name: item['name'] as String,
                    rating: item['rating'] as String,
                    location: item['location'] as String,
                    distance: item['distance'] as String,
                    reviews: item['reviews'] as int,
                    price: item['price'] as String,
                    imageUrl: item['image'] as String,
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

class _CategoryItemCard extends StatefulWidget {
  final String name;
  final String rating;
  final String location;
  final String distance;
  final int reviews;
  final String price;
  final String imageUrl;

  const _CategoryItemCard({
    required this.name,
    required this.rating,
    required this.location,
    required this.distance,
    required this.reviews,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<_CategoryItemCard> createState() => _CategoryItemCardState();
}

class _CategoryItemCardState extends State<_CategoryItemCard> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      label: '${widget.name}. Avaliação ${widget.rating}. Preço: ${widget.price}. Localização: ${widget.location}',
      button: true,
      enabled: true,
      onTap: () {
        _showItemDetails(context);
      },
      child: InkWell(
        onTap: () {
          _showItemDetails(context);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with rating and favorite button
              Stack(
                children: [
                  Semantics(
                    image: true,
                    label: '${widget.name}',
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(widget.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Rating badge
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Color(0xFFFBBF24), size: 14),
                          const SizedBox(width: 4),
                          Text(
                            widget.rating,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Favorite button
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Semantics(
                      button: true,
                      label: isFavorited ? 'Remover dos favoritos' : 'Adicionar aos favoritos',
                      enabled: true,
                      onTap: () {
                        setState(() => isFavorited = !isFavorited);
                      },
                      child: GestureDetector(
                        onTap: () {
                          setState(() => isFavorited = !isFavorited);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                isFavorited
                                    ? '${widget.name} adicionado aos favoritos'
                                    : '${widget.name} removido dos favoritos',
                              ),
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFavorited ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Info section
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.name,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : const Color(0xFF0F172A),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.price,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF137FEC),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.location,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.directions_walk,
                          size: 14,
                          color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.distance,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.reviews} avaliações',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showItemDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Semantics(
          container: true,
          label: 'Detalhes de ${widget.name}',
          child: Text(
            widget.name,
            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('Avaliação', '${widget.rating} ★'),
              const SizedBox(height: 8),
              _buildInfoRow('Localização', widget.location),
              const SizedBox(height: 8),
              _buildInfoRow('Distância', widget.distance),
              const SizedBox(height: 8),
              _buildInfoRow('Avaliações', '${widget.reviews} avaliações'),
              const SizedBox(height: 8),
              _buildInfoRow('Preço', widget.price),
            ],
          ),
        ),
        actions: [
          Semantics(
            button: true,
            label: 'Cancelar',
            enabled: true,
            onTap: () => Navigator.pop(context),
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ),
          Semantics(
            button: true,
            label: 'Adicionar aos favoritos',
            enabled: true,
            onTap: () {
              Navigator.pop(context);
              setState(() => isFavorited = !isFavorited);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${widget.name} adicionado aos favoritos'),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() => isFavorited = !isFavorited);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${widget.name} adicionado aos favoritos'),
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Favorito'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600),
        ),
        Flexible(
          child: Text(
            value,
            style: GoogleFonts.plusJakartaSans(),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
