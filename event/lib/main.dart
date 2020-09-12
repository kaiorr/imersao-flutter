import 'package:flutter/material.dart';
import 'package:event/event.dart';

void main() => runApp(FlutterConf());

class FlutterConf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Conf 2020',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(bottom: 15),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Flutter Conf 2020',
                style: TextStyle(
                    fontFamily: 'Righteous', fontSize: 50, color: Colors.white),
              )),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/flutter.jpg'))),
        ),
        SizedBox(
          height: 10,
        ),
        RowInfo(),
        Divider(),
        SizedBox(
          height: 30,
        ),
        RowDicas('Beba Água'),
        SizedBox(
          height: 15,
        ),
        RowDicas('Compartilhe Conhecimento'),
        Spacer(),
        SizedBox(
          height: 15,
        ),
        RowDicas('Conhecimento e Prática'),
        SizedBox(
          height: 15,
        ),
        Spacer(),
        RowDicas('#Flutter nas redes sociais'),
        Spacer(),
        RaisedButton(
          color: Colors.blue.shade500,
          textColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(80)),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EventScreen();
            }));
          },
          child: Text(
            'Palestras',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: 3),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    ));
  }
}

class RowInfo extends StatelessWidget {
  final _style = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(Icons.calendar_today),
            SizedBox(height: 5),
            Text(
              '10/set',
              style: _style,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(Icons.timer),
            SizedBox(height: 5),
            Text('19:00', style: _style),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(Icons.pin_drop),
            SizedBox(height: 5),
            Text(
              'Evento On-line',
              style: _style,
            )
          ],
        )
      ],
    );
  }
}

class RowDicas extends StatelessWidget {
  final String descricao;

  const RowDicas(this.descricao);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: <Widget>[
          Icon(Icons.info_outline),
          SizedBox(
            width: 10,
          ),
          Text(
            descricao,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class EventScreen extends StatefulWidget {
  _EventScreentate createState() => _EventScreentate();
}

class _EventScreentate extends State<EventScreen> {
  List<Event> _listaFavoritos = [];

  @override
  Widget build(BuildContext context) {
    var listView = ListView.builder(
      itemCount: listaEvent.length,
      itemBuilder: (context, index) {
        final event = _listaEvent[index];
        bool _isFavorito = _listaFavoritos.contains(event);
      },
    );
  }
}
