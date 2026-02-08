import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_angical_turismo/core/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _emailFocus;
  late FocusNode _passwordFocus;
  late FocusNode _loginButtonFocus;
  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
    _loginButtonFocus = FocusNode();
    
    // Adiciona listeners para validação em tempo real (a11y)
    _emailController.addListener(() {
      if (_errorMessage != null && _emailController.text.isNotEmpty) {
        setState(() => _errorMessage = null);
      }
    });
    _passwordController.addListener(() {
      if (_errorMessage != null && _passwordController.text.isNotEmpty) {
        setState(() => _errorMessage = null);
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _loginButtonFocus.dispose();
    super.dispose();
  }

  void _validateAndLogin() async {
    // Validar campos
    if (_emailController.text.isEmpty) {
      setState(() => _errorMessage = 'Por favor, insira seu e-mail');
      return;
    }

    if (!_emailController.text.contains('@')) {
      setState(() => _errorMessage = 'Por favor, insira um e-mail válido');
      return;
    }

    if (_passwordController.text.isEmpty) {
      setState(() => _errorMessage = 'Por favor, insira sua senha');
      return;
    }

    if (_passwordController.text.length < 6) {
      setState(() => _errorMessage = 'A senha deve ter pelo menos 6 caracteres');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Chamar serviço de autenticação
      bool success = await loginUser(
        _emailController.text,
        _passwordController.text,
      );

      if (mounted) {
        if (success) {
          // Navegar para main shell
          Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
        } else {
          setState(() {
            _errorMessage = 'Credenciais inválidas. Tente novamente.';
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Erro ao fazer login. Tente novamente.';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF101922) : const Color(0xFFF6F7F8);
    final surfaceColor = isDark ? const Color(0xFF1E293B) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final hintColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
    
    // WCAG: Suporte a amplificação de texto
    final textScaler = MediaQuery.of(context).textScaler;
    final isLargeText = textScaler.scale(1) > 1.2;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: FocusTraversalGroup(
          policy: OrderedTraversalPolicy(), // Navegação por teclado ordenada
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: isLargeText ? 20 : 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: isLargeText ? 16 : 32), // Logo/Título
                Semantics(
                  header: true,
                  label: 'Bem-vindo ao Angical Turismo',
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF137FEC),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.map,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Angical Turismo',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: textScaler.scale(28),
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Explore as belezas naturais de Angical',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: textScaler.scale(16),
                          color: hintColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isLargeText ? 24 : 48),
                // Email Campo
                Semantics(
                  label: 'Campo de email',
                  enabled: !_isLoading,
                  textField: true,
                  hint: 'Insira seu endereço de email',
                  child: Container(
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDark
                            ? const Color(0xFF334155)
                            : const Color(0xFFE2E8F0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      focusNode: _emailFocus,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      enabled: !_isLoading,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) => _passwordFocus.requestFocus(),
                      decoration: InputDecoration(
                        labelText: 'Email', // WCAG: Label visível
                        hintText: 'seu.email@exemplo.com',
                        hintStyle: GoogleFonts.plusJakartaSans(
                          color: hintColor,
                          fontSize: textScaler.scale(16),
                        ),
                        border: InputBorder.none,
                        prefixIcon: Semantics(
                          enabled: false,
                          child: Icon(
                            Icons.email_outlined,
                            color: const Color(0xFF137FEC),
                          ),
                        ),
                        errorText: null, // Erro mostrado separadamente
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                      ),
                      style: GoogleFonts.plusJakartaSans(
                        color: textColor,
                        fontSize: textScaler.scale(16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Senha Campo
                Semantics(
                  label: 'Campo de senha',
                  enabled: !_isLoading,
                  textField: true,
                  hint: 'Insira sua senha (mínimo 6 caracteres)',
                  child: Container(
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDark
                            ? const Color(0xFF334155)
                            : const Color(0xFFE2E8F0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      focusNode: _passwordFocus,
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      enabled: !_isLoading,
                      textInputAction: TextInputAction.go,
                      onSubmitted: (_) => _validateAndLogin(),
                      decoration: InputDecoration(
                        labelText: 'Senha', // WCAG: Label visível
                        hintText: '••••••••',
                        hintStyle: GoogleFonts.plusJakartaSans(
                          color: hintColor,
                          fontSize: textScaler.scale(16),
                        ),
                        border: InputBorder.none,
                        prefixIcon: Semantics(
                          enabled: false,
                          child: Icon(
                            Icons.lock_outline,
                            color: const Color(0xFF137FEC),
                          ),
                        ),
                        suffixIcon: Semantics(
                          button: true,
                          enabled: !_isLoading,
                          label: _obscurePassword
                              ? 'Mostrar senha'
                              : 'Ocultar senha',
                          onTap: () {
                            setState(() =>
                                _obscurePassword = !_obscurePassword);
                          },
                          child: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: hintColor,
                            ),
                            onPressed: !_isLoading
                                ? () {
                                    setState(
                                      () => _obscurePassword =
                                          !_obscurePassword,
                                    );
                                  }
                                : null,
                            tooltip: _obscurePassword
                                ? 'Mostrar senha'
                                : 'Ocultar senha',
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                      ),
                      style: GoogleFonts.plusJakartaSans(
                        color: textColor,
                        fontSize: textScaler.scale(16),
                      ),
                    ),
                  ),
                ),
                // Requisitos da senha (WCAG: Informação clara)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Semantics(
                    enabled: false,
                    child: Text(
                      '• Mínimo 6 caracteres',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: textScaler.scale(12),
                        color: hintColor,
                      ),
                    ),
                  ),
                ),
                // Mensagem de erro com acessibilidade aprimorada
                if (_errorMessage != null) ...[
                  const SizedBox(height: 16),
                  Semantics(
                    enabled: true,
                    label: 'Erro na autenticação',
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEE2E2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFFECDD3),
                          width: 2, // WCAG: Visible border
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Color(0xFFDC2626),
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _errorMessage!,
                              style: GoogleFonts.plusJakartaSans(
                                color: const Color(0xFFDC2626),
                                fontSize: textScaler.scale(14),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 32),
                // Botão de login
                Semantics(
                  button: true,
                  enabled: !_isLoading,
                  label: 'Fazer login',
                  onTap: _isLoading ? null : _validateAndLogin,
                  child: Focus(
                    focusNode: _loginButtonFocus,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _validateAndLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF137FEC),
                        disabledBackgroundColor: const Color(0xFF137FEC)
                            .withValues(alpha: 0.5),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        minimumSize: const Size(double.infinity, 48), // WCAG: 48px min
                      ),
                      child: _isLoading
                          ? SizedBox(
                              height: 20,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white.withValues(alpha: 0.9),
                                ),
                                strokeWidth: 2,
                              ),
                            )
                          : Semantics(
                              enabled: false,
                              child: Text(
                                'Entrar',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: textScaler.scale(16),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Link de cadastro
                Center(
                  child: Semantics(
                    label: 'Opção para criar nova conta',
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Não possui uma conta? ',
                            style: GoogleFonts.plusJakartaSans(
                              color: hintColor,
                              fontSize: textScaler.scale(14),
                            ),
                          ),
                          TextSpan(
                            text: 'Cadastre-se',
                            style: GoogleFonts.plusJakartaSans(
                              color: const Color(0xFF137FEC),
                              fontSize: textScaler.scale(14),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline, // WCAG: Link visível
                            ),
                            recognizer: null, // Preparado para implementação futura
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
