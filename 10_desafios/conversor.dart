import 'dart:io';

void main() {
  Map<String, double> taxas = {
    'Real->Dólar': 0.20,  // 1 BRL = 0.20 USD
    'Real->Euro': 0.18,   // 1 BRL = 0.18 EUR
    'Dólar->Real': 5.00,  // 1 USD = 5.00 BRL
    'Dólar->Euro': 0.90,  // 1 USD = 0.90 EUR
    'Euro->Real': 5.50,   // 1 EUR = 5.50 BRL
    'Euro->Dólar': 1.10,  // 1 EUR = 1.10 USD
  };

  print('💰 Conversor de Moedas');
  print('Escolha a moeda de origem:');
  print('1 - Real (BRL)');
  print('2 - Dólar (USD)');
  print('3 - Euro (EUR)');
  stdout.write('Opção: ');
  String? opcaoOrigem = stdin.readLineSync();
  
  print('Escolha a moeda de destino:');
  print('1 - Real (BRL)');
  print('2 - Dólar (USD)');
  print('3 - Euro (EUR)');
  stdout.write('Opção: ');
  String? opcaoDestino = stdin.readLineSync();

  if (opcaoOrigem == opcaoDestino) {
    print('⚠️ Escolha moedas diferentes para converter.');
    return;
  }

  Map<String, String> opcoes = {'1': 'Real', '2': 'Dólar', '3': 'Euro'};

  String moedaOrigem = opcoes[opcaoOrigem] ?? '';
  String moedaDestino = opcoes[opcaoDestino] ?? '';

  if (moedaOrigem.isEmpty || moedaDestino.isEmpty) {
    print('❌ Opção inválida. Execute novamente.');
    return;
  }

  stdout.write('Digite o valor a ser convertido: ');
  double valor = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (valor <= 0) {
    print('❌ Valor inválido. Digite um número positivo.');
    return;
  }

  String chaveConversao = '$moedaOrigem->$moedaDestino';
  double taxa = taxas[chaveConversao] ?? 0;

  if (taxa == 0) {
    print('❌ Conversão não disponível.');
    return;
  }

  double resultado = valor * taxa;
  print('🔄 Convertendo $valor $moedaOrigem para $moedaDestino...');
  print('💰 Resultado: $resultado $moedaDestino');
}
