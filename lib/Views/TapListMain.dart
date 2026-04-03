import 'package:flutter/material.dart';
import 'package:khudaba/Views/HomePage.dart';
import 'ListAll.dart';
import 'ListFavort.dart';
import 'package:page_transition/page_transition.dart';

class ListTapMainPage extends StatefulWidget {
  const ListTapMainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListTapMainPageState();
  }
}

class ListTapMainPageState extends State<ListTapMainPage> {

  int selectedindex = 0;
  List<Widget> listwidget = [
    const ListAllPage(),
    const ListFavPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await Navigator.of(context).canPop();
        return shouldPop!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("قائمة الخطباء",style: TextStyle(color: Color(0xFF7A150D),fontWeight: FontWeight.w900,fontSize: 25),),
          leading: IconButton(splashColor: const Color(0xFF7A150D), color: const Color(0xFF7A150D), icon: const Icon(Icons.arrow_back),onPressed: (){
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                isIos: true,
                child: const HomePage(),
              ),
            );
          },),

          elevation: 10,
          shadowColor: const Color(0xFF694B15),
          backgroundColor: const Color(0xFFB39E6D),
          centerTitle: true,

        ),
        drawer: const Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFB39E6D),
          unselectedItemColor: const Color(0xFF694B15),
          selectedItemColor: const Color(0xFF7A150D),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedFontSize: 18,
          currentIndex: selectedindex,
          iconSize: 30,
          onTap: (index){setState(() {
            selectedindex = index;
          });},
          items: const [
            BottomNavigationBarItem(label: "كل الخطباء",icon: Icon(Icons.list),),
            BottomNavigationBarItem(label: "المفضلون",icon: Icon(Icons.star)),
          ],),
        body: listwidget.elementAt(selectedindex),





      ),
    );
  }
}
