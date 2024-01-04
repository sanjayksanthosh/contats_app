import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  String? name;
   ChatRoom({Key? key ,this.name}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
   String? messages;
  TextEditingController messageController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('messages').snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              }
              else{
                List<DocumentSnapshot> documents =snapshot.data!.docs;
                return ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.green,borderRadius:BorderRadius.circular(16)),
                      child: Text(widget.name.toString(),style:TextStyle(color: Colors.white)),
                    ),
                  );
                },);
              }

            },),
      ),
   bottomNavigationBar: BottomAppBar(
     child: Row(
       children: [
         TextField(controller: messageController),
         InkWell(onTap: () {
           addData();
         },
           child: Container(
             child: Icon(Icons.send),
           ),
         )
       ],
     ),
   ), );
  }
  addData() async{
    setState(() {
      String messages=messageController.text.toString();
    });
    var timeStamp=DateTime.timestamp();
   await FirebaseFirestore.instance.collection('messages').add({
      "Name":widget.name,
      "TimeStamp":timeStamp,
      "Message":messages
    });
  }
}
