import 'package:flutter/material.dart';
import 'package:my_app/models/account_model.dart';
import 'package:my_app/pages/account_details.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/pages/post_details.dart';
import 'package:my_app/static/accounts_database.dart';
import 'package:my_app/static/current_user.dart';
import '../main.dart';
import '../util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:photo_view/photo_view.dart';

import 'photo_view_page.dart';
import 'reply_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isZoomed = false;

  void toggleZoom() {
    setState(() {
      isZoomed = !isZoomed;
    });
  }

  // final List<String> imgUrls = [
  //   'assets/images/accounts/elon_musk/profile_picture/1.jpg',
  //   'assets/images/accounts/bill_gates/profile_picture/1.jpg',
  //   'assets/images/accounts/netflix/profile_picture/1.jpg'
  // ];

    final List<AccountModel> accounts = AccountsDatabase.allAccounts;

  
@override
Widget build(BuildContext context) {

  return  Column(
    children: [
            // postGestureActivationi(),
            postGestureActivation("Elon Musk","Rockets!","2h",['5k','3k','10k','6k'],'assets/images/accounts/elon_musk/profile_picture/1.jpg','assets/images/accounts/elon_musk/posts/1.jpg'),
            followRecommendation(),
            // postGestureActivationi(),
            postGestureActivation("Paper Rex","There is something going to happen","1d",['12k','3k','8k','6k'],'assets/images/accounts/paper_rex/profile_picture/1.jpg','assets/images/accounts/paper_rex/posts/1.jpg'),  
            postGestureActivation("Bill Gates","Celebrating the year together","4d",['7k','8k','5k','1k'],'assets/images/accounts/bill_gates/profile_picture/1.jpg','assets/images/accounts/bill_gates/posts/3.jpg'),  
            postGestureActivation("Paper Rex","Me when: when i: when: ","1d",['12k','3k','8k','6k'],'assets/images/accounts/paper_rex/profile_picture/1.jpg','assets/images/accounts/paper_rex/posts/2.jpg'),  
            postGestureActivation("Bill Gates","Conference","4d",['7k','8k','5k','1k'],'assets/images/accounts/bill_gates/profile_picture/1.jpg','assets/images/accounts/bill_gates/posts/1.jpg'),

    ],);
    
  
}


  Column followRecommendation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
          child: Text(
            "Who to follow",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Chirp', fontSize: 16),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: accounts.length,
            itemBuilder: (BuildContext context, int index) {
              AccountModel account = accounts[index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.4,
                margin:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color.fromARGB(255, 236, 236, 236), width: .9)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(account.profilePicture),
                      radius: 30,
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            account.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.verified,
                            size: 18,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
                        child: Text(
                          "@${account.name}",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: black_to_white(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 80,
                      height: 30,
                      child:
                        TextButton(
                          onPressed: () {},
                          child: const Text('Follow')
                        ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
          child: Text(
            "Show more",
            style: TextStyle(fontFamily: 'Chirp', color: Colors.blue),
          ),
        ),
      ],
    );
  }

  GestureDetector postGestureActivation(String name, String description, String postedDuration, List<String> data, String profilePicPath , String postPath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PostDetails();
        }));
      },
      child: postBuilder(name, description, postedDuration, data, profilePicPath , postPath),
    );
  }

  Padding postBuilder(String name, String description, String postedDuration, List<String> data, String profilePicPath , String postPath) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return PostDetails();
            }),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: createMaterialColor(const Color.fromRGBO(0, 0, 0, .3)),
              width: .2,
            ),
          ),
          child: Container(
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AccountDetails();}));
                        // Ini pergi ke account detail !!
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          profilePicPath,
                        ),
                      ),
                    ),
                    title: Text(
                      name,
                      style: blackText(),
                    ),
                    subtitle: Text('@$name • $postedDuration'),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 70),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Padding(
                              padding: EdgeInsets.zero,
                              child: Text(
                                description,
                                style: TextStyle(fontSize: 16.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),

                            GestureDetector(
                              onTap: (() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return PhotoViewPage(
                                      imagePath:
                                          postPath);
                                }));
                              }),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    postPath,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      
                                      icon: Icon(Icons.mode_comment_outlined),
                                      iconSize: 18,
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                   return ReplyPage();
                                }));




                                      },
                                    ),
                                    Text(
                                      data[0], 
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                // SizedBox(width: 16),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.loop),
                                      iconSize: 18,
                                      onPressed: () {},
                                    ),
                                    Text(
                                      data[1], // Replace with the actual number
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                // SizedBox(width: 16),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      iconSize: 18,
                                      onPressed: () {},
                                    ),
                                    Text(
                                     data[2], // Replace with the actual number
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                // SizedBox(width: 16),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.query_stats_rounded),
                                      iconSize: 18,
                                      onPressed: () {},
                                    ),
                                    Text(
                                     data[3], // Replace with the actual number
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                // SizedBox(width: 16),
                                IconButton(
                                  icon: Icon(Icons.share),
                                  iconSize: 18,
                                  onPressed: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   GestureDetector postGestureActivationi() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PostDetails();
        }));
      },
      child: postBuilderi(),
    );
  }

  Padding postBuilderi() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return PostDetails();
            }),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: createMaterialColor(const Color.fromRGBO(0, 0, 0, .3)),
              width: .2,
            ),
          ),
          child: Container(
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AccountDetails();}));
                        // Ini pergi ke account detail !!
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/accounts/elon_musk/profile_picture/1.jpg',
                        ),
                      ),
                    ),
                    title: Text(
                      'Elon Musk',
                      style: blackText(),
                    ),
                    subtitle: Text('@elonmusk • 2h'),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 70),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.zero,
                              child: Text(
                                'Rockets!',
                                style: TextStyle(fontSize: 16.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),

                            
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.mode_comment_outlined),
                                      iconSize: 18,
                                      onPressed: () {

         
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                   return ReplyPage();
                                }));



                                      },
                                    ),
                                    Text(
                                      "5", 
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                // SizedBox(width: 16),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.loop),
                                      iconSize: 18,
                                      onPressed: () {},
                                    ),
                                    Text(
                                      "3", // Replace with the actual number
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                // SizedBox(width: 16),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      iconSize: 18,
                                      onPressed: () {},
                                    ),
                                    Text(
                                      "10", // Replace with the actual number
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                // SizedBox(width: 16),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.query_stats_rounded),
                                      iconSize: 18,
                                      onPressed: () {},
                                    ),
                                    Text(
                                      "7", // Replace with the actual number
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                // SizedBox(width: 16),
                                IconButton(
                                  icon: Icon(Icons.share),
                                  iconSize: 18,
                                  onPressed: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}


