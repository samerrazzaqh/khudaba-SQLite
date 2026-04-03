import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../DataBase/sqldb.dart';
import 'SingelPage.dart';


final pageBucket = PageStorageBucket();

class ListFavPage extends StatefulWidget {
  const ListFavPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListFavPageState();
  }
}

class ListFavPageState extends State<ListFavPage> {

  SqlDb sqlDb = SqlDb();
  bool isLoading = true;
  List khutaba =[];
  Future readData() async{
    List<Map> response = await sqlDb.readData("SELECT * FROM khutaba WHERE star = 1");
    khutaba.addAll(response);
    isLoading = false;
    if(this.mounted){setState(() {});}
  }
  @override
  void initState() {
    readData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return
      isLoading == true ?
      Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xFF694B15),
          child: const Center(child: CircularProgressIndicator())):
      PageStorage(
        bucket: pageBucket,
        child: Container(
          color: const Color(0xFF694B15),
          child: ListView.builder(
            key: const PageStorageKey<String>('ListFavPage'),
            itemCount: khutaba.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context,i){
              return InkWell(

                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                    return SingelPage(
                      id: khutaba[i]['id'],
                      name: khutaba[i]['name'],
                      detail: khutaba[i]['detail'],
                      death: khutaba[i]['death'],
                      picture: khutaba[i]['picture'],
                      star: khutaba[i]['star'],
                    );
                  }));

                },

                child: Container(
                  decoration: BoxDecoration(
                    // color: Color(0xFFB39E6D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child:Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow( //<-- SEE HERE
                                      color: Color(0xFF020522),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(10),
                                child: Image.asset( height: 145,"assets/images/allimage/${khutaba[i]['picture']}.jpg")),
                          ),
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow( //<-- SEE HERE
                                          color: Color(0xFFB39E6D),
                                          blurRadius: 5.0,
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      color: Color(0xFFB39E6D),
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(5),
                                        child: Text("${khutaba[i]['name']}",
                                          style: const TextStyle(color:Color(0xFF7A150D),fontSize: 18, fontWeight: FontWeight.bold)
                                          ,textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow( //<-- SEE HERE
                                          color: Color(0xFFB39E6D),
                                          blurRadius: 10.0,
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      color: Color(0xFFB39E6D),
                                      child: Container(
                                        height: 100,
                                        width: double.infinity,
                                        margin: EdgeInsets.all(5),
                                        child: Text("${khutaba[i]['detail']}",
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                                          ,textDirection: TextDirection.rtl,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],)
                          ),

                        ],
                      ),
                      // Container(margin: EdgeInsets.symmetric(horizontal: 10), child: Divider(color: Color(0xFFB39E6D),thickness: 2)),

                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
  }
}

