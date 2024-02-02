import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/shared/message_field_box.dart';
import 'package:yes_no_app/presentation/screens/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: 
            //NetworkImage('https://images.crunchbase.com/image/upload/c_pad,h_256,w_256,f_auto,q_auto:eco,dpr_1/qq2ofxh8q7yvfgk9iixo'),
            //add image from assets
            AssetImage('lib/assets/images/ja.webp'),
          ),
        ),
        centerTitle: false,
        title: const Text('Jenni', style: TextStyle(color: Colors.white)),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final chatProvider =  context.watch<ChatProvider>();


    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    //sirve para limitar la lista
                    itemCount: chatProvider.messageList.length, 
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message,)
                          : MyMessageBubble(message: message,);
                      
                    })),
            //Caja de Texto de mensajes
             MessageFieldBox(
              onValue: (value) {
                chatProvider.sendMessage(value);
              },
             ),
          ],
        ),
      ),
    );
  }
}
