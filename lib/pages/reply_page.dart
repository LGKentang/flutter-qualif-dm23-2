import 'package:flutter/material.dart';
import 'package:my_app/util.dart';


class ReplyPage extends StatelessWidget {
  const ReplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFilled = false;
    TextEditingController replyDesc = TextEditingController();


   void onReply() {
  if (replyDesc.text.isEmpty) {
    final snackBar = SnackBar(
      content: Text('Reply cannot be empty'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    
  }
  else{
        addComment();
        Navigator.pop(context);
  }
}


    

    return Scaffold(
      appBar: AppBar(
        
        elevation: 0.4,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color:
                        createMaterialColor(Color.fromARGB(255, 31, 173, 255)),
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: TextButton(
                    onPressed: onReply,
                    child: Text("Reply"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Replying to ',
                        style: greySmall(),
                      ),
                      TextSpan(
                        text: '@elonmusk ',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ), // Add spacing between rich text and avatar+text form field
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/accounts/elon_musk/profile_picture/1.jpg'),
                ),
                SizedBox(width: 10), // Add some spacing between avatar and text form field
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: TextFormField(
                      controller: replyDesc,
                      maxLines: null,
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Post your reply',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

