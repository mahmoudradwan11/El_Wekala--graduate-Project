import 'package:el_wekala/core/socket.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  SocketService mySocket = SocketService();
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    mySocket.initSocket();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body:
      MaterialButton(onPressed:(){
     //   mySocket.sendToSocket(event:event,message: 'my message');
      },child:Text('Send'),),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    mySocket.dispose();
    super.dispose();
  }
}
