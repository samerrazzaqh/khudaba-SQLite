import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {


  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.red,
    // ));
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await true;
        return shouldPop!;
      },
      child: Scaffold(
        // appBar: AppBar(),
          drawer: const Drawer(),
          body:  Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xFF694B15),
            child:
            Container(
                height: double.infinity,
                width: double.infinity,

                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/imageapp/mainxamarinx.png"),
                  ),
                ),

                child:
                Container(
                  margin: EdgeInsets.only(top: 250,left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child:
                          ElevatedButton(
                            onPressed: (){
                              setState(() {
                                Navigator.of(context).pushReplacementNamed("ListTapMainPage");
                              });
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.transparent,
                              backgroundColor:Colors.transparent,
                              elevation: 20,
                            ),
                            child: Container(
                              child: Image.asset("assets/images/imageapp/listkhtaba.png",),
                            ),)
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                Navigator.of(context).pushReplacementNamed("AboutPage");
                              });
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.transparent,
                              backgroundColor:Colors.transparent,
                              elevation: 20,
                            ),
                            child: Container(
                              child: Image.asset("assets/images/imageapp/about.png",),
                            ),
                          )
                      ),

                    ],),
                )


            ),




          )





      ),
    );
  }
}



