import 'package:flutter/material.dart';
import '../../core/l10n/strings.dart';
import 'tourist_spot_model.dart';
import 'tourist_spot_detail_screen.dart';
import '../../core/accessibility/semantics_helper.dart';

class TouristSpotsScreen extends StatelessWidget {
  const TouristSpotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.categoryTouristSpots),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: mockTouristSpots.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final spot = mockTouristSpots[index];
          return _buildSpotItem(context, spot);
        },
      ),
    );
  }

  Widget _buildSpotItem(BuildContext context, TouristSpot spot) {
    return SemanticsHelper.wrapWithSemantics(
      label: "Ponto Turístico: ${spot.name}, localizado em ${spot.location}. Toque para ver detalhes.",
      isButton: true,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => TouristSpotDetailScreen(spot: spot)));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => TouristSpotDetailScreen(spot: spot)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 150,
                child: Container(color: Colors.grey.shade300, child: const Icon(Icons.image, size: 50)), // Placeholder
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      spot.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      spot.location,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
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
}
