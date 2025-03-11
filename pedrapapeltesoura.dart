import 'dart:io';
import 'dart:math';

void main() {
  List<String> opcoes = ['Pedra', 'Papel', 'Tesoura'];
  Random random = Random();

  while (true) {
    print('\n🎮 Jogo Pedra, Papel e Tesoura');
    print('1 - Pedra');
    print('2 - Papel');
    print('3 - Tesoura');
    print('4 - Sair');
    stdout.write('Escolha uma opção: ');

    String? entrada = stdin.readLineSync();
    int escolhaUsuario = int.tryParse(entrada ?? '') ?? 0;

    if (escolhaUsuario == 4) {
      print('👋 Saindo do jogo...');
      break;
    }

    if (escolhaUsuario < 1 || escolhaUsuario > 3) {
      print('❌ Opção inválida. Escolha entre 1 e 3.');
      continue;
    }

    String escolhaJogador = opcoes[escolhaUsuario - 1];
    String escolhaComputador = opcoes[random.nextInt(3)];

    print('\n🧑 Você escolheu: $escolhaJogador');
    print('🤖 O computador escolheu: $escolhaComputador');

    String resultado = determinarVencedor(escolhaJogador, escolhaComputador);
    print('🏆 Resultado: $resultado');
  }
}

String determinarVencedor(String jogador, String computador) {
  if (jogador == computador) {
    return 'Empate!';
  } else if ((jogador == 'Pedra' && computador == 'Tesoura') ||
             (jogador == 'Papel' && computador == 'Pedra') ||
             (jogador == 'Tesoura' && computador == 'Papel')) {
    return 'Você venceu! 🎉';
  } else {
    return 'Computador venceu! 🤖';
  }
}
