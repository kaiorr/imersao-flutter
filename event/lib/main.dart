import 'package:event/event.dart';
import 'package:flutter/material.dart';
import 'package:event/palestras.dart';

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
              // child: Text(
              //   'Flutterando',
              //   style: TextStyle(
              //     fontFamily: 'Righteous',
              //     fontSize: 50,
              //     color: Colors.white,
              //   ),
              // ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/latam.jpg',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RowInfo(),
          Divider(),
          SizedBox(
            height: 30,
          ),
          RowDicas('Beba água'),
          SizedBox(
            height: 15,
          ),
          RowDicas('Compartilhe Conhecimento'),
          SizedBox(
            height: 15,
          ),
          RowDicas('Conhecimento e Prática'),
          Spacer(),
          RowDicas('#FlutterLatamConf nas redes sociais'),
          Spacer(),
          RaisedButton(
            color: Colors.blue.shade900,
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EventScreen();
              }));
            },
            child: Text(
              'Palestras',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
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
              '10/Set',
              style: _style,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(Icons.timer),
            SizedBox(height: 5),
            Text(
              '19:00',
              style: _style,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(Icons.pin_drop),
            SizedBox(height: 5),
            Text(
              'Evento on-line',
              style: _style,
            ),
          ],
        ),
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
  EventScreen({Key key}) : super(key: key);

  _EventScreentate createState() => _EventScreentate();
}

class _EventScreentate extends State<EventScreen> {
  List<Event> _listaFavoritos = [];
  @override
  Widget build(BuildContext context) {
    var listView = ListView.builder(
      itemCount: listaEvent.length,
      itemBuilder: (context, index) {
        final event = listaEvent[index];
        bool _isFavorito = _listaFavoritos.contains(event);
        return ListTile(
          title: Text(event.empresa),
          subtitle: Text(event.assunto),
          leading: Text(event.horario),
          trailing: IconButton(
            icon: _isFavorito
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.favorite_border,
                  ),
            onPressed: () {
              setState(() {
                if (_isFavorito) {
                  _listaFavoritos.remove(listaEvent[index]);
                } else {
                  _listaFavoritos.add(listaEvent[index]);
                }
              });
            },
          ),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Palestras'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AgendaScreen(listaFavoritos: _listaFavoritos);
              }));
            },
          ),
        ],
      ),
      body: listView,
    );
  }
}

class AgendaScreen extends StatefulWidget {
  final List<Event> listaFavoritos;
  AgendaScreen({this.listaFavoritos});

  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  TextStyle _style = TextStyle(
    fontSize: 26,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(14.0),
        itemCount: widget.listaFavoritos.length,
        itemBuilder: (context, index) {
          final event = widget.listaFavoritos[index];
          return Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        event.empresa,
                        style: _style,
                      ),
                      Text(
                        event.horario,
                        style: _style,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.thumb_up),
                      Icon(Icons.comment),
                      Icon(Icons.share),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
