import 'dart:io';

void main() {
  print('📏 Calculadora de IMC');

  stdout.write('Digite seu peso (kg): ');
  double peso = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  stdout.write('Digite sua altura (m): ');
  double altura = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (peso <= 0 || altura <= 0) {
    print('❌ Valores inválidos. Digite números positivos.');
    return;
  }

  double imc = peso / (altura * altura);
  String classificacao = classificarIMC(imc);

  print('\n📊 Seu IMC: ${imc.toStringAsFixed(2)}');
  print('📌 Classificação: $classificacao');
}

String classificarIMC(double imc) {
  if (imc < 18.5) {
    return 'Baixo peso';
  } else if (imc < 24.9) {
    return 'Peso normal';
  } else if (imc < 29.9) {
    return 'Sobrepeso';
  } else if (imc < 34.9) {
    return 'Obesidade Grau I';
  } else if (imc < 39.9) {
    return 'Obesidade Grau II';
  } else {
    return 'Obesidade Grau III (Mórbida)';
  }
}
