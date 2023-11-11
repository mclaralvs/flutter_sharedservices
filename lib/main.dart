import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeUser(title: 'GM Duo'),
    );
  }
}

class HomeUser extends StatefulWidget {
  const HomeUser({super.key, required this.title});
  final String title;
  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
  }

  TextEditingController controllerName = TextEditingController(text: "");
  TextEditingController controllerEndereco = TextEditingController(text: "");
  TextEditingController controllerNumero = TextEditingController(text: "");
  TextEditingController controllerComplemento = TextEditingController(text: "");
  TextEditingController controllerCidade = TextEditingController(text: "");
  TextEditingController controllerEstado = TextEditingController(text: "");
  TextEditingController controllerEmail = TextEditingController(text: "");
  TextEditingController controllerSite = TextEditingController(text: "");
  String alert = "";

  Future<void> _createUser(
    TextEditingController nameController,
    TextEditingController enderecoController,
    TextEditingController numeroController,
    TextEditingController complementoController,
    TextEditingController cidadeController,
    TextEditingController estadoController,
    TextEditingController emailController,
    TextEditingController siteController,
  ) async {
    Map<String, dynamic> data = {
      "name": nameController.text,
      "endereco": enderecoController.text,
      "numero": numeroController.text,
      "complemento": complementoController.text,
      "cidade": cidadeController.text,
      "estado": estadoController.text,
      "email": emailController.text,
      "site": siteController.text,
    };

    if (nameController.text.isEmpty ||
        enderecoController.text.isEmpty ||
        numeroController.text.isEmpty ||
        complementoController.text.isEmpty ||
        cidadeController.text.isEmpty ||
        estadoController.text.isEmpty ||
        emailController.text.isEmpty ||
        siteController.text.isEmpty) {
      setState(() {
        alert = "Por favor, insira os dados obrigatórios.";
      });
    } else {
      setState(() {
        alert = "Usuário registrado com sucesso.";
      });
    }
  }

  void _limpar() {
    setState(() {
      controllerName.text = '';
      controllerEndereco.text = '';
      controllerNumero.text = '';
      controllerComplemento.text = '';
      controllerCidade.text = '';
      controllerEstado.text = '';
      controllerEmail.text = '';
      controllerSite.text = '';
    });
  }

  void _apagar() {}

  void _recuperar() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 16.0,
              ),
              Container(
                width: 600,
                margin: const EdgeInsets.only(left: 18.0),
                child: TextField(
                  controller: controllerName,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Entre com o nome',
                    prefixIcon: Icon(Icons.account_circle_rounded,
                        color: Colors.deepPurple),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                width: 600,
                margin: const EdgeInsets.only(left: 18.0),
                child: TextField(
                  controller: controllerEndereco,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Entre com o endereço',
                    prefixIcon: Icon(Icons.landscape, color: Colors.deepPurple),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                width: 600,
                margin: const EdgeInsets.only(left: 18.0),
                child: TextField(
                  controller: controllerNumero,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Entre com o número da residência',
                    prefixIcon: Icon(Icons.pin, color: Colors.deepPurple),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                width: 600,
                margin: const EdgeInsets.only(left: 18.0),
                child: TextField(
                  controller: controllerComplemento,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Entre com o complemento',
                    prefixIcon: Icon(Icons.home, color: Colors.deepPurple),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                width: 600,
                margin: const EdgeInsets.only(left: 18.0),
                child: TextField(
                  controller: controllerCidade,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Entre com a cidade',
                    prefixIcon:
                        Icon(Icons.account_balance, color: Colors.deepPurple),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                width: 600,
                margin: const EdgeInsets.only(left: 18.0),
                child: TextField(
                  controller: controllerEstado,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Entre com o estado',
                    prefixIcon: Icon(Icons.language, color: Colors.deepPurple),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                width: 600,
                margin: const EdgeInsets.only(left: 18.0),
                child: TextField(
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Entre com o email',
                    prefixIcon: Icon(Icons.email, color: Colors.deepPurple),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                width: 600,
                margin: const EdgeInsets.only(left: 18.0),
                child: TextField(
                  controller: controllerSite,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    hintText: 'Entre com o site',
                    prefixIcon: Icon(Icons.link, color: Colors.deepPurple),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(130, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(
                          color: Colors.deepPurple,
                          width: 0.5,
                        ),
                      ),
                    ),
                    onPressed: () {
                      _limpar();
                    },
                    child: const Text('Limpar'),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(130, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(
                          color: Colors.deepPurple,
                          width: 0.5,
                        ),
                      ),
                    ),
                    onPressed: () {
                      _apagar();
                    },
                    child: const Text('Apagar'),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(130, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(
                          color: Colors.deepPurple,
                          width: 0.5,
                        ),
                      ),
                    ),
                    onPressed: () {
                      _recuperar();
                    },
                    child: const Text('Recuperar'),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(130, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(
                          color: Colors.deepPurple,
                          width: 0.5,
                        ),
                      ),
                    ),
                    onPressed: () {
                      _createUser(
                        controllerName,
                        controllerEndereco,
                        controllerNumero,
                        controllerComplemento,
                        controllerCidade,
                        controllerEstado,
                        controllerEmail,
                        controllerSite,
                      ).then((value) => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: (controllerName.text.isEmpty ||
                                      controllerEndereco.text.isEmpty ||
                                      controllerNumero.text.isEmpty ||
                                      controllerComplemento.text.isEmpty ||
                                      controllerCidade.text.isEmpty ||
                                      controllerEstado.text.isEmpty ||
                                      controllerEmail.text.isEmpty ||
                                      controllerSite.text.isEmpty)
                                  ? const Text('Campos obrigatórios vazios')
                                  : const Text('Usuário cadastrado!'),
                              content: Text(alert),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancelar'),
                                  child: const Text('Cancelar'),
                                ),
                              ],
                            ),
                          ));
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
