import 'dart:io';
import 'dart:math';

void main() {
  print('🔐 Gerador de Senhas Aleatórias');
  stdout.write('Digite o tamanho da senha desejada: ');
  int tamanho = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (tamanho <= 0) {
    print('❌ Tamanho inválido. Digite um número maior que zero.');
    return;
  }

  stdout.write('Incluir caracteres especiais? (S/N): ');
  String incluirEspeciais = stdin.readLineSync()?.toUpperCase() ?? 'N';

  bool usarEspeciais = incluirEspeciais == 'S';

  String senha = gerarSenha(tamanho, usarEspeciais);
  print('\n🛡️ Senha gerada: $senha');
}

String gerarSenha(int tamanho, bool incluirEspeciais) {
  const String letras = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String numeros = '0123456789';
  const String especiais = '!@#\$%^&*()-_=+<>?/[]{}|';

  String caracteres = letras + numeros;
  if (incluirEspeciais) {
    caracteres += especiais;
  }

  Random random = Random();
  return List.generate(tamanho, (index) => caracteres[random.nextInt(caracteres.length)]).join();
}
