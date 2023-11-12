import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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
  late SharedPreferences saveData;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  void _initSharedPreferences() async {
    saveData = await SharedPreferences.getInstance();
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
      String userDataJson = jsonEncode(data);
      saveData.setString('data', userDataJson);
      _limpar();
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

  void _apagar() {
    saveData.clear();
    _limpar();
  }

  void _recuperar() {
    if (saveData.containsKey('data')) {
      String? userDataJsonString = saveData.getString('data');
      if (userDataJsonString != null && userDataJsonString.isNotEmpty) {
        Map<String, dynamic>? userDataJson = jsonDecode(userDataJsonString);
        setState(() {
          controllerName.text = userDataJson?["name"];
          controllerEndereco.text = userDataJson?["endereco"];
          controllerNumero.text = userDataJson?["numero"];
          controllerComplemento.text = userDataJson?["complemento"];
          controllerCidade.text = userDataJson?["cidade"];
          controllerEstado.text = userDataJson?["estado"];
          controllerEmail.text = userDataJson?["email"];
          controllerSite.text = userDataJson?["site"];
        });
      }
    }
  }

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
                      bool? userDataJsonString =
                          saveData.getString('data')?.isNotEmpty;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:
                                userDataJsonString != null && userDataJsonString
                                    ? const Text('Confirmação de exclusão')
                                    : const Text('Dados não encontrados'),
                            content: userDataJsonString != null &&
                                    userDataJsonString
                                ? const Text(
                                    'Tem certeza de que deseja apagar o dado salvo?')
                                : const Text(
                                    'Não há dados salvos para excluir'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancelar'),
                              ),
                              if (userDataJsonString ?? false)
                                TextButton(
                                  onPressed: () {
                                    _apagar();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Apagar'),
                                ),
                            ],
                          );
                        },
                      );
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
                      bool userDataJsonString =
                          saveData.getString('data')?.isEmpty ?? true;
                      userDataJsonString
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Dados não encontrados'),
                                  content: const Text(
                                      'Não há dados salvos para recuperar'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            )
                          : _recuperar();
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
                              title:
                                  (alert != "Usuário registrado com sucesso.")
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
