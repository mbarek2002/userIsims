import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isims/constant/config.dart';
import 'package:isims/model/rapportModel.dart';
import 'package:http/http.dart' as http;

class RapportController extends GetxController{

  TextEditingController rapportContentController = TextEditingController();
  RxString rapportType="selectionner un type de Reclamation".obs;

  List<String> items=["Personnel","Qualité"].obs;
   RxBool valid=true.obs;

  List<RapportModel> listeDeRapports = <RapportModel>[
    RapportModel(
        rapportType: "Qualité",
        rapportContent: "lskdfsdmdfljvndfmlgmfdlhgmdfkjhgfmdjgfmdkjghfmdkjghfmdkhgfmdkjgfmdkhgfmdkglkfjlsdflsihg",
        seen: true,
        status: "traité"
    ),
    RapportModel(
        rapportType: "Personnel",
        rapportContent: "lskdfsdlkfjlsdflsihg",
        seen: true,
        status: "n'est pas traité"
    ),
    RapportModel(
        rapportType: "Qualité",
        rapportContent: "lskdfsdlkfjlsdflsihg",
        seen: true,
        status: "en cour de traitement"
    ),
    RapportModel(
        rapportType: "Personnel",
        rapportContent: "lskdfsdlkfjlsdflsihg",
        seen: false,
        status: "en cour de traitement"
    ),
  ].obs;
  // var listeDeRapports = [].obs;



  Future<void> envoyerRapport(BuildContext context) async {
    try{
      valid.value=false;

      var rapport = RapportModel(
          id: "",
          rapportType: rapportType.value,
          rapportContent: rapportContentController.text,
        seen: false,
        status: "n'est pas traité"
      );

      var response =  await http.post(Uri.parse(ajouterRapport),
          headers: {"Content-type":"application/json"},
          body: jsonEncode(rapport.toJson()));

      var jsonResponse = jsonDecode(response.body);

      if(jsonResponse["status"]){
        ScaffoldMessenger.of( context).showSnackBar(
            SnackBar(
                content:Text("La Reclamation a été envoyé avec succès.")
            )
        );
        Get.back();
        valid.value=true;
      }
      else{
        ScaffoldMessenger.of( context).showSnackBar(
            SnackBar(
                content:Text("Échec lors de l'envoi du Reclamation d'erreur.")
            )
        );
        valid.value=true;

      }
    }catch(e){
      ScaffoldMessenger.of( context).showSnackBar(
          SnackBar(
              content:Text("Échec lors de l'envoi du Reclamation d'erreur.")
          )
      );
      print(e.toString());
      valid.value=true;

    }



  }

  RxList<dynamic> dynamicItems = <dynamic>[].obs;

  Future<void> getRapports(BuildContext context)async {

    try{
      valid.value=false;

      var response =  await http.get(Uri.parse(listRapports));
      var jsonResponse =  jsonDecode(response.body);

      if(jsonResponse['status']){
        dynamicItems.assignAll(jsonResponse['success']);
        print(dynamicItems.length);
        print(dynamicItems);
        listeDeRapports =   dynamicItems.map((item) => RapportModel.fromMap(item)).toList();
        valid.value=true;
        print(listeDeRapports.length);
      }else{
        valid.value=true;
        print('something went wrong');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:Container(
                  height: 90,
                  decoration: BoxDecoration(color: Color(0xFFC72C41)),
                  child: Text('Erreur de recupération des donées'),
                )
            )
        );
      }

    }catch(e){
      print(e.toString());
    }
  }

}