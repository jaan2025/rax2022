import 'package:flutter/material.dart';
import 'package:flutter_management/Provider/loginProvider.dart';
import 'package:flutter_management/Screens/homescreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../Helper.dart';
import '../Provider/schoolNameProvider.dart';
import '../api/ApiServises.dart';
import '../responsive/id.dart';

final loginPasswordToggle = StateProvider<bool>((ref) => true);

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {

  TextEditingController UserNameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  bool visibility = false;

  String name = '';
  String paswrd = '';
  bool isLoggedIn = false;

  get index => 0;


  SaveUserDetails(String login, dynamic password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(Helper.login, login);
    sharedPreferences.setString(Helper.password, password);
  }
/*
   @override
  void initState() {
    super.initState();
    autologin();

  }



  void autologin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userid = prefs.getString('username');
    final String? password = prefs.getString('password');

    if(userid != null && password != null){
      setState(() {
        isLoggedIn = true;
        name = userid;
        paswrd = password;
      });
      return;
    }
  }
  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', UserNameController.text);
    prefs.setString('password', PasswordController.text);

    setState(() {
      name = UserNameController.text;
      paswrd = PasswordController.text;
      isLoggedIn = true;
    });

    UserNameController.clear();
    PasswordController.clear();
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', '');

    setState(() {
      name = '';
      paswrd = '';
      isLoggedIn = false;
    });
  }*/

  bool validateLoginField() {
    if (UserNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username should not be empty')));
      return false;
    } else if (PasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password should not be empty')));
      return false;
    }
    return true;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 70,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Assets/image1.jpg'),
                          fit: BoxFit.fitWidth
                      )
                  ),
                ),
              ),
              Text(
                "TELANGANA MINORITIES\nRESIDENTIAL EDUCATIONAL\nINSTITUTIONS SOCIETY",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 70,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Assets/image3.jpg'),
                          fit: BoxFit.fitWidth
                      )
                  ),
                ),
              ),
            ],
          ),
          Consumer(builder: (context, ref, child)
          {
            var state = ref.watch(loginUserNotifier);
            if (state.error == 'initial') {
              visibility = true;
            } else {
              print("error");
            }
            if (state.isLoading) {
              CircularProgressIndicator();
              visibility = true;
            }
            state.id.when(data: (data) async {
              print("data =============== $data");
              print("LOGIN =============== ${data[index].login}");
              if (data != null) {
                if (data[index].login == UserNameController.text &&
                    data[0].password == PasswordController.text) {
                  print("success");
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  });

                } else {
                  print("fail");
                }
              }
            }, error: (error, s) {}, loading: () {});
            return
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: EdgeInsets.only(top: 270),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(23),
                  child: ListView(
                    children: <Widget>[

                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Container(
                              color: Color(0xfff5f5f5),
                              child: TextFormField(
                                controller: UserNameController,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'SFUIDisplay'
                                ),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Username',
                                    prefixIcon: Icon(Icons.person_outline),
                                    labelStyle: TextStyle(
                                        fontSize: 15
                                    )
                                ),
                              ),
                            ),
                          ),
                          Container(
                  color: Color(0xfff5f5f5),
                  child: TextFormField(
                    controller: PasswordController,
                    obscureText: ref.watch(loginPasswordToggle),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SFUIDisplay'
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: InkWell(
                          onTap: () {
                            ref
                                .read(loginPasswordToggle
                                .notifier)
                                .state =
                            !ref.watch(
                                loginPasswordToggle);
                          },
                          child: Icon(
                            ref.watch(loginPasswordToggle) ==
                                true
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        prefixIcon: Icon(Icons.lock_outline),
                        labelStyle: const TextStyle(
                            fontSize: 15
                        )
                    ),
                  ),
                ),

                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: MaterialButton(
                            onPressed: () {
                              validateLoginField();
                              ref.read(loginUserNotifier.notifier).loginUser();
                              ref.read(schoolNameNotifier);


                              Future<SharedPreferences> prefs = SharedPreferences.getInstance();
                              SaveUserDetails(
                                  UserNameController.text,
                                  PasswordController.text);

                              Navigator.of(context).pushNamedAndRemoveUntil(
                              AppId.HomeScreenId,
                              (Route<dynamic> route) => false);


                              /* Navigator.push(
                              context, MaterialPageRoute(builder: (context) =>
                              HomeScreen()));*/
                            },
                            //since this is only a UI app
                            child: const Text('Login',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'SFUIDisplay',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Color(0xffff2d55),
                            elevation: 0,
                            minWidth: 400,
                            height: 50,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),

                          )
                      ),
                    /*  Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text('Forgot your password?',
                            style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),*/
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('Assets/image2.jpg'),
                                fit: BoxFit.fitWidth
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              );
          })],
      ),
    );
  }



/* validLogin() async {
   SharedPreferences pref = await SharedPreferences.getInstance();
   var username = pref.getString(Helper.login);
   var pin = pref.getString(Helper.password);
  if(username == UserNameController.text && pin == PasswordController.text){
  print("Login Successful");
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Schoolscreen()));

  }else{
   print("Login Failed");
}
  }
}
*/
}