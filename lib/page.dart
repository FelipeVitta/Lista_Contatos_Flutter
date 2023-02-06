import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:lista_wpp/api.dart';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'main.dart';

class page extends StatefulWidget {
  List<Users> oux;
  int index;

  page({Key? key, required this.oux, required this.index}) : super(key: key);

  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.oux[widget.index].name.toString()),
      ),
    );
  }
}
