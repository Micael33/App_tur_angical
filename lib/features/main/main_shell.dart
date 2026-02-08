import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../events/pages/events_page.dart';
import '../tourist_spots/pages/tourist_spots_page.dart';
import '../profile/pages/profile_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  static const List<Widget> pages = [
    HomePage(),
    TouristSpotsPage(),
    EventsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openMapFeature() {
    // Implementação do mapa
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Funcionalidade de mapa será aberta em breve'),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Fechar',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
    // TODO: Integrar maps quando disponível
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? SizedBox(
              width: 64,
              height: 64,
              child: Semantics(
                button: true,
                enabled: true,
                label: 'Abrir mapa com pontos de interesse',
                onTap: _openMapFeature,
                child: FloatingActionButton(
                  onPressed: _openMapFeature,
                  backgroundColor: const Color(0xFF137FEC),
                  elevation: 4,
                  shape: const CircleBorder(),
                  tooltip: 'Abrir mapa com pontos turisticos',
                  child: const Icon(Icons.map, size: 32, color: Colors.white),
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 80,
        padding: EdgeInsets.zero,
        color: (isDark ? const Color(0xFF0F172A) : Colors.white)
            .withValues(alpha: 0.95),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Semantics(
          container: true,
          label: 'Navegação principal',
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavButton(
                  context,
                  Icons.home,
                  'Início',
                  0,
                ),
                _buildNavButton(
                  context,
                  Icons.location_on,
                  'Explorar',
                  1,
                ),
                const SizedBox(width: 48), // Space for FAB
                _buildNavButton(
                  context,
                  Icons.event,
                  'Eventos',
                  2,
                ),
                _buildNavButton(
                  context,
                  Icons.person,
                  'Perfil',
                  3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context,
    IconData icon,
    String label,
    int index,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isActive = _selectedIndex == index;
    final color = isActive
        ? const Color(0xFF137FEC)
        : (isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8));

    // WCAG: 48x48 minimum touch target
    return SizedBox(
      width: 56,
      height: 56,
      child: InkWell(
        onTap: () => _onItemTapped(index),
        onLongPress: () {
          // Provide additional feedback via tooltip
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ir para $label'),
              duration: const Duration(milliseconds: 500),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        child: Semantics(
          button: true,
          label: label,
          enabled: true,
          selected: isActive,
          onTap: () => _onItemTapped(index),
          child: Tooltip(
            message: label, // Tooltip for hover feedback (web/desktop)
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // WCAG: Visual indicator of focus with ripple effect (InkWell provides this)
                Icon(
                  icon,
                  color: color,
                  size: 24,
                  semanticLabel: label,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: color,
                        fontWeight:
                            isActive ? FontWeight.bold : FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
