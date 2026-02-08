# 🔧 TROUBLESHOOTING & FAQ

## ❌ Problemas Comuns e Soluções

### 1. "The element type 'Widget?' can't be assigned to the list type 'Widget'"

**Sintoma:** Erro de compilação ao usar `child` em Stack

**Causa:** `BuildContext.child` pode ser null

**Solução:**
```dart
// ❌ ERRADO
children: [child]

// ✅ CERTO
children: [child ?? const SizedBox()]

// ✅ OU
children: [...?[child].whereType<Widget>()]
```

---

### 2. "'background' is deprecated and shouldn't be used"

**Sintoma:** Warning ao usar ColorScheme.background

**Causa:** Material 3 descontinuou `background` em favor de `surface`

**Solução:**
```dart
// ❌ ERRADO
colorScheme: ColorScheme.fromSeed(
  background: Colors.white,
)

// ✅ CERTO
colorScheme: ColorScheme.fromSeed(
  brightness: Brightness.light,
)
// O surface é inferido automaticamente
```

---

### 3. "Use the null-aware marker '?' rather than a null check via an 'if'"

**Sintoma:** Lint warning para null checking

**Causa:** Usar `if (x != null) x` ao invés de null-aware

**Solução:**
```dart
// ❌ ERRADO
if (child != null) child,

// ✅ CERTO
child ?? const SizedBox(),

// ✅ OU para listas
...?[child],
```

---

### 4. "Target of URI doesn't exist: 'path/to/file.dart'"

**Sintoma:** Erro de import, arquivo não encontrado

**Causa:** Path relativo incorreto ou arquivo não existe

**Solução:**
```dart
// ❌ ERRADO
import '../../core/services/auth_service.dart';

// ✅ CERTO (preferido)
import 'package:app_angical_turismo/core/services/auth_service.dart';
```

---

### 5. "The method 'methodName' isn't defined for the type"

**Sintoma:** Método não encontrado

**Causa:** Import faltando ou nome do método errado

**Solução:**
```dart
// ✅ Verificar que o import está correto
import 'package:app_angical_turismo/core/services/auth_service.dart';

// ✅ Verificar nome do método (case-sensitive)
bool success = await loginUser(email, password);  // ✅ certo
bool success = await LoginUser(email, password);  // ❌ errado (capital L)
```

---

### 6. "Unused import: 'package_name'"

**Sintoma:** Warning de import não utilizado

**Causa:** Import foi adicionado mas não é usado

**Solução:**
```dart
// ❌ ERRADO - import mas não usa
import 'package:services_page/services_page.dart';

void build(context) {
  return Container();
}

// ✅ CERTO - remover ou usar
// Opção 1: remover import
// Opção 2: usar no código
return ServicesPage();
```

---

## 🚫 Erros de Build

### "Flutter clean não funciona"

**Problema:**
```
Failed to remove C:\Users\...\App_Tur_Ang\.dart_tool.
A program may still be using a file.
```

**Solução:**
```bash
# Opção 1: Fechar todos os editores/terminals
flutter clean

# Opção 2: Remover manualmente via Powershell
rmdir -r -Force .dart_tool
rmdir -r -Force build
flutter pub get
```

---

### "Build web muito lento"

**Problema:** Primeira compilação leva 60+ segundos

**Soluções:**
```bash
# Opção 1: Release build
flutter build web --release

# Opção 2: Skipear tree-shaking de ícones
flutter build web --no-tree-shake-icons

# Opção 3: Usar cache
flutter run -d chrome --no-fast-start
```

---

### "Erro de certificado SSL em Windows"

**Problema:** 
```
HandshakeException: Connection terminated abnormally
```

**Solução:**
```bash
# Contornar certificado
flutter pub get --insecure

# Ou definir variável de ambiente
set PUB_ENVIRONMENT=flutter_install
set GIT_TERMINAL_PROMPT=0
```

---

## 🔄 Problemas de Hot Reload

### "Hot reload não funciona"

**Sintomas:**
- Mudanças no código não aparecem
- Aparece erro ao pressionar `r`

**Soluções:**
```bash
# Opção 1: Hot restart completo
R  # No terminal do app

# Opção 2: Reiniciar conexão
flutter run --no-fast-start

# Opção 3: Limpar e reconstruir
flutter clean
flutter pub get
flutter run
```

### "Hot reload quebra estado da app"

**Problema:** State não é preservado após reload

**Solução:** Use Provider/Riverpod para state management persistente
```dart
class MyApp extends StatelessWidget {
  build(context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const AppWidget(),
    );
  }
}
```

---

## 📱 Problemas de Emulador

### "Emulador não conecta"

```bash
# Listar dispositivos disponíveis
flutter devices

# Se nenhum aparece, iniciar emulador manualmente
flutter emulators launch emulator-5554

# Tentar conectar
flutter run -d emulator-5554
```

### "Porta em uso"

```bash
# Encontrar e matar processo
netstat -ano | findstr :8080
taskkill /PID <PID> /F

# Usar porta diferente
flutter run -d chrome --web-port=8081
```

---

## 🎥 Problemas de Performance

