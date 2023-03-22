import 'package:componentes/providers/menu_provider.dart';
import 'package:componentes/ui/screens/alerts_screen.dart';
import 'package:flutter/material.dart';
import 'package:componentes/utils/icon_mapping.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('componentes de flutter'),
      ),
      body: _lista(),
    );
  }
}

Widget _lista() {
  //recuperacion de datos de un archivo .json
  // print(menuProvider.opciones);
  // menuProvider.loadData().then((opciones) {
  //   print('_lista: ');
  //   print(opciones);
  // });
  //return ListView(
  // children: _listaItems(),
  // );
  return FutureBuilder(
    future: menuProvider.loadData(), //Indicando lo que queremos esperar
    initialData: const [],
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      print('builder: ');
      print(snapshot.data);
      return ListView(
        children: _listaItems(snapshot.data as List<dynamic>, context),
      );
    },
  );
}

List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
  final List<Widget> opciones = [];
  IconMapping iconMap = const IconMapping();

  data.forEach((opt) {
    final tile = ListTile(
      title: Text(opt['texto']),
      leading: iconMap.getIcon(opt['icon']),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.blue,
      ),
      subtitle: Text(opt['texto2']),
      onTap: () {
        // final route = MaterialPageRoute(builder: (context) {
        // return const AlertsScreen();
        // });
        Navigator.pushNamed(context, opt['ruta']);
        // Navigator.push(context, route);
      },
    );
    opciones
      ..add(tile)
      ..add(const Divider());
  });

  return opciones;
}
  // return const [
  //   ListTile(
  //     title: Text('Pittsburgh Steelers'),
  //     subtitle: Text('El mejor equipo de la NFL y el maximo campeon'),