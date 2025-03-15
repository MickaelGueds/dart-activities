import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int numeroSecreto = random.nextInt(100) + 1; // Número aleatório entre 1 e 100
  int tentativas = 0;
  int palpite = 0;

  print('🎮 Bem-vindo ao Jogo de Adivinhação!');
  print('Tente adivinhar o número entre 1 e 100.');

  while (palpite != numeroSecreto) {
    stdout.write('Digite seu palpite: ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.isEmpty) {
      print('Por favor, insira um número válido.');
      continue;
    }

    palpite = int.tryParse(entrada) ?? -1;

    if (palpite < 1 || palpite > 100) {
      print('Número fora do intervalo! Digite um número entre 1 e 100.');
      continue;
    }

    tentativas++;

    if (palpite < numeroSecreto) {
      print('🔼 O número secreto é maior.');
    } else if (palpite > numeroSecreto) {
      print('🔽 O número secreto é menor.');
    } else {
      print('🎉 Parabéns! Você acertou em $tentativas tentativas.');
      break;
    }
  }
}
