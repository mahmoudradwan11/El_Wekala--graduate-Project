import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as IO;
//Messagemodel model;
class SocketService {
  late IO.Socket socket;
  Future<void> initSocket() async {
    socket = IO.io('http://localhost:5000',<String, dynamic>{ // حط اللينك
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.onConnect((_) {
      // لما يعمل /connect علي ال socket
      print('connected to server');
    });
    socket.on(
      'case_details', // اسم ال events
          (data){
        print(data);
        //model  = Masseage.fromjson(data);
          // بستقبل الرسايل
          },
    );
    socket.connect();
  }
  void sendToSocket({
    required String event,
    dynamic message,
  }){
    socket.emit(event, message);
  }

  void dispose(){
    socket.disconnect();
    socket.dispose();
  }
}