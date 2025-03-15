import 'package:flutter/material.dart';

void main() {
  runApp(const SorteioApp());
}

class SorteioApp extends StatelessWidget {
  const SorteioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Sorteio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      themeMode: ThemeMode.system,
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final TextEditingController _nomeController = TextEditingController();
  final List<String> _pessoasNaoSorteadas = [];
  final List<String> _pessoasSorteadas = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _adicionarPessoa() {
    if (_formKey.currentState!.validate()) {
      final nome = _nomeController.text.trim();
      setState(() {
        _pessoasNaoSorteadas.add(nome);
        _nomeController.clear();
      });
    }
  }

  void _moverParaSorteados(int index) {
    setState(() {
      final pessoa = _pessoasNaoSorteadas.removeAt(index);
      _pessoasSorteadas.add(pessoa);
    });
  }

  void _moverParaNaoSorteados(int index) {
    setState(() {
      final pessoa = _pessoasSorteadas.removeAt(index);
      _pessoasNaoSorteadas.add(pessoa);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final isMobile = mediaQuery.size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteio de Pessoas'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Formulário para adicionar pessoas
              Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _nomeController,
                        decoration: InputDecoration(
                          labelText: 'Nome da pessoa',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          prefixIcon: const Icon(Icons.person_add),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Por favor, insira um nome';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        onEditingComplete: _adicionarPessoa,
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: _adicionarPessoa,
                      icon: const Icon(Icons.add),
                      label: const Text('Adicionar'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Duas listas (responsiva dependendo da orientação)
              Expanded(
                child: isMobile
                    ? Column(
                        children: [
                          _buildListaSection('Não Sorteados', _pessoasNaoSorteadas, _moverParaSorteados, Colors.redAccent),
                          const SizedBox(height: 16),
                          _buildListaSection('Sorteados', _pessoasSorteadas, _moverParaNaoSorteados, Colors.greenAccent),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildListaSection('Não Sorteados', _pessoasNaoSorteadas, _moverParaSorteados, Colors.redAccent),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildListaSection('Sorteados', _pessoasSorteadas, _moverParaNaoSorteados, Colors.greenAccent),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListaSection(String titulo, List<String> lista, Function(int) onTap, Color cor) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cor.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  titulo == 'Sorteados' ? Icons.check_circle : Icons.pending,
                  color: cor,
                ),
                const SizedBox(width: 8),
                Text(
                  '$titulo (${lista.length})',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: cor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: cor.withOpacity(0.3)),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: lista.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhuma pessoa na lista de $titulo',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          elevation: 2,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: cor.withOpacity(0.2),
                              child: Text(
                                lista[index][0].toUpperCase(),
                                style: TextStyle(
                                  color: cor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(lista[index]),
                            trailing: IconButton(
                              icon: Icon(
                                titulo == 'Sorteados' ? Icons.arrow_back : Icons.arrow_forward,
                                color: cor,
                              ),
                              onPressed: () => onTap(index),
                              tooltip: titulo == 'Sorteados' ? 'Remover do sorteio' : 'Adicionar ao sorteio',
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }
}