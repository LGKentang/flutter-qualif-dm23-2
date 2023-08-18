
import 'package:flutter/material.dart';
import 'package:my_app/static/current_user.dart';
import '../util.dart';
import '../static/color_theme_mode.dart';
import 'account_details.dart';
import 'login_page.dart';
import 'profile_overlay.dart';
import 'home_page.dart';
import 'mail_page.dart';
import 'notification_page.dart';
import 'search_page.dart';
import 'dart:async';


class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  bool isSlidingContainerVisible = false;
  double slidingContainerOffset = -350;
  ScrollController scrollController = ScrollController();
  Timer? slideBackTimer;

  final List<Widget> allPages = [
    const HomePage(),
    const SearchPage(),
    const NotificationPage(),
    const MailPage(),
  ];

  void startSlideBackTimer() {
    slideBackTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        slidingContainerOffset = -350;
        isSlidingContainerVisible = false;
        slideBackTimer = null;
      });
    });
  }

  @override
  void dispose() {
    slideBackTimer?.cancel();
    super.dispose();
  }
  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: createMaterialColor(white_to_black()),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (isSlidingContainerVisible) return;
                if (details.primaryDelta! > 0) {
                  setState(() {
                    slidingContainerOffset = 0;
                    isSlidingContainerVisible = true;
                  });
                }
              },
              child: appBarBuilder(
                  IconButton(
                icon: Icon(Icons.account_circle_outlined),
                iconSize: 32,
                onPressed: () {
                  setState(() {
                    if (slidingContainerOffset == 0) {
                      slidingContainerOffset = -350;
                      isSlidingContainerVisible = false;
                    } else {
                      slidingContainerOffset = 0;
                      isSlidingContainerVisible = true;
                    }
                  });
                },
               ),
                      Image(
                image: AssetImage(
                  ColorThemeMode.theme == 'white' ?
                  'assets/images/X.png' : 'assets/images/X_w.png' 
                  ),
                fit: BoxFit.fitHeight,
      ),
      [
        allPages[selectedPage],
      ]),
            ),

            if (isSlidingContainerVisible)
              GestureDetector(
                onTap: () {
                  setState(() {
                    slidingContainerOffset = -350;
                    isSlidingContainerVisible = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),


            AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              left: slidingContainerOffset,
              top: 0,
              bottom: 0,
              width: 350,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    slidingContainerOffset =
                        (details.localPosition.dx - 350).clamp(-350, 0);
                    slideBackTimer?.cancel();
                    startSlideBackTimer();
                  });
                },
                onHorizontalDragEnd: (details) {
                  setState(() {
                    if (details.velocity.pixelsPerSecond.dx < 0) {
                      slidingContainerOffset = -350;
                      isSlidingContainerVisible = false;
                    } else {
                      slidingContainerOffset = 0;
                      isSlidingContainerVisible = true;
                      startSlideBackTimer();
                    }
                  });
                },
                child:

                Container(
                  color: white_to_black(),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      SizedBox(height: 30,),

                     Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              GestureDetector(
                                onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AccountDetails();}));},
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/accounts/bill_gates/profile_picture/1.jpg'),
                                  radius: 30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                "${CurrentUser.username}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: black_to_white()
                                ),
                      ),
                              ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                        child: Text(
                        "@${CurrentUser.username}",
                        style: TextStyle(
                                color: Colors.grey,
                        ),
                    ),
                      ),
                    Row(children: [
                       Text('1 ',style: TextStyle(color: black_to_white()),),
                      const Text(
                              'Following',
                              style: TextStyle(color: Color.fromARGB(255, 133, 133, 133),fontFamily: 'Chirp'),
                      ),
                      SizedBox(width: 10,),
                      Text('0 ',style: TextStyle(color: black_to_white()),),
                       const Text(
                              'Followers',
                              style: TextStyle(color: Color.fromARGB(255, 133, 133, 133),fontFamily: 'Chirp'),
                      ),
                    ],)    
                              ],),
                            ),

                          Expanded(child: SizedBox()),
       
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [

                                    IconButton(
                              onPressed: (){
                                setState(() {
                                  String temp = ColorThemeMode.theme!;
                                  ColorThemeMode.theme = temp == 'white' ? 'black' : 'white';
                                });
                              },
                              icon: Icon(
                                ColorThemeMode.theme == 'white' ? 
                                Icons.light_mode_outlined : Icons.dark_mode_outlined,
                                color: black_to_white(),)),
                                   SizedBox(height: 100,)
                                       
                                
                              ],
                            ),
                          )
  
                        
                    

                          ],
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Divider(
                            color: Colors.grey,  // You can customize the color of the divider
                            thickness: .2,      // You can customize the thickness of the divider
                            indent: 16.0,        // You can customize the starting indent of the divider
                            endIndent: 16.0,     // You can customize the ending indent of the divider
                        ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                            child: Column(
                              children: [
                              rowIconBuilder(Icons.manage_accounts_outlined, "Profile"),
                              rowIconBuilder(Icons.verified_outlined, "Blue"),
                              rowIconBuilder(Icons.bookmark_border_outlined, "Bookmarks"), 
                              rowIconBuilder(Icons.list_alt_sharp, "Lists"),
                              rowIconBuilder(Icons.group_work_outlined, "Spaces"),
                              ],
                            ),
                          ),
                            Divider(
                            color: Colors.grey,  // You can customize the color of the divider
                            thickness: .2,      // You can customize the thickness of the divider
                            indent: 16.0,        // You can customize the starting indent of the divider
                            endIndent: 16.0,     // You can customize the ending indent of the divider
                        ),
                      
                        IconButton(onPressed: (){
                          CurrentUser.username = null;
                             Navigator.pop(context);
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }),
                              (route)=>false); 
                        }, icon: Icon(Icons.logout,color: black_to_white(),))
                        
                        ],

                      ),
                    ),






                  ],)
                ),      
              ),
            ),
          ],
        ),


        bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Mail',
            ),
          ],
          currentIndex: selectedPage,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
        ),
      ),
    );
  }
}
 
Padding rowIconBuilder(IconData i, String text){
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
    child: Row(children: [
      IconButton(onPressed: (){}, icon:Icon(i,color: black_to_white(),)),
      SizedBox(width: 20,),
      Text(
       text, 
       style:TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: black_to_white()
       ),),
    ],),
  );
}

