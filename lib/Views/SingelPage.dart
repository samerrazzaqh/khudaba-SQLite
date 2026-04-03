import 'package:flutter/material.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:khudaba/Views/ListAll.dart';
import '../DataBase/sqldb.dart';
import 'package:page_transition/page_transition.dart';

import 'TapListMain.dart';

final pageBucket = PageStorageBucket();

class SingelPage extends StatefulWidget {
  final id;
  final name;
  final detail;
  final death;
  final picture;
  final star;
  const SingelPage({
    super.key,
    this.id,
    this.name,
    this.detail,
    this.death,
    this.picture,
    this.star,
  });

  @override
  State<StatefulWidget> createState() {
    return SingelState();
  }
}

class SingelState extends State<SingelPage> {
  SqlDb sqlDb = SqlDb();
  GlobalKey<FormState> formstate = GlobalKey();
  ArabicNumbers arabicNumber = ArabicNumbers();
  var _val;
  bool stars = false;
  List khutaba = [];

  @override
  void initState() {
    _val = 25.0;
    if (widget.star == 1) {
      stars = true;
    } else {
      stars = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.name}",
          style: const TextStyle(
            color: Color(0xFF7A150D),
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          splashColor: const Color(0xFF7A150D),
          color: const Color(0xFF7A150D),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                isIos: true,
                child: ListTapMainPage(),
              ),
            );
          },
        ),

        elevation: 10,
        shadowColor: const Color(0xFF694B15),
        backgroundColor: const Color(0xFFB39E6D),
        centerTitle: true,
      ),
      drawer: const Drawer(),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFFB39E6D),
        child: Form(
          key: formstate,
          child: PageStorage(
            bucket: pageBucket,
            child: ListView(
              children: [
                Image.asset(
                  "assets/images/allimage/${widget.picture}.jpg",
                  fit: BoxFit.fill,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          //<-- SEE HERE
                          // color: Color(0xFFB39E6D),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Card(
                      color: Color(0xFF020522),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "الوفاة : ${arabicNumber.convert(widget.death)} هـ",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),

                            Expanded(
                              flex: 3,
                              child: Slider(
                                activeColor: Colors.white,
                                inactiveColor: const Color(0xFFB39E6D),
                                min: 20.0,
                                max: 35.0,
                                value: _val,
                                onChanged: (val) {
                                  setState(() {
                                    _val = val;
                                  });
                                },
                              ),
                            ),

                            Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: () async {
                                  List<Map> response = await sqlDb.readData(
                                    "SELECT star FROM khutaba WHERE id = ${widget.id}",
                                  );
                                  List khutaba = [];
                                  khutaba.addAll(response);
                                  print(khutaba[0]['star']);
                                  if (khutaba[0]['star'] == 1) {
                                    int respose = await sqlDb.updateData('''
                                        UPDATE khutaba SET
                                         star = 0
                                        WHERE id = ${widget.id}
                                        ''');
                                    setState(() {
                                      stars = false;
                                    });
                                  } else {
                                    int respose = await sqlDb.updateData('''
                                        UPDATE khutaba SET
                                         star = 1
                                        WHERE id = ${widget.id}
                                        ''');
                                    setState(() {
                                      stars = true;
                                    });
                                  }
                                },
                                icon: const Icon(Icons.star, size: 40),
                                color: stars == true
                                    ? Colors.amber
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    color: const Color(0xFF020522),
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "${widget.detail}",
                      style: TextStyle(color: Colors.white, fontSize: _val),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
