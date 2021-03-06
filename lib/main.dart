import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => MyRoutes2()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('imagens/olimpiadas.png'),
            Image.asset('imagens/carregado.png'),
          ],
        ),
      ),
    );
  }
}

class MyRoutes2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final args = settings.arguments as ScreenArguments;

          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
                img: args.img,
              );
            },
          );
        }

        assert(false, 'Precisa implemetar ${settings.name}');
        return null;
      },
      title: 'Olimpiadas',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olimpiadas'),
        backgroundColor: Colors.cyan[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'imagens/olimpiadas.png',
            ),
            Padding(padding: EdgeInsets.all(16)),
            //ignore: deprecated_member_use
            RaisedButton(
              color: Colors.cyan[400],
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                      'Historia das olimpiadas',
                      'As Olimp??adas originaram-se por volta do s??culo VIII a.C., no contexto da antiga H??lade, isto ??, o conjunto das cidades-estado da Gr??cia Cl??ssica. A realiza????o dos jogos ocorria na cidade de Ol??mpia ??? por isso o nome ???Olimp??adas??? ???, para onde os cidad??os das outras cidades peregrinavam a fim de participarem das competi????es. O primeiro atleta a vencer uma prova em Ol??mpia teria sido Corobeu, em 776 a.C. ??? a prova era de corrida. ',
                      ''),
                );
              },
              child: Text('Historia das Olimpiadas'),
            ),

            Padding(padding: EdgeInsets.all(8)),
            //ignore: deprecated_member_use
            Image.asset(
              'imagens/tokyo.png',
            ),
            RaisedButton(
              color: Colors.cyan[400],
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Olimpiadas de Tokyo 2020',
                    'Pela primeira vez na hist??ria, as cerim??nias de abertura e encerramento, assim como as competi????es na capital do Jap??o, n??o ter??o a presen??a de p??blico. A decis??o de proibir espectadores foi tomada por conta da decreta????o do estado de emerg??ncia em T??quio at?? o final das competi????es at?? 8 de agosto, e em meio a cr??ticas de autoridades de sa??de do pa??s e rejei????o da popula????o ?? competi????o.',
                    '',
                  ),
                );
              },
              child: Text('Olimpiadas de Tokyo'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[400],
        title: Text(args.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('imagens/olimpiadas.png', width: 250),
            Text(
              args.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            //ignore: deprecated_member_use
            RaisedButton(
              color: Colors.cyan[400],
              child: Text('Voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;
  final img;

  const PassArgumentsScreen({
    Key? key,
    required this.title,
    required this.message,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.cyan[400],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'imagens/tokyo.png',
              width: 250,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            //ignore: deprecated_member_use
            RaisedButton(
              color: Colors.cyan[400],
              child: Text('Voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;
  final img;

  ScreenArguments(this.title, this.message, this.img);
}
