void main() async {
  print('Inicio');
  bool sucesso = await auxiliar();
  print('Fim $sucesso');
}

Future<bool> auxiliar() async {
  String usuario = await reqUsuario();
  print('Encontrou !!! $usuario');
  try {
    bool sucesso = await autenticar(usuario);
    return sucesso;
  } catch(e) {
    return false;
  }
}

Future<String> reqUsuario() async {
  await Future.delayed(Duration(seconds : 2));
  print('Encontrou usuario Eduardo Matheus');
  return 'Eduardo Matheus';
}

Future<bool> autenticar(String usuario) async {
  await Future.delayed(Duration(seconds : 2));
  if(usuario == 'Eduardo Matheus') return true;
  throw UsuarioInvalido();
}

class UsuarioInvalido implements Exception{}