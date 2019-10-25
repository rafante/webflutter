import 'package:flutter/material.dart';
import './ferramentas/tela.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:showcaseview/showcaseview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: MyHomePage(title: 'Site da Lindsey'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _diaSelecionado;
  GlobalKey _one = GlobalKey();
  List<String> horarios = [
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
    '00:00',
    '00:30',
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getCorpo(),
      drawer: Drawer(
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowCaseWidget.startShowCase(context, [_one]);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            ShowCaseWidget(
              key: _one,
              child: IconButton(
                icon: Icon(Icons.access_time),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCorpo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          width: Tela.x(context, 50),
          child: _calendario(),
        ),
        Container(
          width: Tela.x(context, 50),
          child: _horarios(),
        )
      ],
    );
  }

  Widget _calendario() {
    return CalendarCarousel(
      viewportFraction: 1.0,
      selectedDateTime: _diaSelecionado,
      onCalendarChanged: (_) {},
      onDayLongPressed: (_) {},
      onDayPressed: (a, b) {},
      onHeaderTitlePressed: () {},
    );
  }

  Widget _horarios() {
    List<Widget> lista = [];
    bool cinza = false;
    horarios.forEach((horario) {
      cinza = !cinza;
      lista.add(Container(
        child: ListTile(
          leading: Container(
            width: 20,
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(3),
                child: Container(
                  color: ThemeData.dark().bottomAppBarColor,
                ),
              ),
            ),
          ),
          title: Text('$horario - Fulano'),
          subtitle: Text('Rua mármore 209'),
          trailing: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.redAccent,
            ),
            onPressed: () {},
          ),
        ),
      ));
      lista.add(Divider(
        color: ThemeData.dark().backgroundColor,
        thickness: 2,
        height: 20,
      ));
    });
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Tela.y(context, 2), horizontal: Tela.x(context, 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: Tela.y(context, 10),
            child: Text(
              'Hoje',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            height: Tela.y(context, 65),
            child: ListView(
              shrinkWrap: true,
              children: lista,
            ),
          )
        ],
      ),
    );
  }
}
