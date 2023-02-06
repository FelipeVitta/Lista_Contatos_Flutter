import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:lista_wpp/api.dart';
import 'package:http/http.dart' as http;
import 'package:lista_wpp/page.dart';
import 'api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Lista WhatsApp",
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Users> oxi = [];

  List<Users> getUsers() {
    List<Users> listUser = [];
    var response = [
      {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": {
          "street": "Kulas Light",
          "suite": "Apt. 556",
          "city": "Gwenborough",
          "zipcode": "92998-3874",
          "geo": {"lat": "-37.3159", "lng": "81.1496"}
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
          "name": "Romaguera-Crona",
          "catchPhrase": "Multi-layered client-server neural-net",
          "bs": "harness real-time e-markets"
        }
      },
      {
        "id": 2,
        "name": "Ervin Howell",
        "username": "Antonette",
        "email": "Shanna@melissa.tv",
        "address": {
          "street": "Victor Plains",
          "suite": "Suite 879",
          "city": "Wisokyburgh",
          "zipcode": "90566-7771",
          "geo": {"lat": "-43.9509", "lng": "-34.4618"}
        },
        "phone": "010-692-6593 x09125",
        "website": "anastasia.net",
        "company": {
          "name": "Deckow-Crist",
          "catchPhrase": "Proactive didactic contingency",
          "bs": "synergize scalable supply-chains"
        }
      },
      {
        "id": 3,
        "name": "Clementine Bauch",
        "username": "Samantha",
        "email": "Nathan@yesenia.net",
        "address": {
          "street": "Douglas Extension",
          "suite": "Suite 847",
          "city": "McKenziehaven",
          "zipcode": "59590-4157",
          "geo": {"lat": "-68.6102", "lng": "-47.0653"}
        },
        "phone": "1-463-123-4447",
        "website": "ramiro.info",
        "company": {
          "name": "Romaguera-Jacobson",
          "catchPhrase": "Face to face bifurcated interface",
          "bs": "e-enable strategic applications"
        }
      },
      {
        "id": 4,
        "name": "Patricia Lebsack",
        "username": "Karianne",
        "email": "Julianne.OConner@kory.org",
        "address": {
          "street": "Hoeger Mall",
          "suite": "Apt. 692",
          "city": "South Elvis",
          "zipcode": "53919-4257",
          "geo": {"lat": "29.4572", "lng": "-164.2990"}
        },
        "phone": "493-170-9623 x156",
        "website": "kale.biz",
        "company": {
          "name": "Robel-Corkery",
          "catchPhrase": "Multi-tiered zero tolerance productivity",
          "bs": "transition cutting-edge web services"
        }
      },
      {
        "id": 5,
        "name": "Chelsey Dietrich",
        "username": "Kamren",
        "email": "Lucio_Hettinger@annie.ca",
        "address": {
          "street": "Skiles Walks",
          "suite": "Suite 351",
          "city": "Roscoeview",
          "zipcode": "33263",
          "geo": {"lat": "-31.8129", "lng": "62.5342"}
        },
        "phone": "(254)954-1289",
        "website": "demarco.info",
        "company": {
          "name": "Keebler LLC",
          "catchPhrase": "User-centric fault-tolerant solution",
          "bs": "revolutionize end-to-end systems"
        }
      },
      {
        "id": 6,
        "name": "Mrs. Dennis Schulist",
        "username": "Leopoldo_Corkery",
        "email": "Karley_Dach@jasper.info",
        "address": {
          "street": "Norberto Crossing",
          "suite": "Apt. 950",
          "city": "South Christy",
          "zipcode": "23505-1337",
          "geo": {"lat": "-71.4197", "lng": "71.7478"}
        },
        "phone": "1-477-935-8478 x6430",
        "website": "ola.org",
        "company": {
          "name": "Considine-Lockman",
          "catchPhrase": "Synchronised bottom-line interface",
          "bs": "e-enable innovative applications"
        }
      },
      {
        "id": 7,
        "name": "Kurtis Weissnat",
        "username": "Elwyn.Skiles",
        "email": "Telly.Hoeger@billy.biz",
        "address": {
          "street": "Rex Trail",
          "suite": "Suite 280",
          "city": "Howemouth",
          "zipcode": "58804-1099",
          "geo": {"lat": "24.8918", "lng": "21.8984"}
        },
        "phone": "210.067.6132",
        "website": "elvis.io",
        "company": {
          "name": "Johns Group",
          "catchPhrase": "Configurable multimedia task-force",
          "bs": "generate enterprise e-tailers"
        }
      },
      {
        "id": 8,
        "name": "Nicholas Runolfsdottir V",
        "username": "Maxime_Nienow",
        "email": "Sherwood@rosamond.me",
        "address": {
          "street": "Ellsworth Summit",
          "suite": "Suite 729",
          "city": "Aliyaview",
          "zipcode": "45169",
          "geo": {"lat": "-14.3990", "lng": "-120.7677"}
        },
        "phone": "586.493.6943 x140",
        "website": "jacynthe.com",
        "company": {
          "name": "Abernathy Group",
          "catchPhrase": "Implemented secondary concept",
          "bs": "e-enable extensible e-tailers"
        }
      },
      {
        "id": 9,
        "name": "Glenna Reichert",
        "username": "Delphine",
        "email": "Chaim_McDermott@dana.io",
        "address": {
          "street": "Dayna Park",
          "suite": "Suite 449",
          "city": "Bartholomebury",
          "zipcode": "76495-3109",
          "geo": {"lat": "24.6463", "lng": "-168.8889"}
        },
        "phone": "(775)976-6794 x41206",
        "website": "conrad.com",
        "company": {
          "name": "Yost and Sons",
          "catchPhrase": "Switchable contextually-based project",
          "bs": "aggregate real-time technologies"
        }
      },
      {
        "id": 10,
        "name": "Clementina DuBuque",
        "username": "Moriah.Stanton",
        "email": "Rey.Padberg@karina.biz",
        "address": {
          "street": "Kattie Turnpike",
          "suite": "Suite 198",
          "city": "Lebsackbury",
          "zipcode": "31428-2261",
          "geo": {"lat": "-38.2386", "lng": "57.2232"}
        },
        "phone": "024-648-3804",
        "website": "ambrose.net",
        "company": {
          "name": "Hoeger LLC",
          "catchPhrase": "Centralized empowering task-force",
          "bs": "target end-to-end models"
        }
      },
      {
        "id": 11,
        "name": "Roberto de Vitta",
        "username": "Moriah.Stanton",
        "email": "Rey.Padberg@karina.biz",
        "address": {
          "street": "Kattie Turnpike",
          "suite": "Suite 198",
          "city": "Lebsackbury",
          "zipcode": "31428-2261",
          "geo": {"lat": "-38.2386", "lng": "57.2232"}
        },
        "phone": "024-618-3877",
        "website": "ambrose.net",
        "company": {
          "name": "Hoeger LLC",
          "catchPhrase": "Centralized empowering task-force",
          "bs": "target end-to-end models"
        }
      },
      {
        "id": 12,
        "name": "Lucas Roman",
        "username": "Moriah.Stanton",
        "email": "Rey.Padberg@karina.biz",
        "address": {
          "street": "Kattie Turnpike",
          "suite": "Suite 198",
          "city": "Lebsackbury",
          "zipcode": "31428-2261",
          "geo": {"lat": "-38.2386", "lng": "57.2232"}
        },
        "phone": "024-578-1894",
        "website": "ambrose.net",
        "company": {
          "name": "Hoeger LLC",
          "catchPhrase": "Centralized empowering task-force",
          "bs": "target end-to-end models"
        }
      },
      {
        "id": 13,
        "name": "Andre Leal",
        "username": "Moriah.Stanton",
        "email": "Rey.Padberg@karina.biz",
        "address": {
          "street": "Kattie Turnpike",
          "suite": "Suite 198",
          "city": "Lebsackbury",
          "zipcode": "31428-2261",
          "geo": {"lat": "-38.2386", "lng": "57.2232"}
        },
        "phone": "024-048-6674",
        "website": "ambrose.net",
        "company": {
          "name": "Hoeger LLC",
          "catchPhrase": "Centralized empowering task-force",
          "bs": "target end-to-end models"
        }
      },
      {
        "id": 14,
        "name": "Cristiana Pereira",
        "username": "Moriah.Stanton",
        "email": "Rey.Padberg@karina.biz",
        "address": {
          "street": "Kattie Turnpike",
          "suite": "Suite 198",
          "city": "Lebsackbury",
          "zipcode": "31428-2261",
          "geo": {"lat": "-38.2386", "lng": "57.2232"}
        },
        "phone": "024-938-5523",
        "website": "ambrose.net",
        "company": {
          "name": "Hoeger LLC",
          "catchPhrase": "Centralized empowering task-force",
          "bs": "target end-to-end models"
        }
      },
      {
        "id": 15,
        "name": "Clementina DuBuque",
        "username": "Moriah.Stanton",
        "email": "Rey.Padberg@karina.biz",
        "address": {
          "street": "Kattie Turnpike",
          "suite": "Suite 198",
          "city": "Lebsackbury",
          "zipcode": "31428-2261",
          "geo": {"lat": "-38.2386", "lng": "57.2232"}
        },
        "phone": "024-983-9999",
        "website": "ambrose.net",
        "company": {
          "name": "Hoeger LLC",
          "catchPhrase": "Centralized empowering task-force",
          "bs": "target end-to-end models"
        }
      }
    ];
    var resposta = json.encode(response);
    final decode = jsonDecode(resposta);
    decode.forEach((item) => listUser.add(Users.fromJson(item)));
    return listUser;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
    oxi = getUsers(); 
    print(oxi.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Lista de Contatos",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.black,
            )
          ],
        ),
        body: Container(
            child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, left: 15),
              child: Text(
                "Contatos",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, right: 10, bottom: 10),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue,
                                backgroundImage: NetworkImage(
                                    "https://loremflickr.com/320/22$index"),
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => page(
                                          oux: oxi,
                                          index: index,
                                        )));
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        oxi[index].name.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        oxi[index].phone.toString(),
                                        style: TextStyle(
                                            fontSize: 13,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      );
                    }),
              ),
            )
          ],
        )));
  }
}
