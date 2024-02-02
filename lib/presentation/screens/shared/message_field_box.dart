import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox ({super.key, required this.onValue});
  

  @override
  Widget build(BuildContext context) {
    
    final textController= TextEditingController();
    final  focusNode = FocusNode();


    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
      borderRadius: BorderRadius.circular(20.0),
    );

    final inputDecoration = InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        hintText: 'Escribe un mensaje que termine con "?"',
        
        suffixIcon:  IconButton(
          icon: const Icon(Icons.send_outlined ),
          onPressed:() {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
            focusNode.requestFocus();
          },
        ),
        
      );

    return TextFormField(
      //moficar el teclado
      //keyboardType: TextInputType.url,
      onTapOutside: (event) { focusNode.unfocus(); },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
        

      },
      
    );
  }
}