### "App travando ao rolar"

**Causa:** Muitos rebuilds

**Solução:**
```dart
// ✅ Use const para widgets estáticos
const HomeTopAppBar()

// ✅ Use SingleChildScrollView com controller
class MyScroll extends StatefulWidget {
  build(context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(...),
    );
  }
}

// ✅ Use ListView.builder para listas grandes
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => Item(items[index]),
)
```

### "App consome muita memória"

**Soluções:**
```bash
# Usar profiler
flutter run --profile

# Verificar memory com DevTools
dart devtools
```

---

## 🌐 Problemas Web

### "Blank page ao abrir no navegador"

**Causa:** Erro de compilação não visível

**Solução:**
```bash
# Verificar console do navegador (F12)
flutter run -d chrome -v  # Verbose output

# Reconstruir web
flutter web:serve
```

### "CORS errors"

**Problema:** 
```
Cross-Origin Request Blocked
```

**Solução:**
```bash
# Usar web server sem CORS em dev
flutter run -d chrome --web-renderer=html

# Em produção, configurar backend para CORS
headers["Access-Control-Allow-Origin"] = "*"
```

---

## 🔐 Problemas de Autenticação

### "Login sempre falha"

**Verificar:**

1. AuthService está sendo chamado?
```dart
// Adicionar logging
print('Email: $_emailController.text');
bool success = await loginUser(...);
print('Login result: $success');
```

2. Validação está correta?
```dart
// Emails válidos para teste
test@example.com  ✅
user@domain.co    ✅
test@test         ❌ (sem TLD)
```

3. Provider montado?
```dart
if (mounted) {
  // Apenas atualizar se widget ainda existe
  setState(...);
}
```

---

## 🎨 Problemas de Tema

### "Tema escuro não funciona"

**Verificar:**
```dart
// Está lendo o Provider?
final themeProvider = Provider.of<ThemeProvider>(context);
themeMode: themeProvider.isHighContrast ? ThemeMode.dark : ThemeMode.light,

// Está alterando o estado?
themeProvider.toggleTheme();  // Notifies listeners
```

### "Cores erradas em dark mode"

**Solução:**
```dart
// Sempre verificar o tema
final isDark = Theme.of(context).brightness == Brightness.dark;

final color = isDark 
  ? const Color(0xFF1E293B)  // Dark color
  : Colors.white;             // Light color
```

---

## 🗂️ Problemas de Estrutura

### "Imports circulares"

**Sintoma:**
```
[error] Circular dependency detected.
```

**Solução:** Revisar dependências
```dart
// ❌ ERRADO - A importa B, B importa A
// file_a.dart
import 'file_b.dart';

// ❌ file_b.dart  
import 'file_a.dart';

// ✅ CERTO - C não importa A nem B diretamente
// file_c.dart (comum)
import 'file_a.dart';
import 'file_b.dart';
```

---

## 📊 Análise de Código

### "Flutter analyze com warnings"

**Soluções:**
```bash
# Ver todos os warnings detalhados
flutter analyze --watch

# Corrigir warnings automaticamente
flutter fix --apply

# Verificar um arquivo específico
flutter analyze lib/features/auth/pages/login_page.dart
```

---

## 🧪 Testes

### "Testes falhando"

```bash
# Rodar testes com verbose
flutter test -v

# Rodar um teste específico
flutter test test/features/auth_test.dart

# Gerar coverage
flutter test --coverage
```

---

## 📝 Logs e Debug

### "Adicionar logging"

```dart
import 'dart:developer' as developer;

// Info
developer.log('Login attempt', name: 'auth');

// Erro com stack trace
try {
  await loginUser(email, password);
} catch (e, stackTrace) {
  developer.log('Error: $e', error: e, stackTrace: stackTrace);
}
```

### "Debugger no VSCode"

1. **Arquivo `.vscode/launch.json`:**
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter App",
      "type": "dart",
      "request": "launch",
      "program": "lib/main.dart"
    }
  ]
}
```

2. **Pressionar F5** para start debugging

---

## ✅ Checklist de Troubleshooting

- [ ] `flutter doctor` - verificar setup
- [ ] `flutter clean` - limpar cache
- [ ] `flutter pub get` - reinstalar deps
- [ ] `flutter analyze` - verificar erros
- [ ] Verificar console do navegador (F12)
- [ ] Verificar logs: `flutter run -v`
- [ ] Tentar hot restart: `R`
- [ ] Tentar clean build: `flutter clean && flutter pub get`
- [ ] Revisar imports relativos vs absolutos
- [ ] Verificar null safety completo

---

## 📞 Recursos Úteis

- [Flutter Troubleshooting](https://flutter.dev/docs/testing/troubleshooting)
- [Dart Documentation](https://dart.dev/guides)
- [Material 3 Guide](https://m3.material.io/)
- [Stack Overflow - flutter tag](https://stackoverflow.com/questions/tagged/flutter)
- [GitHub Issues - Flutter](https://github.com/flutter/flutter/issues)

---

**Última atualização:** 07 de fevereiro de 2026
**Flutter Version:** 3.10.3+
**Dart Version:** 3.10.3+
