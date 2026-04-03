import 'package:flutter/material.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:khudaba/Views/HomePage.dart';
import 'package:page_transition/page_transition.dart';


class AboutPage extends StatefulWidget {

  const AboutPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return AboutState();
  }
}

class AboutState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حول التطبيق",style: const TextStyle(color: Color(0xFF7A150D),fontWeight: FontWeight.w900,fontSize: 25),),
        leading: IconButton(splashColor: const Color(0xFF7A150D), color: const Color(0xFF7A150D), icon: const Icon(Icons.arrow_back),onPressed: (){
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.leftToRight,
              isIos: true,
              child: HomePage(),
            ),
          );
        },),

        elevation: 10,
        shadowColor: const Color(0xFF694B15),
        backgroundColor: const Color(0xFFB39E6D),
        centerTitle: true,

      ),
      drawer: const Drawer(),

      body:
      Container(
        width: double.infinity,
        color: const Color(0xFF694B15),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.white70,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Text("بسم الله الرحمن الرحيم",style: TextStyle(fontSize: 30,color: Colors.green,fontWeight: FontWeight.w900),textAlign: TextAlign.center,)),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: const Column(
                          children: [
                            Text("الحمد لله رب العالمين والصلاة والسلام على سيدنا محمد وآله الطيبين الطاهرين ولعنة الله على أعدائهم أجمعين إلى يوم الدين."
                                "لقد جاء هذا المشروع (خطباء المنبر الحسيني) ضمن نشاطات مؤسسة الحكمة للثقافة الإسلامية في النجف الأشرف وفاءً وعرفاناً بالجميل لصفوة من الرجال الذين اختاروا خدمة سيد الشهداء والأئمة الأطهار (عليهم أفضل الصلاة والسلام)، وبذلوا ما بوسعهم في دعم وإثراء المنبر الحسيني، وتعبئة قاعدته الشعبية العريضة لنصرة الحق والسير على نهج أهل البيت (عليهم السلام)."
                                "لقد تحدى الخطباء جبروت الظالمين وطغيانهم ولم يتأثروا بالوعيد والعقاب الذي لوّح به الطغاة على مرّ العصور، بل قدموا أرواحهم وأموالهم فداءً للقضية السامية والفكرة الخالدة المتمثلة بإحياء أمر أهل البيت (صلوات الله عليهم)."
                                "ومن هذا المنطلق، ولكي تبقى سيرتهم العطرة تسير مع مسير الأجيال، قمنا بتوثيق سيرة عدد من الخطباء مزودة بالصور الفوتوغرافية على أن نستمر بدعم هذا التوثيق وزيادة العدد مستقبلاً بعونه تعالى."
                                "ومن توفيقات الباري جل ذكره أن استطعنا إدخال هذا المشروع حيز تطبيقات الهواتف الذكية وغيرها من أجهزة الاتصال الحديثة، حيث يمكن الاستفادة من قبل المستخدمين للحصول على عرض لسيرة الخطيب وصورته الشخصية مع توفير إمكانيات البحث والتحميل والمشاركة في مواقع التواصل الاجتماعي المشهورة، ونطمح في المستقبل القريب إلى تفعيل إمكانية التفاعل الصوتي أو الفيديوي لمحاضرات عدد من الخطباء وبما يتلاءم مع نهج المؤسسة الذي انطلقت منه وسارت لتبلغ هدفها الأسمى وهو نشر فكر أهل البيت (عليهم السلام)."
                                "العمل من إعداد وتصميم وبرمجة الكادر الفني والتقني في (مؤسسة الحكمة للثقافة الإسلامية) في النجف الأشرف:"
                                ,
                              style: TextStyle(fontSize: 25),
                              textAlign: TextAlign.justify,
                            ),
                            Text("إعداد: حيدر الجد",
                              style: TextStyle(fontSize: 25,color: Color(0xFF7A150D)),
                              textAlign: TextAlign.justify,
                            ),
                            Text( "برمجة: سامر رزاق ",
                              style: TextStyle(fontSize: 25,color: Color(0xFF7A150D)),
                              textAlign: TextAlign.justify,
                            ),
                            Text("كرافيك: عباس رفيعي",
                              style: TextStyle(fontSize: 25,color: Color(0xFF7A150D)),
                              textAlign: TextAlign.justify,
                            ),
                            Text("ومن الله سبحانه نستمد العون والتوفيق ",
                              style: TextStyle(fontSize: 25,color: Color(0xFF7A150D)),
                              textAlign: TextAlign.justify,
                            ),
                            Text("مؤسسة الحكمة للثقافة الإسلامية ",
                              style: TextStyle(fontSize: 25,color: Color(0xFF7A150D)),
                              textAlign: TextAlign.justify,
                            ),
                            Text("العراق ـ النجف الأشرف ",
                              style: TextStyle(fontSize: 25,color: Color(0xFF7A150D)),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
           Expanded(
             flex: 1,
             child: Container(
               padding: const EdgeInsets.all(20),
               color: const Color(0xFFB39E6D),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   ElevatedButton(
                     onPressed: (){
                     },
                     style: TextButton.styleFrom(
                       foregroundColor: Colors.transparent,
                       backgroundColor:Colors.transparent,
                       elevation: 20,
                     ),
                     child: SizedBox(
                       width: 70,
                       height: 70,
                       child: Image.asset("assets/images/imageapp/GoogleChrome.png",),
                     ),
                   ),
                   const Spacer(),
                   ElevatedButton(
                     onPressed: (){
                     },
                     style: TextButton.styleFrom(
                       foregroundColor: Colors.transparent,
                       backgroundColor:Colors.transparent,
                       elevation: 20,
                     ),
                     child: SizedBox(
                       width: 50,
                       height: 100,
                       child: Image.asset("assets/images/imageapp/logo.png",fit: BoxFit.fill,),
                     ),
                   ),
                   const Spacer(),
                   ElevatedButton(
                     onPressed: (){
                     },
                     style: TextButton.styleFrom(
                       foregroundColor: Colors.transparent,
                       backgroundColor:Colors.transparent,
                       elevation: 20,
                     ),
                     child: SizedBox(
                       width: 70,
                       height: 70,
                       child: Image.asset("assets/images/imageapp/mailicon.png",),
                     ),
                   ),
                 ],
               ),
             ),
           )

          ],
        ),
      )





    );
  }
}
