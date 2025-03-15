import 'dart:io';

void main() {
  List<String> tarefas = [];

  while (true) {
    print('\n📝 Gerenciador de Tarefas');
    print('1 - Adicionar Tarefa');
    print('2 - Remover Tarefa Concluída');
    print('3 - Exibir Lista de Tarefas');
    print('4 - Sair');
    stdout.write('Escolha uma opção: ');
    
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        stdout.write('Digite a nova tarefa: ');
        String? novaTarefa = stdin.readLineSync();
        if (novaTarefa != null && novaTarefa.trim().isNotEmpty) {
          tarefas.add(novaTarefa);
          print('✅ Tarefa adicionada!');
        } else {
          print('❌ Entrada inválida.');
        }
        break;

      case '2':
        if (tarefas.isEmpty) {
          print('⚠️ Nenhuma tarefa para remover.');
          break;
        }
        print('📌 Tarefas atuais:');
        for (int i = 0; i < tarefas.length; i++) {
          print('${i + 1}. ${tarefas[i]}');
        }
        stdout.write('Digite o número da tarefa concluída: ');
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index != null && index > 0 && index <= tarefas.length) {
          print('🗑️ Removendo "${tarefas[index - 1]}"...');
          tarefas.removeAt(index - 1);
          print('✅ Tarefa removida!');
        } else {
          print('❌ Número inválido.');
        }
        break;

      case '3':
        if (tarefas.isEmpty) {
          print('📭 Nenhuma tarefa pendente.');
        } else {
          print('📌 Tarefas Pendentes:');
          for (int i = 0; i < tarefas.length; i++) {
            print('${i + 1}. ${tarefas[i]}');
          }
        }
        break;

      case '4':
        print('👋 Saindo do Gerenciador de Tarefas...');
        return;

      default:
        print('❌ Opção inválida. Escolha entre 1 e 4.');
    }
  }
}
