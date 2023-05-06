import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late TextEditingController _nome = TextEditingController();
  final TextEditingController _endereco = TextEditingController();
  final TextEditingController _numero = TextEditingController();
  final TextEditingController _complemento = TextEditingController();
  final TextEditingController _uf = TextEditingController();
  final TextEditingController _cep = TextEditingController();

  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;

  String _result = "";
  bool envio = false;

  // simula envia de informação
  void _enviar() {
    String nome = _nome.text;
    String endereco = _endereco.text;
    String numero = _numero.text;
    String complemento = _complemento.text;
    String uf = _uf.text;
    String cep = _cep.text;

    // altera state textColor
    void changeTextColor(Color newColor) {
      setState(() {
        textColor = newColor;
      });
    }

    // altera cor da borda
    void changeBorderColor(Color newColor) {
      setState(() {
        borderColor = newColor;
      });
    }

    void changeEnvio(bool e) {
      setState(() {
        envio = e;
      });
    }

    // define resposta
    setState(() {
      // não informou nome
      if (nome == "") {
        // altera cor do texto
        changeTextColor(Colors.red);
        // altera mensagem
        _result = "Campo nome obrigatório";
        // alterar cor da borda
        changeBorderColor(Colors.red);
      } else if (endereco == "") {
        changeTextColor(Colors.red);
        _result = "Campo endereço obrigatório";
        changeBorderColor(Colors.red);
      } else if (numero == "") {
        changeTextColor(Colors.red);
        _result = "Campo número obrigatório";
        changeBorderColor(Colors.red);
      } else if (uf == "") {
        changeTextColor(Colors.red);
        _result = "Campo UF obrigatório";
        changeBorderColor(Colors.red);
      } else if (cep == "") {
        changeTextColor(Colors.red);
        _result = "Campo CEP obrigatório";
        changeBorderColor(Colors.red);
      } else {
        // ok, alterar dados para
        changeEnvio(true);
        changeTextColor(Colors.blue, );
        changeBorderColor(Colors.grey);

        // abrindo a segunda página
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
              nome: nome,
              endereco: endereco,
              numero: numero,
              complemento: complemento,
              uf: uf,
              cep: cep,
            ),

          ),
        );
      }
    });
  }
    
    // cancelar
  void _cancelar() {
    _nome.text = "";
    _endereco.text = "";
    _numero.text = "";
    _complemento.text = "";
    _uf.text = "";
    _cep.text = "";

    String nome = _nome.text;

    // define resposta
    setState(() {
      _result = nome;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0), // um retângulo contendo widget de entrada
            SizedBox(
                // label para primeiro número
                width: 300,
                child: TextField(
                  controller: _nome, // associa controle ao widget
                  keyboardType: TextInputType.text, // tipo de entrada
                  decoration: InputDecoration(
                    // customização
                    hintText: 'Entre com nome', //hint
                    prefixIcon:
                        const Icon(Icons.account_circle_outlined), //icon
                    enabledBorder: OutlineInputBorder(
                      //borda ao redor da entrada
                      borderSide: BorderSide(color: borderColor), //cor da borda
                    ), //quando receber o foco, altera cor da borda
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16.0),
            // if ternário que controla exibição da resposta.
            // senão foi enviado, então apresenta botões
            // enviar e cancelar
            SizedBox(
              width: 300,
              child: TextField(
                controller: _endereco,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entre com endereço',
                  prefixIcon: const Icon(Icons.home_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            SizedBox(
              width: 300,
              child: TextField(
                controller: _numero,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entre com número',
                  prefixIcon: const Icon(Icons.home_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            SizedBox(
              width: 300,
              child: TextField(
                controller: _complemento,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entre com complemento',
                  prefixIcon: const Icon(Icons.home_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            SizedBox(
              width: 300,
              child: TextField(
                controller: _uf,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entre com Estado',
                  prefixIcon: const Icon(Icons.home_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            SizedBox(
              width: 300,
              child: TextField(
                controller: _cep,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entre com CEP',
                  prefixIcon: const Icon(Icons.home_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            !envio
                ? SizedBox(
                    // botões
                    width: 300,
                    // Row determina que os widgets serão acrescentados
                    // lado a lado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _enviar,// executa _enviar
                          child: const Text('Enviar'),
                        ),
                      ],
                    ))
                : const SizedBox.shrink(),// espaço vazio
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String nome;
  final String endereco;
  final String numero;
  final String complemento;
  final String uf;
  final String cep;

  SecondPage({
    required this.nome,
    required this.endereco,
    required this.numero,
    required this.complemento,
    required this.uf,
    required this.cep,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),    
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center (heightFactor: 2,child: Text(
              'Navegação entre páginas',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 32,
                color: Colors.black,))),
            Text('Informações Recebidas: ', style: TextStyle(fontSize: 24.0),),
            SizedBox(height: 20.0),
            Text('Nome: $nome', style: TextStyle(fontSize: 20.0),),
            SizedBox(height: 10.0),
            Text('Endereço: $endereco', style: TextStyle(fontSize: 20.0),),
            SizedBox(height: 8.0),
            Text('Número: $numero', style: TextStyle(fontSize: 20.0),),
            SizedBox(height: 8.0),
            Text('Complemento: $complemento', style: TextStyle(fontSize: 20.0),),
            SizedBox(height: 8.0),
            Text('UF: $uf', style: TextStyle(fontSize: 20.0),),
            SizedBox(height: 8.0),
            Text('CEP: $cep', style: TextStyle(fontSize: 20.0),),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
              },
              child: const Text('Voltar'),
            ),
          ],  
        ),
      ),
    );
  }
}