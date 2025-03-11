import 'dart:io';
import 'dart:math';

void main() {
  List<String> nomes = [];

  print('🎲 Simulador de Sorteio');
  print('Digite os nomes para o sorteio (digite "sair" para finalizar):');

  while (true) {
    stdout.write('Nome: ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.trim().isEmpty) {
      print('❌ Nome inválido. Tente novamente.');
      continue;
    }

    if (entrada.toLowerCase() == 'sair') {
      if (nomes.isEmpty) {
        print('⚠️ Nenhum nome foi inserido. Adicione pelo menos um nome antes de sair.');
        continue;
      }
      break;
    }

    nomes.add(entrada);
  }

  print('\n🎰 Realizando o sorteio...');
  Random random = Random();
  String vencedor = nomes[random.nextInt(nomes.length)];

  print('🏆 O nome sorteado foi: $vencedor 🎉');
}
