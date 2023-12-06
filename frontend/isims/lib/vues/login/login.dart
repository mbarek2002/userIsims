import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:isims/controllers/loginController.dart';
import 'package:isims/model/loginModel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    initialization();
    FlutterNativeSplash.remove();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  loginModel? login;
  LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  bool valid=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('ISIMS-APP',style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        child: ListView(
          children: [
            Obx(()=>
               Column(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height*0.25,
                    child: Image.asset("assets/isims_photo2.jpeg",fit: BoxFit.fill,),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                  Container(
                    child: Image.asset(
                      height: MediaQuery.sizeOf(context).height*0.1,
                    width: MediaQuery.sizeOf(context).width*0.2,
                      "assets/isims_logo.jpeg",),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                  Container(
                    width: MediaQuery.sizeOf(context).width*0.8,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey
                            )
                        )
                    ),
                    child: TextFormField(
                      controller: loginController.matriculeController,
                      decoration: InputDecoration(
                          hintText: "Matricule",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                  Container(
                    width: MediaQuery.sizeOf(context).width*0.8,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey
                            )
                        )
                    ),
                    child: TextFormField(
                      controller: loginController.motDePasseController,
                      decoration: InputDecoration(
                          hintText: "Mot de passe ",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                  Container(
                    height: MediaQuery.sizeOf(context).height*0.05,
                    width: MediaQuery.sizeOf(context).width*0.5,
                    color: Colors.blue,
                    child: TextButton(
                      onPressed: ()async{
                        if(loginController.matriculeController.text.trim().isNotEmpty &&loginController.motDePasseController.text.trim().isNotEmpty){
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(content: Text('Processing Data'),duration: Duration(seconds: 1),),
                          // );
                          print(loginController.matriculeController.text.trim());
                          print(loginController.motDePasseController.text);
                          await loginController.login(loginController.matriculeController.text.trim(), loginController.motDePasseController.text.trim());
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('enter matricule et mot de passe ')),
                          );
                        }
                      },
                      child:loginController.valid.value == true?
                      Text('Connexion',style: TextStyle(color: Colors.white,fontSize: 20),):
                      CircularProgressIndicator(
                        color: Colors.white,
                      )
                    ,
                    ),
                  ),


                  Container(
                    height: MediaQuery.sizeOf(context).height*0.25,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.blue,
                          ],
                        )
                    ),
                  )


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
