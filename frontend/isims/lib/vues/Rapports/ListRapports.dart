

import 'package:flutter/material.dart';
import 'package:isims/controllers/RapportController.dart';
import 'package:isims/vues/Rapports/AddRapport.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';



class ListRapportsPage extends StatelessWidget {
   ListRapportsPage({Key? key}) : super(key: key);

  RapportController rapportController = Get.put(RapportController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Get.to(()=>AddRapportPage());
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text('Rapports',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Obx(()=>Container(
        child: rapportController.valid.value==true
        ?RefreshIndicator(
          onRefresh: (){
            return rapportController.getRapports(context);
          },
          child: ListView.builder(
            itemCount: rapportController.listeDeRapports.length,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(
                  bottom: 5,
                ),
                child: ListTile(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            content: Container(
                              height: MediaQuery.sizeOf(context).height*0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text('type de rapoport:'),
                                  // Text(rapportController.listeDeRapports[index].rapportType!),
                                  Text("Contenu de rapport : "),
                                  SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width:1,
                                        color: Colors.black.withOpacity(0.6)
                                      )
                                    ),
                                      child:
                                      Text(rapportController.listeDeRapports[index].rapportContent!)
                                  ),
                                  SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                                  Text('status de rapport : '),
                                  SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                                  Container(
                                      padding: EdgeInsets.all(8),
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width:1,
                                              color: Colors.black.withOpacity(0.6)
                                          )
                                      ),
                                      child:
                                      Text(rapportController.listeDeRapports[index].status!)
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  },
                  // title: Text(rapportController.listeDeRapports[index].rapportType!),
                  trailing: rapportController.listeDeRapports[index].seen==true
                  ?Icon(Icons.check_circle,
                    color:rapportController.listeDeRapports[index].seen==false
                        ?Colors.white
                        :rapportController.listeDeRapports[index].status=="n'est pas traité"
                        ?Colors.red
                        :rapportController.listeDeRapports[index].status=="en cour de traitement"
                        ?Colors.blue
                        :Colors.green,
                  )
                  :Icon(Icons.check_circle_outline_rounded),
                  title: Container(
                      child:
                      Text(
                          rapportController.listeDeRapports[index].rapportContent!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                  ),
                ),
              );
            },
          ),
        )
        :Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          for(int i =0;i<=7;i++)
            Container(
              height: MediaQuery.sizeOf(context).height*0.1,
              width: MediaQuery.sizeOf(context).width*0.94,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child:Row(
                  children: [
                    SizedBox(width: 30,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height*0.02,
                          width: MediaQuery.sizeOf(context).width*0.75,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            // borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                        Container(
                          height: MediaQuery.sizeOf(context).height*0.02,
                          width: MediaQuery.sizeOf(context).height*0.2,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            // borderRadius: BorderRadius.circular(50)
                          ),
                        )
                      ],
                    )
                  ],
                ),

              ),
            ) ,
        ],
      ),
      )),
    );
  }
}
