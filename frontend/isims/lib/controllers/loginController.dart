import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isims/constant/config.dart';
import 'package:isims/model/loginModel.dart';
import 'package:isims/vues/home.dart';

class LoginController extends GetxController{

  TextEditingController matriculeController =TextEditingController();
  TextEditingController motDePasseController =TextEditingController();

  RxBool valid=true.obs;
  RxString name="".obs;
  RxString email="".obs;


  Future<void> login(matricule,motDePasse)async{
    valid.value = false;
    var login = loginModel(
      matricule: matriculeController.text,
      motDePasse: motDePasseController.text
    );
    try{
      var response = await http.post(Uri.parse(loginRouter),
          headers:{"Content-type":"application/json"},
          body: jsonEncode(login.toJson())
      );

      var jsonResponse = jsonDecode(response.body);

      if(jsonResponse['status']){

        name.value=jsonResponse['data']['name'];
        email.value=jsonResponse['data']['email'];

        var myToken = jsonResponse['token'];
        print(myToken);

        Get.to(()=>HomePage(token: myToken,));

        Get.showSnackbar(
          GetSnackBar(
            title: "Login",
            message: 'connection avec succée',
            duration: const Duration(seconds: 3),
              progressIndicatorBackgroundColor:Colors.red
          ),
        );
        valid.value=true;
      }
      else if(jsonResponse['status']== false && jsonResponse['message']){
        Get.showSnackbar(
          GetSnackBar(
              title: "probleme",
              message: jsonResponse['message'],
              duration: const Duration(seconds: 3),
              progressIndicatorBackgroundColor:Colors.red

          ),
        );
        valid.value=true;
      }
      else {
        valid.value=true;
        print('something went wrong');
        Get.showSnackbar(
          GetSnackBar(
              title: "probleme",
              message: 'something went wrong',
              duration: const Duration(seconds: 3),
              progressIndicatorBackgroundColor:Colors.red
          ),
        );
      }
    }catch(e){
      valid.value = true;
      print(e.toString());
      Get.showSnackbar(
        GetSnackBar(
            title: "problem",
            message: 'something went wrong',
            duration: const Duration(seconds: 3),
            progressIndicatorBackgroundColor:Colors.red
        ),
      );
    }

  }

}