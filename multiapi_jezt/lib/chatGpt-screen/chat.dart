import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String apikey = 'Your Apikey';

class ChatGPTScreen extends StatefulWidget {
  const ChatGPTScreen({super.key});

  @override
  State<ChatGPTScreen> createState() => _ChatGPTScreenState();
}

class _ChatGPTScreenState extends State<ChatGPTScreen> {
  TextEditingController messageController = TextEditingController();
  List<ChatMessage> chatMessage = [];

  void sendMessage(String message) async {
    final response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apikey',
        },
        body: json.encode({
          'prompt': message,
          'max_tokens': 50,
        }));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        chatMessage.add(ChatMessage(text: message, isUser: true));
        chatMessage.add(ChatMessage(
            text: jsonResponse['choices'][0]['text'], isUser: false));
      });
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Request failed with status code: ${response.statusCode}'),
        ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat GPT"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: chatMessage.length,
                  itemBuilder: (context, index) {
                    final message = chatMessage[index];
                    return ChatBubble(
                        text: message.text, isUser: message.isUser);
                  })),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: "Enter your message",
                  ),
                )),
                IconButton(onPressed: (){
                  sendMessage(messageController.text);
                  messageController.clear();
                }, icon: Icon(Icons.send)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  const ChatBubble({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("AI"),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isUser ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
          if (isUser)
            CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person),
            )
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}
