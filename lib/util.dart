import 'package:my_app/static/color_theme_mode.dart';

import './pages/photo_view_page.dart';
import 'package:flutter/material.dart';
import './pages/post_details.dart';
import 'pages/account_details.dart';
import 'pages/reply_page.dart';

Padding postBuilderi(BuildContext context){
  
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
                                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ReplyPage();}));},
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

void addComment(){
  
}

Padding postBuilder(BuildContext context) {
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
                            GestureDetector(
                              onTap: (() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return PhotoViewPage(
                                      imagePath:
                                          'assets/images/accounts/elon_musk/posts/1.jpg');
                                }));
                              }),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/images/accounts/elon_musk/posts/1.jpg',
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
                                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ReplyPage();}));},
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



MaterialColor createMaterialColor(Color color) {
  List<Color> swatchColors = [color];
  for (int i = 1; i < 10; i++) {
    swatchColors
        .add(Color.fromRGBO(color.red, color.green, color.blue, i / 10));
  }
  return MaterialColor(color.value, <int, Color>{
    50: swatchColors[0],
    100: swatchColors[1],
    200: swatchColors[2],
    300: swatchColors[3],
    400: swatchColors[4],
    500: swatchColors[5],
    600: swatchColors[6],
    700: swatchColors[7],
    800: swatchColors[8],
    900: swatchColors[9],
  });
}

TextStyle blackText() {
  return const TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
}

TextStyle blackTextBig() {
  return const TextStyle(fontSize: 20, color: Colors.black);
}

TextStyle blackTextBigger() {
  return const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold);
}

TextStyle greySmall() {
  return const TextStyle(
    color: Color.fromARGB(255, 110, 110, 110),
  );
}

Container followButton() {
  return Container(
    decoration: BoxDecoration(
      color: createMaterialColor(Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
    width: 80,
    height: 30,
    child: TextButton(onPressed: () {}, child: const Text('Follow')),
  );
}

Icon verifiedIcon(double rad) {
  return Icon(
    Icons.verified,
    size: rad,
    color: Colors.blue,
  );
}

BoxDecoration blackBox() {
  return BoxDecoration(
    color: createMaterialColor(Colors.black),
    borderRadius: BorderRadius.circular(20),
  );
}

EdgeInsets pad() {
  return EdgeInsets.all(14.0);
}

Divider line() {
  return const Divider(
    color: Color.fromARGB(255, 82, 82, 82),
    thickness: .2,
    indent: 16.0,
    endIndent: 16.0,
  );
}

MaterialColor globalColor() {
  return ColorThemeMode.theme == 'white'
      ? createMaterialColor(Colors.white)
      : createMaterialColor(Colors.black);
}

CustomScrollView appBarBuilder(Widget leftMostItem, Widget centeredItem, List<Widget> widgets) {
  return CustomScrollView(
    slivers: <Widget>[
      SliverAppBar(
        title: 
        Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Left and right items are at the edges
    mainAxisSize: MainAxisSize.max, // Allow Row to take maximum available width
    children: [
      leftMostItem,
      Container(
        height: kToolbarHeight * 0.7,
        child: centeredItem,
      ),
      SizedBox(width: 10), // Add spacing if needed
    ],
  ),
),
        // Center(
        //   child: 
        //   Row(
        //     children: [
        //     leftMostItem
        //     ,
        //     Container(
        //       height: kToolbarHeight * 0.7,
        //       child: centeredItem,
        //     ),
        //   ],)
        // ),


        floating: true,
        snap: true,
      ),
      SliverList(
        delegate: SliverChildListDelegate(widgets),
      ),
    ],
  );
}

void toAccount(){
  
}

Color white_to_black(){
  return ColorThemeMode.theme == 'white' ? Colors.white : Color.fromARGB(255, 0, 0, 0);
}

Color black_to_white(){
  return ColorThemeMode.theme == 'white' ?  Color.fromARGB(255, 0, 0, 0) : Colors.white;
}


