import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';



class ChatProvider extends ChangeNotifier {


//creacion de instancias
final ScrollController chatScrollController = ScrollController();
final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

List<Message> messageList = [
  Message(text: 'Hola amor!', fromWho: FromWho.me),
  Message(text: 'Vamos?', fromWho: FromWho.me),
  Message(text: 'Vamos?', fromWho: FromWho.hers),
];

Future<void> sendMessage(String text) async {
  //TODO: Send message to the server
  if (text.isEmpty) return;
  final newMessages = Message(text: text, fromWho: FromWho.me);
  messageList.add(newMessages);
  
  if (text.endsWith('?')) {
     herReply();
  }


  notifyListeners();
  moveScrollToBottom();
}

Future<void> herReply() async {
final herMessage = await getYesNoAnswer.getAnswer();
messageList.add(herMessage);
  notifyListeners();
}

//metodo de chatScrollController
void moveScrollToBottom() async {
  await Future.delayed(const Duration(milliseconds: 100));
  chatScrollController.animateTo(
    chatScrollController.position.maxScrollExtent,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}
}