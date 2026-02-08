// Serviço mock de autenticação para desenvolvimento
// Substituir por um serviço real que faz chamadas à API

Future<bool> loginUser(String email, String password) async {
  // Simular delay de rede
  await Future.delayed(const Duration(seconds: 2));
  
  // Validação básica mock
  if (email.isNotEmpty && password.isNotEmpty && email.contains('@')) {
    return true;
  }
  return false;
}

Future<void> logoutUser() async {
  // Implementar logout
  await Future.delayed(const Duration(seconds: 1));
}

Future<bool> isUserLoggedIn() async {
  // Verificar se usuário está logado
  return false; // tmp para sempre estar desconectado
}
