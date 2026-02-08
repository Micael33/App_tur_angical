import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          'Perfil',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Avatar
            Center(
              child: Semantics(
                image: true,
                label: 'Avatar do usuário',
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: surfaceColor,
                    border: Border.all(
                      color: const Color(0xFF137FEC).withValues(alpha: 0.2),
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Color(0xFF137FEC),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Nome
            Center(
              child: Semantics(
                container: true,
                label: 'Nome do usuário: Usuário',
                child: Text(
                  'Usuário',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Semantics(
                container: true,
                label: 'Email: usuario@exemplo.com',
                child: Text(
                  'usuario@exemplo.com',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Menu items
            Semantics(
              button: true,
              label: 'Editar seu perfil pessoal',
              child: _ProfileMenuItem(
                icon: Icons.edit,
                label: 'Editar Perfil',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Funcionalidade de editar perfil em desenvolvimento'),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),
            Semantics(
              button: true,
              label: 'Configurações de segurança da conta',
              child: _ProfileMenuItem(
                icon: Icons.security,
                label: 'Configurações de Segurança',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Acesso à segurança em desenvolvimento'),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),
            Semantics(
              button: true,
              label: 'Alterar idioma da aplicação',
              child: _ProfileMenuItem(
                icon: Icons.language,
                label: 'Idioma',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Seletor de idioma em desenvolvimento'),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),
            Semantics(
              button: true,
              label: 'Centro de ajuda e suporte técnico',
              child: _ProfileMenuItem(
                icon: Icons.help,
                label: 'Ajuda e Suporte',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Centro de ajuda em desenvolvimento'),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            // Botão Logout
            SizedBox(
              width: double.infinity,
              child: Semantics(
                button: true,
                label: 'Sair da aplicação',
                enabled: true,
                onTap: () {
                  _showLogoutDialog(context);
                },
                child: ElevatedButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sair',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Semantics(
          container: true,
          label: 'Confirmar saída',
          child: Text(
            'Sair',
            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
          ),
        ),
        content: Semantics(
          container: true,
          label: 'Confirmação de saída da conta',
          child: Text(
            'Você tem certeza que deseja sair?',
            style: GoogleFonts.plusJakartaSans(),
          ),
        ),
        actions: [
          Semantics(
            button: true,
            label: 'Cancelar saída',
            enabled: true,
            onTap: () => Navigator.pop(context),
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ),
          Semantics(
            button: true,
            label: 'Confirmar saída',
            enabled: true,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
              child: const Text('Sair', style: TextStyle(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor = isDark ? const Color(0xFF1E293B) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF137FEC), size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: isDark ? Colors.white38 : Colors.black26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
