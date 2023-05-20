import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/network/constants.dart';

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
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(cubit.profileModel!.user!
                            .profileImage!),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Text('El Wekala'),
                    ],
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
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
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
                                    hintText: 'type your message ... ',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50.0,
                              color: HexColor('#07094D'),
                              child: MaterialButton(
                                onPressed: () {
                                  cubit.sendMessage(textController.text);
                                },
                                minWidth: 1.0,
                                child: const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 16.0,
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
