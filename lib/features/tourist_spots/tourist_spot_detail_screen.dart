import 'package:flutter/material.dart';

import 'tourist_spot_model.dart';
import 'package:provider/provider.dart';
import '../../main.dart'; // For ThemeProvider

class TouristSpotDetailScreen extends StatelessWidget {
  final TouristSpot spot;

  const TouristSpotDetailScreen({super.key, required this.spot});

  @override
  Widget build(BuildContext context) {
    // In a real app we'd load image from asset or network with cache
    final isHighContrast = Provider.of<ThemeProvider>(context).isHighContrast;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(spot.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              image: true,
              label: spot.imageAlt,
              child: Container(
                height: 250,
                color: Colors.grey.shade300,
                child: Icon(Icons.image, size: 100, color: Colors.grey.shade600), // Placeholder
                // child: Image.network(spot.imageUrl, fit: BoxFit.cover), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    header: true,
                    child: Text(
                      spot.name,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: isHighContrast ? Colors.yellow : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: isHighContrast ? Colors.white : Colors.red),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          spot.location,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                             color: isHighContrast ? Colors.white : Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Semantics(
                    label: "Descrição do local: ${spot.description}",
                    child: Text(
                      spot.description,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isHighContrast ? Colors.white : Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
