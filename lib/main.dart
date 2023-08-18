import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/pages/account_details.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/pages/main_page.dart';
import 'package:my_app/pages/reply_page.dart';
import 'package:my_app/static/accounts_database.dart';
import 'models/account_model.dart';
import 'models/post_model.dart';
import 'pages/home_page.dart';
import 'pages/post_details.dart';
import 'util.dart';
import './static/color_theme_mode.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main () async{
  ColorThemeMode.theme = 'white';
  List<AccountModel> accountList = await readJson();
  AccountsDatabase.allAccounts = accountList;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Colors.white)
      
      ),
      

      // Shortcuts
      home: LoginPage(),
      // home: MainPage(),
      // home: PostDetails(),
      // home: ReplyPage()
      // home: HomePage()
      // home: AccountDetails()
      
    );
  }
}

Future<List<AccountModel>> readJson() async {
  try {
      const String response = '''
[
    {
      "name": "Elon Musk",
      "nickname" : "elonmusk",
      "followers": ["Bill Gates", "Netflix", "Paper Rex"],
      "following": ["Bill Gates", "Paper Rex"],
      "description": "CEO of SpaceX and Tesla, Inc.",
      "location": "Los Angeles, CA",
      "joinedAt": "2020-01-15T10:00:00Z",
      "profilePicture": "assets/images/accounts/elon_musk/profile_picture/1.jpg",
      "bannerPicture": "assets/images/accounts/elon_musk/banner/1.jpg",
      "verified": true
    },
    {
      "name": "Bill Gates",
      "nickname" : "BillGates",
      "followers": ["Netflix", "Paper Rex"],
      "following": ["Elon Musk", "Netflix"],
      "description": "Co-chair of the Bill & Melinda Gates Foundation",
      "location": "Seattle, WA",
      "joinedAt": "2015-06-20T08:30:00Z",
      "profilePicture": "assets/images/accounts/bill_gates/profile_picture/1.jpg",
      "bannerPicture": "assets/images/accounts/bill_gates/banner/1.jpg",
      "verified": true
    },
    {
      "name": "Netflix",
      "nickname" : "netflix",
      "followers": ["Elon Musk", "Paper Rex"],
      "following": ["Elon Musk", "Bill Gates"],
      "description": "World's leading streaming entertainment service",
      "location": "California, CA",
      "joinedAt": "2012-03-10T14:15:00Z",
      "profilePicture": "assets/images/accounts/netflix/profile_picture/1.jpg",
      "bannerPicture": "assets/images/accounts/netflix/banner/1.jpg",
      "verified": false
    },
    {
      "name": "Paper Rex",
      "nickname" : "pprxteam",
      "followers": ["Elon Musk", "Bill Gates"],
      "following": ["Elon Musk", "Netflix", "Bill Gates"],
      "description": "VALORANT - VCTPACIFIC 2023 Champions - WGAMING",
      "location": "Singapore",
      "joinedAt": "2018-09-05T11:45:00Z",
      "profilePicture": "assets/images/accounts/paper_rex/profile_picture/1.jpg",
      "bannerPicture": "assets/images/accounts/paper_rex/banner/1.jpg",
      "verified": true
    }
  ]
  ''';
    final List<dynamic> jsonData = json.decode(response);

      final List<AccountModel> accountModels = jsonData.map<AccountModel>((accountData) {
      return AccountModel.fromJson(accountData);
    }).toList();

    return accountModels;
  } catch (e) {
    return [];
  }
}


// Future<List<PostModel>> readJsonPost() async {
//   try {
//       final String response = '''
// [
//     {
//       "name": "Elon Musk",
//       "nickname" : "elonmusk",
//       "followers": ["Bill Gates", "Netflix", "Paper Rex"],
//       "following": ["Bill Gates", "Paper Rex"],
//       "description": "CEO of SpaceX and Tesla, Inc.",
//       "location": "Los Angeles, CA",
//       "joinedAt": "2020-01-15T10:00:00Z",
//       "profilePicture": "assets/images/accounts/elon_musk/profile_picture/1.jpg",
//       "bannerPicture": "assets/images/accounts/elon_musk/banner/1.jpg",
//       "verified": true
//     },
//     {
//       "name": "Bill Gates",
//       "nickname" : "BillGates",
//       "followers": ["Netflix", "Paper Rex"],
//       "following": ["Elon Musk", "Netflix"],
//       "description": "Co-chair of the Bill & Melinda Gates Foundation",
//       "location": "Seattle, WA",
//       "joinedAt": "2015-06-20T08:30:00Z",
//       "profilePicture": "assets/images/accounts/bill_gates/profile_picture/1.jpg",
//       "bannerPicture": "assets/images/accounts/bill_gates/banner/1.jpg",
//       "verified": true
//     },
//     {
//       "name": "Netflix",
//       "nickname" : "netflix",
//       "followers": ["Elon Musk", "Paper Rex"],
//       "following": ["Elon Musk", "Bill Gates"],
//       "description": "World's leading streaming entertainment service",
//       "location": "California, CA",
//       "joinedAt": "2012-03-10T14:15:00Z",
//       "profilePicture": "assets/images/accounts/netflix/profile_picture/1.jpg",
//       "bannerPicture": "assets/images/accounts/netflix/banner/1.jpg",
//       "verified": false
//     },
//     {
//       "name": "Paper Rex",
//       "nickname" : "pprxteam",
//       "followers": ["Elon Musk", "Bill Gates"],
//       "following": ["Elon Musk", "Netflix", "Bill Gates"],
//       "description": "VALORANT - VCTPACIFIC 2023 Champions - WGAMING",
//       "location": "Singapore",
//       "joinedAt": "2018-09-05T11:45:00Z",
//       "profilePicture": "assets/images/accounts/paper_rex/profile_picture/1.jpg",
//       "bannerPicture": "assets/images/accounts/paper_rex/banner/1.jpg",
//       "verified": true
//     }
//   ]
//   ''';
//     final List<dynamic> jsonData = json.decode(response);

//       final List<AccountModel> accountModels = jsonData.map<AccountModel>((accountData) {
//       return AccountModel.fromJson(accountData);
//     }).toList();

//     return accountModels;
//   } catch (e) {
//     return [];
//   }
// }


