import 'package:flutter/material.dart';
import 'package:multiapi_jetz/chatGpt-screen/chat.dart';

class ChatGptWidgetCard extends StatelessWidget {
  const ChatGptWidgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkResponse(
        onTap: (){
          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ChatGPTScreen()),
                          );
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 24, 82, 54)
          ),
          height: 90,
          width: double.infinity,
         
          child: Center(child: Text("ChatGpt",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),)),
        ),
      ),
    );
  }
}