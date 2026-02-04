import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/accessibility/semantics_helper.dart';
import '../../core/l10n/strings.dart';
import '../../main.dart'; // For ThemeProvider
import '../tourist_spots/tourist_spots_screen.dart';
import '../events/events_screen.dart';
import '../services/services_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
        actions: [
          Semantics(
            label: Strings.highContrast,
            button: true,
            child: IconButton(
              icon: Icon(
                themeProvider.isHighContrast ? Icons.contrast : Icons.brightness_medium,
              ),
              tooltip: Strings.highContrast,
              onPressed: () {
                themeProvider.toggleTheme();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              header: true,
              child: Text(
                Strings.homeWelcome,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            _buildCategoryCard(
              context,
              title: Strings.categoryTouristSpots,
              icon: Icons.landscape,
              color: Colors.teal,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TouristSpotsScreen()));
              },
            ),
            const SizedBox(height: 16),
            _buildCategoryCard(
              context,
              title: Strings.categoryEvents,
              icon: Icons.event,
              color: Colors.orange,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const EventsScreen()));
              },
            ),
            const SizedBox(height: 16),
            _buildCategoryCard(
              context,
              title: Strings.categoryServices,
              icon: Icons.info,
              color: Colors.blueAccent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ServicesScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    // Determine card color based on theme (high contrast vs standard)
    // For high contrast, we might want simple black/white borders.
    final isHighContrast = Provider.of<ThemeProvider>(context).isHighContrast;
    final cardColor = isHighContrast ? Colors.black : Colors.white;
    final borderColor = isHighContrast ? Colors.white : Colors.transparent;
    final iconColor = isHighContrast ? Colors.yellow : color;

    return SemanticsHelper.wrapWithSemantics(
      label: "Categoria: $title, toque duas vezes para abrir.",
      isButton: true,
      onTap: onTap,
      child: Card(
        color: cardColor,
        elevation: isHighContrast ? 0 : 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: borderColor, width: 2),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Icon(icon, size: 48, color: iconColor),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: isHighContrast ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: isHighContrast ? Colors.white : Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
