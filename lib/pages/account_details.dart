import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:my_app/util.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MySliverAppBar(expandedHeight: 120),
            pinned: true,
            floating: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/accounts/elon_musk/profile_picture/1.jpg'),
                                    radius: 30),
                                Expanded(child: SizedBox()),
                                followButton()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Elon Musk",
                                style: blackTextBigger(),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: verifiedIcon(20)),
                            ],
                          ),
                          Text(
                            "@elonmusk",
                            style: greySmall(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6, bottom: 6),
                            child: Text('Blades of Glory'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6, bottom: 6),
                            child: Row(
                              children: [
                                Icon(Icons.location_on),
                                Text('Here'),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(Icons.calendar_month),
                                Text('Joined 12 Sep 2004')
                              ],
                            ),
                          ),
                           Row(children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '410 ',
                                      style: blackText()
                                    ),
                                    TextSpan(
                                      text: 'Following    ',
                                      style: greySmall(),
                                    ),
                                     TextSpan(
                                      text: '153M ',
                                      style: blackText()
                                    ),      
                                    TextSpan(
                                      text: 'Followers',
                                      style: greySmall()
                                    )                            
                                  ],
                                ),
                              ),
                            ]),
                        ],
                      ),
                    ),
                    
                  ],
                ),
                Container(
                  height: 1000,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 6),
                    child: DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: TabBar(
                                  tabs: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, bottom: 4),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Icons.portrait_sharp),
                                          )
                                          ,
                                          Text('Posts',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Chirp',
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 4, top: 4),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Icons.reply_all_rounded),
                                          )
                                          ,
                                          Text('Reply',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Chirp',
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                  indicator: BoxDecoration(
                                    // Add this line
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors
                                            .blue, // Set the color of the indicator
                                        width:
                                            2.0, // Set the width of the indicator
                                      ),
                                    ),
                                  ),
                                )),
                           
                            Expanded(
                                child: TabBarView(
                              children: [
                                Column(
                                  children: [postBuilder(context)],
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      postBuilderi(context),
                                      postBuilderi(context),
                                      postBuilderi(context),
                                      postBuilderi(context),
                                      ],
                                  ),
                                )
                              ],
                            ))
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/accounts/elon_musk/banner/1.jpg',
          fit: BoxFit.cover,
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
