import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Fatec Ferraz- Controle de Alunos",
      home: Scaffold(
        appBar:AppBar(
          title: const Text("Appzinho da Fatec"),
          ),
          body: Home(),
        ) 
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Pode Entrar!";

  

  _alteraContador(int i) {
    setState(() {
      _pessoa += i;

      if (_pessoa <= 0) {
        _pessoa = 0;
        _mensagem = "Não chegou ninguem ainda !\n " +
            (_pessoa * 2).toString() +
            "% da capacidade";
      } else if (_pessoa > 50) {
        _mensagem = "Lotado ! Aguarde !\n " +
            (_pessoa * 2).toString() +
            "% da capacidade";
      } else {
        _mensagem =
            "Pode Entrar! \n " + (_pessoa * 2).toString() + "% da capacidade";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/wp.png",
          fit: BoxFit.cover,
          height: 900,
        ),
        Container(
          color: Color.fromARGB(111, 57, 54, 244), //BACKGROUND
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pessoas: $_pessoa",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        _alteraContador(1);
                        if(_pessoa==25){
                          const snackBar = SnackBar(
                              content: Text('Metade da capacidade atingida!'),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }else if (_pessoa==50){
                          const snackBar = SnackBar(
                              content: Text('100% da capacidade atingida!'),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        _alteraContador(-1);
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _mensagem,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                ),
              ), //
            ],
          ),
        )
      ],
    );
  }
}
