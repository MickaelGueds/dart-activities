import 'dart:io';

void main() {
  print('🔠 Criador de Acrônimos');
  stdout.write('Digite uma frase: ');
  String? frase = stdin.readLineSync();

  if (frase == null || frase.trim().isEmpty) {
    print('❌ Entrada inválida. Digite uma frase.');
    return;
  }

  String acronimo = gerarAcronimo(frase);
  print('🔤 Acrônimo gerado: $acronimo');
}

String gerarAcronimo(String frase) {
  List<String> palavras = frase.split(' ');
  String acronimo = palavras.map((palavra) => palavra[0].toUpperCase()).join('');
  return acronimo;
}
