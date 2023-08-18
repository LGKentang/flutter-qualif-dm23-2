import 'package:flutter/material.dart';
import 'package:my_app/pages/account_details.dart';
import '../util.dart';
import 'photo_view_page.dart';
import 'reply_page.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  List<Widget> allComments = [
                postBuilderi(context),
              postBuilderi(context),
              postBuilderi(context),
  ];


    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AccountDetails();
                        }));
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/accounts/elon_musk/profile_picture/1.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Elon Musk",
                                style: blackText(),
                              ),
                              const SizedBox(width: 5),
                              verifiedIcon(14)
                            ],
                          ),
                          Text("@elonmusk", style: greySmall()),
                        ],
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    followButton()
                  ],
                ),
              ),
              Padding(
                padding: pad(),
                child: Text(
                  "Rockets!",
                  style: blackTextBig(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                ),
                child: GestureDetector(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PhotoViewPage(
                          imagePath:
                              'assets/images/accounts/elon_musk/posts/1.jpg');
                    }));
                  }),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/accounts/elon_musk/posts/1.jpg',
                        width: MediaQuery.of(context).size.width * .9,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 14, 4),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '11:40 PM • 11 Aug 23 • ',
                        style: greySmall(),
                      ),
                      TextSpan(
                        text: '9.2M',
                        style: blackText(),
                      ),
                      TextSpan(
                        text: ' Views',
                        style: greySmall(),
                      ),
                    ],
                  ),
                ),
              ),
              line(),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 4, 14, 4),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '26.5k ',
                        style: blackText(),
                      ),
                      TextSpan(
                        text: 'Reposts   ',
                        style: greySmall(),
                      ),
                      TextSpan(
                        text: '2,092 ',
                        style: blackText(),
                      ),
                      TextSpan(
                        text: 'Quotes   ',
                        style: greySmall(),
                      ),
                      TextSpan(
                        text: '156k  ',
                        style: blackText(),
                      ),
                      TextSpan(
                        text: 'Likes   ',
                        style: greySmall(),
                      ),
                    ],
                  ),
                ),
              ),
              line(),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 4, 14, 4),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '3,500 ',
                        style: blackText(),
                      ),
                      TextSpan(
                        text: 'Bookmarks   ',
                        style: greySmall(),
                      ),
                    ],
                  ),
                ),
              ),
              line(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReplyPage()));
                    },
                    icon: Icon(
                      Icons.mode_comment_outlined,
                      color: Color.fromARGB(255, 82, 82, 82),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.loop),
                    color: Color.fromARGB(255, 82, 82, 82),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_outlined),
                    color: Color.fromARGB(255, 82, 82, 82),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border),
                    color: Color.fromARGB(255, 82, 82, 82),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share_outlined),
                    color: Color.fromARGB(255, 82, 82, 82),
                  ),
                ],
              ),
              line(),
              Column(children: allComments,)
              ,
              Row(
                children: [],
              )
            ]),
      ),
    );
  }
}
