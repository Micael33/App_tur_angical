import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- MAIN PAGE STRUCTURE ---

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Background color from HTML: bg-background-light (#f6f7f8) / dark:bg-background-dark (#101922)
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const HomeTopAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24), // standard bottom padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    HomeSearchBar(),
                    CategorySection(),
                    RecommendedSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Funcionalidade de mapa será aberta em breve'),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          backgroundColor: const Color(0xFF137FEC), // bg-primary
          elevation: 4,
          shape: const CircleBorder(),
          child: const Icon(Icons.map, size: 32, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const HomeBottomNavigation(),
    );
  }
}

// --- WIDGETS ---

/// **TopAppBar**
/// HTML: flex items-center justify-between sticky top-0 p-4 pb-2 z-50
class HomeTopAppBar extends StatelessWidget {
  const HomeTopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8);

    return Container(
      color: backgroundColor, // Background matches body
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar
          Semantics(
            label: "User profile picture showing a smiling person", // data-alt
            image: true,
            child: Container(
              width: 48, // size-12 (approx 48px)
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF137FEC).withValues(alpha: 0.2), // primary/20
                  width: 2,
                ),
                image: const DecorationImage(
                  image: NetworkImage("https://lh3.googleusercontent.com/aida-public/AB6AXuBFgdW1oVAPEMYJOdSoC6ne1HCp35hpa057P7ZIoU5xbWRXDJ8R-5R6FHnB5HORg5cQWWE9wLlalUEBmHW0OusMPvoaFBBgod8-pIzsauc8fOrykgBNA0tUTX5r6HxIO_agjBMEC8-9dUmmmzfdv3MrpOKF92PQPJI4W42PGti56Ra2XYXVTcVyIgxat8no8GZFyTSo1IC30d2k34qrk-bCEaOgJ1JstGqj-fAPV6Pfi3l02rI7T16lB4VOpCTv-SiLCoRwr4ouzm0"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12), // px-3 (approx spacing)
          // Texts
          Expanded(
            child: Semantics(
              label: "Bem-vindo, Micael", // Combined semantic label for clarity
              excludeSemantics: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "BEM-VINDO", // Upper case in HTML class "uppercase"
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12, // text-xs
                      fontWeight: FontWeight.w500, // font-medium
                      color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B), // slate-500/400
                      letterSpacing: 0.5, // tracking-wider
                    ),
                  ),
                  Text(
                    "Olá, Micael!",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18, // text-lg
                      fontWeight: FontWeight.bold, // font-bold
                      color: isDark ? Colors.white : const Color(0xFF0F172A), // slate-900/white
                      height: 1.25, // leading-tight
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Notification Button
          Semantics(
            button: true,
            label: "Notificações",
            tooltip: "Notificações",
            child: Container(
              width: 40, // size-10
              height: 40,
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : Colors.white, // bg-white / slate-800
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0), // slate-200 / slate-700
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Icon(
                Icons.notifications_outlined, // material-symbols: notifications
                size: 24,
                color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF334155), // slate-700 / slate-200
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// **SearchBar**
/// HTML: px-4 py-3, flex gap-2
class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Input Field
          Expanded(
            child: Container(
              height: 48, // h-12
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : Colors.white, // bg-white / slate-800
                borderRadius: BorderRadius.circular(12), // rounded-xl
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ), // shadow-sm
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Icon(
                      Icons.search, // material-symbols: search
                      color: const Color(0xFF94A3B8), // slate-400
                      size: 24,
                    ),
                  ),
                  Expanded(
                    child: Semantics(
                      label: "Campo de busca",
                      hint: "Busque por cachoeiras, trilhas...",
                      textField: true,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Cachoeiras, trilhas...",
                          hintStyle: GoogleFonts.plusJakartaSans(
                            color: const Color(0xFF94A3B8), // placeholder:text-slate-400
                            fontSize: 16, // text-base
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14), // Vertically center text
                        ),
                        style: GoogleFonts.plusJakartaSans(
                           color: isDark ? Colors.white : const Color(0xFF0F172A), // text-slate-900 / white
                           fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8), // gap-2
          // Filter Button
          Semantics(
            button: true,
            label: "Filtros",
            enabled: true,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Filtros em desenvolvimento'),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Filtros em desenvolvimento'),
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                width: 48, // size-12
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF137FEC), // bg-primary
                  borderRadius: BorderRadius.circular(12), // rounded-xl
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ), // shadow-md
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.tune, // material-symbols: tune
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// **CategorySection**
/// Headers and Grid
class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Header
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8), // pt-6 pb-2
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Semantics(
                header: true,
                child: Text(
                  "Categorias",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20, // text-xl
                    fontWeight: FontWeight.bold, // font-bold
                    color: isDark ? Colors.white : const Color(0xFF0F172A), // text-slate-900
                    height: 1.25,
                  ),
                ),
              ),
              Semantics(
                button: true,
                label: "Ver todas as categorias",
                enabled: true,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Mais categorias em desenvolvimento'),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Mais categorias em desenvolvimento'),
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                    "Ver todas",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14, // text-sm
                      fontWeight: FontWeight.w600, // font-semibold
                      color: const Color(0xFF137FEC), // text-primary
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Grid
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _CategoryCard(icon: Icons.forest, label: "Natureza", color: Colors.green, bgColorLight: const Color(0xFFDCFCE7), bgColorDark: const Color(0x4D14532D))), // green-100 / green-900/30
                  const SizedBox(width: 12),
                  Expanded(child: _CategoryCard(icon: Icons.event, label: "Eventos", color: Colors.orange, bgColorLight: const Color(0xFFFFEDD5), bgColorDark: const Color(0x4D7C2D12))), // orange-100
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _CategoryCard(icon: Icons.castle, label: "História", color: Colors.amber, bgColorLight: const Color(0xFFFEF3C7), bgColorDark: const Color(0x4D78350F))), // amber-100
                  const SizedBox(width: 12),
                  Expanded(child: _CategoryCard(icon: Icons.restaurant, label: "Restaurantes e Hoteis", color: Colors.red, bgColorLight: const Color(0xFFFEE2E2), bgColorDark: const Color(0x4D7F1D1D))), // red-100
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color bgColorLight;
  final Color bgColorDark;

  const _CategoryCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.bgColorLight,
    required this.bgColorDark,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      button: true,
      label: "Categoria $label",
      enabled: true,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Explorar categoria $label'),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Explorar categoria $label'),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E293B) : Colors.white, // bg-white / slate-800
            borderRadius: BorderRadius.circular(12), // rounded-xl
            border: Border.all(
               color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0), // border-slate-200
            ),
            boxShadow: [
               BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 2, offset: const Offset(0, 1)), // shadow-sm
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 40, // size-10
                height: 40,
                decoration: BoxDecoration(
                  color: isDark ? bgColorDark : bgColorLight,
                  borderRadius: BorderRadius.circular(8), // rounded-lg
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12), // gap-3
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16, // text-base
                  fontWeight: FontWeight.bold, // font-bold
                  color: isDark ? Colors.white : const Color(0xFF0F172A), // text-slate-900
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// **RecommendedSection**
class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
         Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Semantics(
                header: true,
                child: Text(
                  "Recomendados",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF0F172A),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            children: const [
               _RecommendationCard(
                imageUrl: "https://i.ytimg.com/vi/-7sIHBVVOkg/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AH-CYAC0AWKAgwIABABGGUgVihCMA8=&rs=AOn4CLBNxEIueHXZ8ssplntWMm7MiOxMZw",
                imageAlt: "Beautiful waterfall surrounded by lush green trees",
                name: "Riachão",
                price: "R\$ 150,00",
                rating: "4.9",
                location: "20km do centro • Angical, PI",
                isFree: false,
              ),
              SizedBox(height: 16),
              _RecommendationCard(
                imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtzET1N5Uoi72oAYESRhjHE00twQy1a1jKqg&s",
                imageAlt: "Historic church with colonial architecture in a small town",
                name: "Hotel Lago Verde",
                price: "R\$ 250,00",
              
                rating: "4.7",
                location: "Centro • Angical, PI",
                isFree: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  final String imageUrl;
  final String imageAlt;
  final String name;
  final String price;
  final String rating;
  final String location;
  final bool isFree;

  const _RecommendationCard({
    required this.imageUrl,
    required this.imageAlt,
    required this.name,
    required this.price,
    required this.rating,
    required this.location,
    required this.isFree,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      label: "$name. Avaliação $rating. Preço: ${isFree ? 'Grátis' : price}. Localização: $location",
      button: true, // It acts like a card you can tap
      enabled: true,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Detalhes de $name'),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Detalhes de $name'),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          // group relative flex flex-col rounded-2xl bg-white shadow-lg overflow-hidden border
          decoration: BoxDecoration(
             color: isDark ? const Color(0xFF1E293B) : Colors.white,
             borderRadius: BorderRadius.circular(16), // rounded-2xl
             border: Border.all(color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
             boxShadow: [
               BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 4)), // shadow-lg
             ],
          ),
          clipBehavior: Clip.antiAlias, // overflow-hidden
          child: Column(
            children: [
              // Image Section
              Stack(
                children: [
                  Semantics(
                     label: imageAlt,
                     image: true,
                     child: Container(
                       height: 224, // h-56 (56 * 4 = 224px)
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image: NetworkImage(imageUrl),
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                  ),
                // Rating Badge
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: (isDark ? const Color(0xFF0F172A) : Colors.white).withValues(alpha: 0.9), // bg-white/90
                      borderRadius: BorderRadius.circular(999), // rounded-full
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFFBBF24), size: 16), // text-amber-400
                        const SizedBox(width: 4),
                         Text(
                          rating,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12, // text-xs
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Info Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: GoogleFonts.plusJakartaSans(
                             fontSize: 18, // text-lg
                             fontWeight: FontWeight.bold,
                             color: isDark ? Colors.white : const Color(0xFF0F172A),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8), 
                      Text(
                        price,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                           color: isFree 
                           ? const Color(0xFF16A34A) // text-green-600
                           : const Color(0xFF137FEC), // text-primary
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)), // text-slate-500
                      const SizedBox(width: 4),
                      Text(
                        location,
                         style: GoogleFonts.plusJakartaSans(
                            fontSize: 14, // text-sm
                            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                         ),
                      ),
                    ],
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

/// **BottomNavigation**
/// Floating Fixed Bottom Bar
class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

     // Custom Bottom AppBar implementation using BottomAppBar widget to work nicely with FAB
    return BottomAppBar(
      height: 72, // h-20 approx
      padding: EdgeInsets.zero,
      color: (isDark ? const Color(0xFF0F172A) : Colors.white).withValues(alpha: 0.95), // bg-white/95
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _NavButton(icon: Icons.home, label: "Início", isActive: true),
            _NavButton(icon: Icons.explore, label: "Explorar", isActive: false),
             const SizedBox(width: 48), // Space for FAB
            _NavButton(icon: Icons.confirmation_number, label: "Reservas", isActive: false),
            _NavButton(icon: Icons.person, label: "Perfil", isActive: false),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _NavButton({required this.icon, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isActive 
        ? const Color(0xFF137FEC) // text-primary
        : (isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8)); // text-slate-400

    return InkWell(
      onTap: () {
        if (label == "Perfil") {
          Navigator.pushNamed(context, '/profile');
        } else if (label == "Explorar") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Explorar em desenvolvimento'),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
            ),
          );
        } else if (label == "Reservas") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Minhas reservas em desenvolvimento'),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      child: Semantics(
        button: true,
        label: "Ir para $label",
        selected: isActive,
        enabled: true,
        onTap: () {
          if (label == "Perfil") {
            Navigator.pushNamed(context, '/profile');
          } else if (label == "Explorar") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Explorar em desenvolvimento'),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
              ),
            );
          } else if (label == "Reservas") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Minhas reservas em desenvolvimento'),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
