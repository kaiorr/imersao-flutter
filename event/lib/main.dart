import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

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
