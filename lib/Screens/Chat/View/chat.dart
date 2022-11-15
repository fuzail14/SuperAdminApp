import 'package:flutter/material.dart';
import '../../../Constants/constants.dart';
import '../Model/chat_model.dart';
class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  TextEditingController messageController = TextEditingController();
  List<ChatModel> messages = [
    ChatModel(messageContent: "Hello, Will", messageType: "receiver"),
    ChatModel(messageContent: "How have you been?", messageType: "receiver"),
    ChatModel(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatModel(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatModel(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatModel(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatModel(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatModel(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatModel(messageContent: "How have you been?", messageType: "receiver"),
    ChatModel(messageContent: "How have you been?", messageType: "receiver"),
    ChatModel(messageContent: "How have you?", messageType: "receiver"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor:primaryColor,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("images/logo.png"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                       "Suleman",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ),

                    ],
                  ),
                ),
                GestureDetector(onTap: () {}, child: Icon(Icons.call,color: Colors.white,))
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 55),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                  EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType == "receiver"
                            ? Colors.black54
                            : primaryColor),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        messages[index].messageContent!,
                        style: TextStyle(fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {

                        messages.add(   ChatModel(
                            messageContent: messageController.text, messageType: "sender"),);
                        messages.add(   ChatModel(
                            messageContent: messageController.text, messageType: "receiver"),);
if(messageController.text==" ")
  {
    print(" empty chat");

  }



                      });


                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: primaryColor,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
