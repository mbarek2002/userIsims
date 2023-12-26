import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isims/controllers/RapportController.dart';

class AddRapportPage extends StatefulWidget {
  const AddRapportPage({Key? key}) : super(key: key);

  @override
  State<AddRapportPage> createState() => _AddRapportPageState();
}

class _AddRapportPageState extends State<AddRapportPage> {

  RapportController rapportController = Get.put(RapportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Envoyer Une Reclamation',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        child: Obx(()=>ListView(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            // Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            // // SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),
            // // Container(
            // //   width: MediaQuery.sizeOf(context).width* 0.98,
            // //   height: MediaQuery.sizeOf(context).height * 0.08,
            // //   // color: Colors.red,
            // //   decoration: BoxDecoration(
            // //     border: Border.all(
            // //       color: Colors.grey,
            // //       width: 1.0,
            // //     ),
            // //     borderRadius: BorderRadius.circular(8.0),
            // //   ),
            // //   child: Padding(
            // //     padding: EdgeInsets.only(
            // //         left: MediaQuery.sizeOf(context).width * 0.02),
            // //     child: Row(
            // //       crossAxisAlignment: CrossAxisAlignment.center,
            // //       children: [
            // //         Icon(
            // //           Icons.list,
            // //           color: Colors.blue,
            // //           size: 25,
            // //         ),
            // //         SizedBox(
            // //           width: MediaQuery.sizeOf(context).width * 0.03,
            // //         ),
            // //         DropdownButton(
            // //           hint: Text(
            // //             rapportController.rapportType.value,
            // //           ),
            // //           underline: SizedBox(),
            // //           icon: SizedBox(),
            // //           items: rapportController.items.map((String items) {
            // //             return DropdownMenuItem(
            // //               value: items,
            // //               child: Text(
            // //                 items,
            // //                 style: TextStyle(color: Colors.grey),
            // //               ),
            // //             );
            // //           }).toList(),
            // //           onChanged: (String? newValue) {
            // //               rapportController.rapportType.value = newValue!;
            // //             print(rapportController.rapportType.value);
            // //           },
            // //         ),
            // //       ],
            // //     ),
            // //   ),
            // // ),
            //     ],
            //   ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Container(
                width: MediaQuery.sizeOf(context).width * 0.98,
                height: MediaQuery.sizeOf(context).height * 0.3,
                // color: Colors.red,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              child: TextField(
                controller: rapportController.rapportContentController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                      hintText: 'Ecrire votre Reclamation ...',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.9))),
                  maxLines: 10),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),
            GestureDetector(
              onTap: (){
                rapportController.envoyerRapport(context);
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width*.3,
                height: MediaQuery.sizeOf(context).height*0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue
                ),
                child:rapportController.valid.value==true
                ?Center(child: Text('Envoyer',style: TextStyle(color: Colors.white),)):
                Center(child: CircularProgressIndicator(
                  color: Colors.white,
                )),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
          ],
        )),
      ),
    );
  }
}
