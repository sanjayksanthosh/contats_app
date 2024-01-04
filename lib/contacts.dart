import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'chatroom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String Name = '';

  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          width: 500,
          height: 500,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.network(
                  width: 100,
                  'https://mailmeteor.com/logos/assets/PNG/Google_Chat_Logo_512px.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  'Chat Room'),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text != '') {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ChatRoom(
                            name:nameController.text
                          );
                        },
                      ));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: new Text("Alert!!"),
                            content: new Text("please enter your name"),
                            actions: <Widget>[
                              new ElevatedButton(
                                child: new Text("OK",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    'Enter',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
