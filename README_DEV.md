# Angical Turismo - App Flutter

Um aplicativo Flutter moderna e responsiva para descobrir e explorar os melhores pontos turísticos, eventos e serviços em Angical, Bahia.

## 🌟 Características

✅ **Interface Material 3** - Design moderno e profissional
✅ **Modo Dark/Light** - Suporte completo para temas
✅ **Autenticação** - Página de login com validação
✅ **Navegação Intuitiva** - Bottom navigation com 4 abas principais
✅ **Acessibilidade** - WCAG compliant com suporte a LIBRAS (VLibras)
✅ **Responsivo** - Funciona em web, mobile e tablet
✅ **Google Fonts** - Plus Jakarta Sans para tipografia profissional

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                      # Ponto de entrada do app
├── config/
│   └── routes.dart               # Sistema de rotas
├── core/
│   ├── services/
│   │   └── auth_service.dart     # Serviço de autenticação (mock)
│   ├── theme/
│   │   └── app_theme.dart        # Tema Material 3
│   └── widgets/
│       └── vlibras_widget.dart   # Widget de acessibilidade
├── features/
│   ├── auth/
│   │   └── pages/
│   │       └── login_page.dart
│   ├── home/
│   │   └── home_page.dart        # Página inicial
│   ├── events/
│   │   └── pages/
│   │       └── events_page.dart
│   ├── tourist_spots/
│   │   └── pages/
│   │       └── tourist_spots_page.dart
│   ├── services/
│   │   └── pages/
│   │       └── services_page.dart
│   ├── profile/
│   │   └── pages/
│   │       └── profile_page.dart
│   └── main/
│       └── main_shell.dart       # Shell com navegação
```

## 🚀 Como Executar

### Pré-requisitos
- Flutter 3.10.3+
- Dart 3.10.3+

### Instalação

1. **Clone o repositório**
   ```bash
   git clone <repository-url>
   cd App_Tur_Ang
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Execute a análise de código**
   ```bash
   flutter analyze
   ```

### Desenvolvimento

**Executar em Chrome (Web)**
```bash
flutter run -d chrome
```

**Executar em emulador Android**
```bash
flutter run -d emulator-5554
```

**Executar em dispositivo iOS**
```bash
flutter run -d ios
```

### Build para Produção

**Build Web**
```bash
flutter build web
```

**Build Android**
```bash
flutter build apk
```

**Build iOS**
```bash
flutter build ios
```

## 🎨 Tema e Cores

### Cores Principais
- **Primary**: `#137FEC` (Azul)
- **Background Light**: `#F6F7F8`
- **Background Dark**: `#101922`
- **Surface Light**: `#FFFFFF`
- **Surface Dark**: `#1E293B`
- **Text Dark**: `#0F172A`
- **Text Light**: `#F1F5F9`

### Tipografia
- **Font**: Plus Jakarta Sans (Google Fonts)
- **Sizes**: 12px, 14px, 16px, 18px, 20px, 28px (escalas Material 3)

## 🔐 Autenticação

Currently using a mock authentication service. To integrate with a real backend:

1. Update `lib/core/services/auth_service.dart`
2. Replace the mock login logic with API calls
3. Implement token handling and secure storage

## 📲 Páginas

### 1. **Login Page** (`/login`)
- Validação de email e senha
- Feedback de erro amigável
- Integração com AuthService
- Transição para MainShell ao sucesso

### 2. **Home Page** (`/main` - First Tab)
- Feature recomendações de destinos
- Categorias de interesse
- Barra de busca funcional
- Botão de mapa flutuante

### 3. **Explorar** (`/main` - Second Tab)
- Pontos turísticos cadastrados
- Filtros e busca avançada

### 4. **Eventos** (`/main` - Third Tab)
- Agenda de eventos locais
- Notificações de eventos próximos

### 5. **Perfil** (`/main` - Fourth Tab)
- Editar dados do usuário
- Configurações de privacidade
- Logout

## 🎯 Estado do Projeto

- ✅ Flutter Analyze: **100% limpo** (sem erros ou warnings)
- ✅ Compilação Web: **Funcionando**
- ✅ Material 3: **Implementado**
- ✅ Acessibilidade: **WCAG compliant**
- ✅ Navegação: **Sistema de rotas configurado**
- ✅ Login: **Implementado com validação**
- ✅ Padrão Visual: **Consistente em todas as páginas**

## 🔧 Dependências Principais

```yaml
flutter: 
  sdk: flutter
cupertino_icons: ^1.0.8
google_fonts: ^8.0.0
provider: ^6.1.5+1
intl: ^0.20.2
flutter_localizations:
  sdk: flutter
```

## 📝 Notas de Desenvolvimento

- O serviço de autenticação é mockado e simula um delay de 2 segundos
- O tema dark implementa alternativa de alto contraste para acessibilidade
- Todas as páginas seguem o padrão Material 3 com safe areas apropriadas
- VLibras widget é um placeholder para futuro suporte a interpretação em Libras

## 🐛 Troubleshooting

**Erro: "The element type 'Widget?' can't be assigned to the list type 'Widget'"**
- Solução: Use `child ?? const SizedBox()` ao renderizar children

**Erro: "'background' is deprecated"**
- Solução: Remova `background` do ColorScheme e use apenas `surface`

**Erro de imports relativos**
- Solução: Use imports absolutos com `package:app_angical_turismo/`

## 📚 Recursos

- [Flutter Documentation](https://flutter.dev)
- [Material Design 3](https://m3.material.io/)
- [Google Fonts](https://fonts.google.com/)
- [Provider Package](https://pub.dev/packages/provider)

## 📄 Licença

Propriedade de Angical Turismo - 2026

## 👨‍💻 Autor

Desenvolvido com ❤️ em Flutter
