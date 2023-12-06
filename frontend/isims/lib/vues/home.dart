
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:isims/controllers/homeController.dart';
import 'package:isims/controllers/loginController.dart';
import 'package:isims/vues/Rapports/ListRapports.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';


  class HomePage extends StatefulWidget {
  HomePage({Key? key
    ,this.token}) : super(key: key);
  String? token;
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

    @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print('kdjbvfkjbgkfjbgkfb');
  //   print(loginController.name.value);
  //   print(loginController.email.value);
  //   print('kdjbvfkjbgkfjbgkfb');
  //
  //   // FlutterNativeSplash.remove();
  //   fun();
  // }
  // fun()async{
  //   for(int j=0;j<=1600;j++){
  //     await Future.delayed(Duration(microseconds: 1));
  //     homeController.i.value++;
  //     await Future.delayed(Duration(milliseconds: 1));
  //
  //   }
  // }

  List imageList =[
    {"id":1,"image_path":"assets/isims1.jpg"},
    {"id":2,"image_path":"assets/isims2.jpg"},
    {"id":3,"image_path":"assets/isims3.jpg"},
    {"id":4,"image_path":"assets/isims4.jpg"},
    {"id":5,"image_path":"assets/isims5.jpg"},
  ];

    final CarouselController carouselController = CarouselController();
    int currentIndex = 0;

    LoginController loginController = LoginController();
    HomeController homeController =HomeController();

    int counter = 0;
    ScrollController _scrollController = ScrollController();


    @override
    void initState() {
      super.initState();
      _scrollController.addListener(() {
        if (_scrollController.position.pixels>MediaQuery.sizeOf(context).height*.5) {
          homeController.startCounter(1600);
          homeController.startCounter1(300);
          homeController.startCounter2(400);
          homeController.startCounter3(500);
        }
      });
    }

    // _checkVisibility() {
    //   final RenderBox renderBoxi = _iKey.currentContext!.findRenderObject() as RenderBox;
    //   // final RenderBox renderBoxi1 = _i1Key.currentContext!.findRenderObject() as RenderBox;
    //   // final RenderBox renderBoxi2 = _i2Key.currentContext!.findRenderObject() as RenderBox;
    //   // final RenderBox renderBoxi3 = _i3Key.currentContext!.findRenderObject() as RenderBox;
    //
    //   final isVisiblei =
    //       renderBoxi.size.height > 0 && renderBoxi.localToGlobal(Offset.zero).dy < MediaQuery.of(context).size.height;      // final isVisiblei1 = renderBoxi1.size.height > 0 && renderBoxi1.localToGlobal(Offset.zero).dy < MediaQuery.of(context).size.height;
    //   // final isVisiblei2 = renderBoxi2.size.height > 0 && renderBoxi2.localToGlobal(Offset.zero).dy < MediaQuery.of(context).size.height;
    //   // final isVisiblei3 = renderBoxi3.size.height > 0 && renderBoxi3.localToGlobal(Offset.zero).dy < MediaQuery.of(context).size.height;
    //
    //   if (isVisiblei) startCounter(1600);
    //   // if (isVisiblei1) startCounter1(300);
    //   // if (isVisiblei2) startCounter2(400);
    //   // if (isVisiblei3) startCounter3(500);
    // }


    // YoutubePlayerController _controller = YoutubePlayerController(
    //   initialVideoId: 'iLnmTe5Q2Qw',
    //   flags: YoutubePlayerFlags(
    //     autoPlay: true,
    //     mute: true,
    //   ),
    // );


    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child:
    // Obx(()=>
        ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("iheb mbarek"),
                // accountName: Text(loginController.name.value),
                accountEmail: Text("ihebmbarek05@gmail.com"),
                // accountEmail: Text(loginController.email.value),
                currentAccountPicture: CircleAvatar(child:Icon(Icons.person_outline)),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage('assets/backg_img.avif'),
                    fit: BoxFit.fill
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined,color: Colors.blue,size: 30,),
              title: Text('Acceuil',style: TextStyle(color: Colors.black,fontSize:18 ),),
              onTap: (){
                Get.offAll(()=>HomePage());
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book_outlined,color: Colors.blue,size: 25),
              title: Text('liste des Courses',style: TextStyle(color: Colors.black,fontSize:18 ) ),
              onTap: (){
                print('taapp');
              },
            ),
            ListTile(
              leading: Icon(Icons.person_outline,color: Colors.blue,size: 25),
              title: Text('liste des enseignants',style: TextStyle(color: Colors.black,fontSize:18 )),
              onTap: (){
                print('taapp');
              },
            ),
            ListTile(
              leading: Icon(Icons.sd_card_alert_outlined,color: Colors.blue,size: 25),
              title: Text('Rapports',style: TextStyle(color: Colors.black,fontSize:18 )),
              onTap: (){
                Get.to(()=>ListRapportsPage());
              },
            ),
            Container(height: MediaQuery.sizeOf(context).height*0.42,),
            ListTile(
              leading: Icon(Icons.logout,color: Colors.blue,size: 25),
              title: Text('Deconnexion',style: TextStyle(color: Colors.black,fontSize:18 )),
              onTap: (){
                print('taapp');
              },
            ),

          ],
        ),
        // ),
      ),
      body: Container(
        child: ListView(
          controller: _scrollController,
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: (){
                    print(currentIndex);
                  },
                  child: CarouselSlider(
                    items: imageList.map((item) => Image.asset(
                      item["image_path"],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )).toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index,reason){
                        setState(() {
                          currentIndex=index;
                        });
                      }
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                    left: 0,
                    right: 0,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry){
                        return GestureDetector(
                          onTap: ()=> carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex==entry.key ?17 :7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white
                              ),
                              color: currentIndex==entry
                                ?Colors.transparent
                                  :Colors.blue
                            ),
                          ),
                        );
                      }).toList(),
                    )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.menu_book_rounded,color: Colors.blue,size: MediaQuery.sizeOf(context).height*0.05,),
                Text('A LA UNE'),
                Container(
                  height: MediaQuery.sizeOf(context).height*0.001,
                  width: MediaQuery.sizeOf(context).width*0.6,
                  color: Colors.blue,
                )
              ],
            ),
            Container(
              height: MediaQuery.sizeOf(context).height*0.32,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index){
                      return ListTile(
                        title: Text('Event'),
                        leading: Text('19 NOV'),
                      );
                  }
              ),
            ),
            Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: AssetImage("assets/event/banner_fiche_fra.jpg"),
                    width:MediaQuery.sizeOf(context).width *.45 ,),
                    Image(image: AssetImage("assets/event/banner_master_fra.jpg"),
                        width:MediaQuery.sizeOf(context).width *.45),
                  ],
                ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: AssetImage("assets/event/banner_docs_fra.png"),
                        width:MediaQuery.sizeOf(context).width *.45),
                    Image(image: AssetImage("assets/event/banner-4c.jpg"),
                        width:MediaQuery.sizeOf(context).width *.45),
                  ],
                ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image:AssetImage("assets/event/Email-Institutionnel.jpg"),
                      width:MediaQuery.sizeOf(context).width *.45),
                  Image(image: AssetImage("assets/event/erasmus.jpg"),
                      width:MediaQuery.sizeOf(context).width *.45),
                ],
              ),
              // SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
              //   Image(image: AssetImage("assets/event/Email-Institutionnel.jpg")),
              // SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
              //   Image(image: AssetImage("assets/event/erasmus.jpg")),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                Image(image: AssetImage("assets/event/paq_banner.jpg"))
          ],
        ),
          Obx(() => Container(
            height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/BG4.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // SizedBox(width: 20,),
                        Icon(Icons.show_chart,color: Colors.blue,)  ,

                        Text('TOUS LES CHIFFRES',
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600]
                        ),
                        ),
                        Container(
                          color: Colors.blue,
                          height: MediaQuery.sizeOf(context).height*0.001,
                          width: MediaQuery.sizeOf(context).width*0.5,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image.asset("assets/icons/student_icon.png"),
                            Text(homeController.i.value.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset("assets/icons/teachers_icon.png"),
                            Text(homeController.i1.value.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset("assets/icons/stat_icon.png"),
                            Text(homeController.i2.value.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset("assets/icons/stat_icon.png"),
                            Text(homeController.i3.value.toString()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
            /////////////////////important video/////////////////////////
            // Container(
            //   // child: YoutubePlayer(
            //   //   controller: _controller,
            //   //   showVideoProgressIndicator: true,
            //   //   videoProgressIndicatorColor: Colors.amber,
            //   //   progressColors: ProgressColors(
            //   //     playedColor: Colors.amber,
            //   //     handleColor: Colors.amberAccent,
            //   //   ),
            //   //   onReady () {
            //   // _controller.addListener(listener);
            //   // },
            //   // ),
            //   child:YoutubePlayer(
            //     controller: _controller,
            //     liveUIColor: Colors.amber,
            //   ),
            //         ),
            /////////////////////important video/////////////////////////
            SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
            Container(
              height:
              MediaQuery.sizeOf(context).height*0.17,
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(
                          FontAwesomeIcons.graduationCap,
                          color: Colors.blue,
                        size: 20,
                        ),
                      Text(
                        "FORMATIONS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          fontSize: 20
                        ),
                      ),
                      // SizedBox(width: 10,),

                      Container(
                        color: Colors.blue,
                        height: MediaQuery.sizeOf(context).height*0.001,
                        width: MediaQuery.sizeOf(context).width*0.5,
                      )                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.sizeOf(context).width*0.1,),
                      Icon(Icons.arrow_forward_ios_rounded,size: 20,),
                      Text('LICENCES',style: TextStyle(fontSize:22,color: Color(0xFF153142)))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.sizeOf(context).width*0.1,),
                      Icon(Icons.arrow_forward_ios_rounded,size: 20,),
                      Text('MASTÈRES DE RECHERCHE',style: TextStyle(fontSize:22,color: Color(0xFF153142)),)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.sizeOf(context).width*0.1,),
                      Icon(Icons.arrow_forward_ios_rounded,size: 20,),
                      Text('MASTÈRES PROFESSIONNELS',style: TextStyle(fontSize:22,color: Color(0xFF153142)))
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
            // Container(
            //   height:
            //   MediaQuery.sizeOf(context).height*0.6,
            //   child:Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           FaIcon(
            //             FontAwesomeIcons.graduationCap,
            //             color: Colors.blue,
            //             size: 20,
            //           ),
            //           Text(
            //             "PARTENAIRES",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.grey[600],
            //                 fontSize: 20
            //             ),
            //           ),
            //           // SizedBox(width: 10,),
            //
            //           Container(
            //             color: Colors.blue,
            //             height: MediaQuery.sizeOf(context).height*0.001,
            //             width: MediaQuery.sizeOf(context).width*0.5,
            //           )                    ],
            //       ),
            //       CarouselSlider.builder(
            //
            //           itemCount:imgList.length ,
            //           itemBuilder: (context,index,realIndex){
            //             final urlImage = imgList[index];
            //             return buildImage(urlImage,index);
            //           },
            //           options: CarouselOptions(height: 400)),
            //       SizedBox(height: 20,),
            //       buildIndicator()
            //
            //     ],
            //   ),
            // ),
          ],
          // child: Text(widget.token!),
        ),
      ),
    );
  }

  Widget buildImage (String urlImage,int index)=>
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Image.network(urlImage,fit: BoxFit.cover,),
        );

    Widget buildIndicator()=>AnimatedSmoothIndicator(
      effect: ExpandingDotsEffect(dotWidth: 15,activeDotColor: Colors.blue),
        activeIndex: 1,
        count: imgList.length
    );

}
