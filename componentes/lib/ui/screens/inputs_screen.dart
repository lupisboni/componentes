import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  String _userName = '';
  String _password = '';
  String _email = '';
  String _fecha = '';

  final TextEditingController _inputFieldDateController =
      TextEditingController(); //controlador que obtiene la información de las cajas de texto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entradas de datos por el usuario'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearEntradaNombre(),
          const Divider(),
          _crearEntradaPaswd(),
          const Divider(),
          _crearEntradaMail(),
          const Divider(),
          _crearEntradaDate(),
          const Divider(),
          _crearDropDown()
        ],
      ),
    );
  }

  Widget _crearEntradaNombre() {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.left,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: Color.fromARGB(255, 12, 27,
            37), //da el color a la fuente dentro d ela caja de texto
        fontWeight: FontWeight
            .bold, //da el estilo a la fuente dentro de la caja de texto
      ),
      cursorColor: const Color.fromARGB(255, 58, 84, 211), //color del cursor
      //cursorRadius: const Radius.circular(10.0),
      cursorWidth: 5.0, //se le puede dar un ancho al cursos
      //maxLength: 4, //cantidad máxima d eletras que aceptará
      maxLines:
          null, //la caja de texto de expande para recibir mucho texto en 'null' o se fija número de líneas
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Escriba su nombre, por favor",
        labelText: "Nombre",
        //helperText: "Nombre", //guía de texto en la etiqueta de caja de texto
        //prefixIcon: const Icon(Icons.person),
        icon: const Icon(Icons
            .person), //solo aplica para propiedad 'icon' no para prefixIcon
        //iconColor: Colors.blueGrey,
        //prefix: const CircularProgressIndicator(), //inserta un widget, el que nosotros queramos
      ),
      onChanged: (valor) {
        _userName = valor;
        print(_userName);
      },
    );
  }

  Widget _crearEntradaPaswd() {
    return TextField(
      textAlign: TextAlign.left,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: Color.fromARGB(255, 12, 27,
            37), //da el color a la fuente dentro d ela caja de texto
        fontWeight: FontWeight
            .bold, //da el estilo a la fuente dentro de la caja de texto
      ),
      cursorColor: Colors.red, //color del cursor
      //cursorRadius: const Radius.circular(10.0),
      cursorWidth: 5.0, //se le puede dar un ancho al cursos
      maxLength: 8, //cantidad máxima deletras que aceptará
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Escriba su contraseña, por favor",
        labelText: "Password",
        //helperText: "Nombre", //guía de texto en la etiqueta de caja de texto
        suffixIcon: const Icon(Icons.key),
        //icon:const Icon(Icons.person),//solo aplica para propiedad 'icon' no para prefixIcon
        //iconColor: Colors.blueGrey,
        //prefix: const CircularProgressIndicator(), //inserta un widget, el que nosotros queramos
      ),
      onChanged: (valor) {
        _password = valor;
        print(_password);
      },
    );
  }

  Widget _crearEntradaMail() {
    return TextField(
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: Color.fromARGB(255, 12, 27,
            37), //da el color a la fuente dentro d ela caja de texto
        fontWeight: FontWeight
            .bold, //da el estilo a la fuente dentro de la caja de texto
      ),
      cursorColor: Colors.red, //color del cursor
      //cursorRadius: const Radius.circular(10.0),
      cursorWidth: 5.0, //se le puede dar un ancho al cursos
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Escriba su email, por favor",
        labelText: "E-mail",
        //helperText: "Nombre", //guía de texto en la etiqueta de caja de texto
        prefixIcon: const Icon(Icons.mail),
        //icon:const Icon(Icons.person),//solo aplica para propiedad 'icon' no para prefixIcon
        //iconColor: Colors.blueGrey,
        //prefix: const CircularProgressIndicator(), //inserta un widget, el que nosotros queramos
      ),
      onChanged: (valor) {
        _email = valor;
        print(_email);
      },
    );
  }

  Widget _crearEntradaDate() {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection:
          false, //quita la selección interactiva de toda la caja de texto
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: Color.fromARGB(255, 250, 250,
            246), //da el color a la fuente dentro d ela caja de texto
        fontWeight: FontWeight
            .bold, //da el estilo a la fuente dentro de la caja de texto
      ),
      cursorColor: Colors.red, //color del cursor
      //cursorRadius: const Radius.circular(10.0),
      cursorWidth: 5.0, //se le puede dar un ancho al cursos
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: "Escriba su fecha de nacimiento",
        labelText: "Fecha de nacimiento",
        //helperText: "Nombre", //guía de texto en la etiqueta de caja de texto
        prefixIcon: const Icon(Icons.calendar_month),
        //icon:const Icon(Icons.person),//solo aplica para propiedad 'icon' no para prefixIcon
        //iconColor: Colors.blueGrey,
        //prefix: const CircularProgressIndicator(), //inserta un widget, el que nosotros queramos
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

//creará el calendario necesario para seleccionar una fecha
  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        print(_fecha);
        _fecha = DateFormat('dd-MM-yyy').format(picked);
        _inputFieldDateController.text =
            _fecha; //muestra la fecha en el Textfield
      });
    }
  }

  Widget _crearDropDown() {
    return DropdownButton(items: const [], onChanged: (opt) {});
  }

  List<DropdownMenuItem<String>> getOptionsDropDown() {
    List<String> _lenguajes = ['java', 'php', 'Javascrpt', 'dart'];
    List<DropdownMenuItem<String>> lista;
    _lenguajes.forEach((lenguaje) {
      lista.add(DropdownMenuItem(
        child: Text(lenguaje),
      ));
    });
  }
}
