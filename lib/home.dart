import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/filter.dart';
import 'package:project/list.dart';


import 'add.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}
TextEditingController _search = TextEditingController();
class _homeState extends State<home> {
  //DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,DateTime.now().hour,DateTime.now().minute) ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        () async {
      await Firebase.initializeApp();

    };

  }

  @override
  Widget build(BuildContext context) {

    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            shadowColor: Colors.greenAccent,
            title:  Text("Ortho" , style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold
            ),),
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              children:  [
                Image.asset("assets/images/image1.jpg" , height: 250,width: 200,),
                const SizedBox(
                  height: 10,
                ),
                 Padding(padding: EdgeInsets.only(right: 20,left: 20 , top: 10),
                  child: TextField(
                    controller: _search,

                    textAlign: TextAlign.right,
                    decoration:  InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xffE5E5E5),
                        ),),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xffE5E5E5),
                        ),
                      ),

                      hintText: 'اكتب للبحث ...',
                    ),
                  ),),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => filter(name: _search.text.trim())));

                    },
                    icon: const Icon(Icons.search , color: Colors.black,),
                    label: const Text(
                      "بحث" ,
                      style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                      ),

                      onPressed: () {

                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => list()));

                      },
                      icon: const Icon(Icons.list_alt , color: Colors.black,),
                      label: const Text(
                        "سجل المراجعات" ,
                        style: TextStyle(color: Colors.black ,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )),

                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                      ),

                      onPressed: () {

                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => add()));

                      },
                      icon: const Icon(Icons.add , color: Colors.black,),
                      label: const Text(
                        "اضافة جديد" ,
                        style: TextStyle(color: Colors.black ,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )),

                )

              ],
            ),
          ),
        )
    );
  }
}
