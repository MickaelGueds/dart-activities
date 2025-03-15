import 'dart:io';

class ContaBancaria {
  double saldo;

  ContaBancaria(this.saldo);

  void depositar(double valor) {
    if (valor > 0) {
      saldo += valor;
      print('✅ Depósito de R\$${valor.toStringAsFixed(2)} realizado com sucesso!');
    } else {
      print('❌ Valor inválido para depósito.');
    }
  }

  void sacar(double valor) {
    if (valor > 0 && valor <= saldo) {
      saldo -= valor;
      print('✅ Saque de R\$${valor.toStringAsFixed(2)} realizado com sucesso!');
    } else if (valor > saldo) {
      print('❌ Saldo insuficiente.');
    } else {
      print('❌ Valor inválido para saque.');
    }
  }

  void consultarSaldo() {
    print('💰 Saldo atual: R\$${saldo.toStringAsFixed(2)}');
  }
}

void main() {
  ContaBancaria conta = ContaBancaria(0.0);

  while (true) {
    print('\n🏦 Simulador de Conta Bancária');
    print('1 - Depositar');
    print('2 - Sacar');
    print('3 - Consultar Saldo');
    print('4 - Sair');
    stdout.write('Escolha uma opção: ');

    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        stdout.write('Digite o valor do depósito: ');
        double deposito = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
        conta.depositar(deposito);
        break;

      case '2':
        stdout.write('Digite o valor do saque: ');
        double saque = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
        conta.sacar(saque);
        break;

      case '3':
        conta.consultarSaldo();
        break;

      case '4':
        print('👋 Saindo do sistema bancário...');
        return;

      default:
        print('❌ Opção inválida. Escolha entre 1 e 4.');
    }
  }
}
