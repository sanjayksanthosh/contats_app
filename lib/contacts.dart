
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String Name ='';

  TextEditingController nameController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(width: 500,height: 500,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Image.network(
                  width: 100,
                  'https://mailmeteor.com/logos/assets/PNG/Google_Chat_Logo_512px.png'),
              SizedBox(height: 10,),
              Text(
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  'Chat Room'),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                   addData();
                  },
                  child: Text('Enter'),
                  style: ButtonStyle(),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
  addData() async {
    Name=nameController.text;
    await FirebaseFirestore.instance
        .collection("messages")
        .add({"Name": Name,});
  }
}
