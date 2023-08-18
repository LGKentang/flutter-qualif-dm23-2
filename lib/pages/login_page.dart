import 'package:flutter/material.dart';
import '../util.dart';
import 'home_page.dart';
import 'main_page.dart';
import '../static/current_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController dataController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isUserFilled = false;
  bool isPasswordFilled = false;
  Color nextBtnColor = Color.fromARGB(255, 73, 73, 73) ;
  String? userError;
  String? passwordError;

  void checkDataValid() {
    setState(() {
      isUserFilled = dataController.text.isNotEmpty;
    });
        setState(() {
      isPasswordFilled = passwordController.text.isNotEmpty;
    });
    nextBtnColor = isUserFilled && isPasswordFilled ? Color.fromARGB(255, 255, 255, 255): Color.fromARGB(255, 73,73,73);
  }    
  
  void resetError() {
    setState(() {
      userError = null;
      passwordError = null;
    });
  }

  void validateInput(){
    resetError();
    String username = dataController.text;
    String password = passwordController.text;

    
    if (username.length < 3){
      setState(() {
         userError = "Username cannot be less than 3 characters";
      });
    }
    if (username.isEmpty){
      setState(() {
        userError = "Username cannot be empty";
      });
    } 
    if (!password.contains(RegExp(r'\d'))){
      setState(() {
        passwordError = "Password must at least contain a number";
      });
    }
    if (password.isEmpty) {
      setState(() {
        passwordError = "Password cannot be empty";
      });
    }
    

    if (userError == null && passwordError == null){
       loginUser();
    }
  }

  void loginUser(){
   CurrentUser.username = dataController.text;
   Navigator.pop(context);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return MainPage();
      }),
      (route)=>false); 
  }
  
  @override
  void initState() {
    super.initState();
    dataController.addListener(checkDataValid);
    passwordController.addListener(checkDataValid);
  }


  @override
  void dispose() {
    dataController.removeListener(checkDataValid);
    passwordController.removeListener(checkDataValid);
    passwordController.dispose();
    dataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
      title: Center(
        child: Container(
          height: kToolbarHeight * 0.7,
          child: const Image(
            image:  AssetImage('assets/images/X.png'),
            fit:  BoxFit.fitHeight,
          ),
        ),
      ),
    ),


      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "To get started, first enter your phone, email, or @username"
                ,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Chirp'
                )),
                const SizedBox(height: 15,)
                ,
            TextField(
              controller: dataController,
              decoration: InputDecoration(
                hintText: 'Phone, email, or username',
                errorText: userError,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blue), 
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blue), 
                ),
                hintStyle: const TextStyle(color: Colors.blue), 
                prefixIcon: const Icon(Icons.person, color: Colors.blue), 
              ),
            ),  
            const SizedBox(height: 30,),
            const Text(
                "Then, your password"
                ,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Chirp'
                )), 
                const SizedBox(height: 15,),
                        TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                errorText: passwordError,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blue), 
                ),
                enabledBorder: const  OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blue), 
                ),
                hintStyle: const TextStyle(color: Colors.blue), 
                prefixIcon: const Icon(Icons.lock, color: Colors.blue), 
              ),
            ),                     
            ],
          ),
        ),
      ),

    
      bottomNavigationBar: BottomAppBar(       
      child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        
        Container(
            decoration: BoxDecoration(
            border: Border.all(color: createMaterialColor(Colors.grey), width: 1.0), 
            borderRadius: BorderRadius.circular(60.0), 
        
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8,3,8,3),
            child: TextButton(
              onPressed: () {}, 
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, 
              ),
              child: const Text(
                    "Forgot Password?"
                    ,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Chirp'
                    )),
            ),
          ),
        ),
        const Spacer(),

        Container(
           decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: createMaterialColor(Colors.grey), width: 1.0), // Set border color and width
            borderRadius: BorderRadius.circular(60.0), 
           ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10,3,10,3),
            child: TextButton(
              onPressed: validateInput, 
              style: TextButton.styleFrom(
                foregroundColor: nextBtnColor, 
              ),
              child: const Text(
                    "Next"
                    ,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Chirp'
                    )),
            ),
          ),
        ),
      ],
    ),
  ),
)
    );
  }
}
