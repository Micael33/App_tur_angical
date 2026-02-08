# 🚀 QUICK START - Angical Turismo App

## ⚡ Início Rápido (5 minutos)

### 1️⃣ Setup Inicial
```bash
cd c:\Users\micae\Desktop\App_Tur_Ang
flutter pub get
flutter analyze
```

### 2️⃣ Executar App
```bash
# Abrir em Chrome Web
flutter run -d chrome

# Ou em emulador Android
flutter run -d emulator-5554

# Ou em iPhone Simulator
flutter run -d ios
```

### 3️⃣ Acessar a App
- **Tela Initial:** Login
- **Email:** qualquer email válido (ex: `test@example.com`)
- **Senha:** qualquer senha com 6+ caracteres
- **Botão:** ENTRAR

## 📲 Fluxo de Navegação

```
LOGIN (/login)
    ↓
APROVADO? → SIM → MAIN SHELL (/main)
    ↓ NÃO           ↓
ERRO          ┌─────┼─────┐
              ↓     ↓     ↓
            HOME EVENTOS EXPLORAR → PERFIL
          [HomePage] [EventsPage] [TouristSpots] [Profile]
```

## 🎨 Temas Disponíveis

- **Light Theme:** Tons claros, Background #F6F7F8
- **Dark Theme:** Tons escuros, Background #101922
- **Muda automaticamente** conforme sistema do dispositivo

## 💻 Testes Rápidos

### Validação Funcional
```bash
# Verificar errors/warnings
flutter analyze

# Build web
flutter build web

# Executar tests
flutter test
```

### Login - Casos de Teste
| Email | Senha | Esperado |
|-------|-------|----------|
| `test@example.com` | `123456` | ✅ Login sucesso |
| `invalid.email` | `123456` | ❌ Email inválido |
| `test@example.com` | `123` | ❌ Senha curta |
| `` | `123456` | ❌ Email vazio |
| `test@example.com` | `` | ❌ Senha vazia |

## 📁 Arquivos Importantes

| Arquivo | Propósito |
|---------|-----------|
| `lib/main.dart` | Entrada da app |
| `lib/config/routes.dart` | Sistema de rotas |
| `lib/core/theme/app_theme.dart` | Tema Material 3 |
| `lib/features/auth/pages/login_page.dart` | Página de login |
| `lib/features/main/main_shell.dart` | Dashboard com navegação |
| `lib/features/home/home_page.dart` | Página inicial |

## 🔑 Credenciais Mock (Dev)

Para testes rápidos:
- **Email:** `dev@angical.com`
- **Senha:** `flutter123`

(Qualquer combinação válida funciona no mock)

## ⚙️ Configurações Principais

### Material 3 Theme
```dart
AppTheme.lightTheme   // Tema claro
AppTheme.darkTheme    // Tema escuro
AppTheme.highContrastTheme  // Alto contraste
```

### Provider (State Management)
```dart
Provider.of<ThemeProvider>(context)  // Acessar tema
themeProvider.toggleTheme()  // Mudar tema
```

### Localização
```dart
supportedLocales: [Locale('pt', 'BR')]  // Português Brasil
```

## 🐛 Debug Tips

### Ver Console
```bash
# Com verbose logging
flutter run -v

# Attach debugger
flutter attach
```

### Hot Reload
```bash
# Compilar mudanças em tempo real
r  # Hot reload
R  # Hot restart
q  # Quit
```

### Ver Performance
```bash
# Performance overlay
flutter run --devtools

# Memory profiling
dart devtools
```

## 📊 Status do Projeto

```
✅ Flutter Analyze:        0 issues
✅ Build Web:              SUCCESS
✅ Login Page:             FUNCIONAL
✅ Navigation:             FUNCIONAL
✅ Material 3 Theme:       IMPLEMENTADO
✅ Dark/Light Mode:        FUNCIONAL
✅ Accessibility:          WCAG OK
```

## 🎯 Próximas Features

- [ ] Integrar com backend real
- [ ] Autenticação com Google
- [ ] Integrar Google Maps
- [ ] Notificações push
- [ ] Persistência local

## 📞 Troubleshooting Rápido

**"Flutter SDK not found"**
```bash
flutter doctor
flutter pub get
```

**"Port 8080 already in use"**
```bash
flutter run -d chrome --web-port=8081
```

**"Hot Reload não funciona"**
```bash
R  # Hot restart completo
flutter run --no-fast-start
```

**"Build web muito lento"**
```bash
flutter build web --release
flutter build web --no-tree-shake-icons
```

---

## 🎓 Estrutura de Pastas Explicada

```
lib/
├── main.dart                  # Entry point
├── config/
│   └── routes.dart           # Todas as rotas centralizadas
├── core/
│   ├── services/
│   │   └── auth_service.dart # Lógica de autenticação
│   ├── theme/
│   │   └── app_theme.dart    # Material 3 completo
│   └── widgets/
│       └── vlibras_widget.dart # Acessibilidade
└── features/
    ├── auth/pages/
    │   └── login_page.dart    # 🔐 Login
    ├── home/
    │   └── home_page.dart     # 🏠 Dashboard
    ├── main/
    │   └── main_shell.dart    # 🔀 Navegação principal
    ├── events/pages/
    │   └── events_page.dart   # 🎉 Eventos
    ├── tourist_spots/pages/
    │   └── tourist_spots_page.dart  # 🗺️ Pontos turísticos
    ├── services/pages/
    │   └── services_page.dart  # 🛎️ Serviços
    └── profile/pages/
        └── profile_page.dart   # 👤 Perfil
```

---

## ✅ Checklist Antes de Deploy

- [ ] `flutter analyze` - sem issues
- [ ] `flutter test` - testes passando
- [ ] `flutter build apk` - build Android ok
- [ ] `flutter build ios` - build iOS ok
- [ ] `flutter build web` - build Web ok
- [ ] Versão do app atualizada
- [ ] Dependências atualizadas
- [ ] Screenshots preparados
- [ ] App signing configurado
- [ ] Privacy policy pronta

---

**Desenvolvido com ❤️ em Flutter**
**Status: PRONTO PARA USO**
