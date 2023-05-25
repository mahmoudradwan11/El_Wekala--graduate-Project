import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/core/network/constants.dart';
import 'package:el_wekala/modules/widgets/builders/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
class ChatScreen extends StatelessWidget {
  // UserData? userModel;
  var textController = TextEditingController();

  ChatScreen({Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          ElWekalaCubit.get(context).getMessages();
          return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = ElWekalaCubit.get(context);
              var messages = cubit.messagesModel!.messages;
              return Scaffold(
                backgroundColor: Colors.grey[400],
                appBar: AppBar(
                  titleSpacing: 0.0,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('images/setting_icon.svg')),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children:const [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.7O-gEH4p86LWGZNOnddO2AHaHa?pid=ImgDet&rs=1'),
                        ),
                         SizedBox(
                          width: 15.0,
                        ),
                        Text('Elwekala Community',style: TextStyle(fontSize: 18),),
                      ],
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children:[
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (nationalId ==
                                messages[index].senderNationalId) {
                              return builtMyMessage(messages[index], context);
                            }
                            return builtMessage(messages[index], context);
                          },
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            height: 15.0,
                          ),
                          itemCount: messages!.length,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: TextFormField(
                                  controller: textController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Type Something ... ',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:5,top: 5,bottom: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: HexColor('#07094D'),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                height: 40.0,
                                width: 40,
                                child: MaterialButton(
                                  onPressed: () {
                                    cubit.sendMessage(textController.text);
                                  },
                                  minWidth: 1.0,
                                  child:const Icon(Icons.send,color: Colors.white,size: 16,)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
    );
  }
}
