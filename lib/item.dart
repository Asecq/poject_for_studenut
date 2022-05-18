import 'package:flutter/material.dart';
class item extends StatefulWidget {
  final String another;
  final String name;
  final String image;
  final String age;
  final String phone;
  final String address;
  final String date;
  item({Key? key,required this.another , required this.date, required this.name , required this.image , required this.address , required this.age,required this.phone}) : super(key: key);
  @override
  _itemState createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            shadowColor: Colors.greenAccent,
            title: const Text("معلومات المراجعة" , style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold
            ),),
          ),
          body: Center(
            child: ListView(
              padding: EdgeInsets.all(10),

              children:  [
                SizedBox(
                  height: 10,
                ),
                Center(child: Image.asset("assets/images/dentist.png" , height: 250,width: 200,)),
                SizedBox(
                  height: 10,
                ),
                Text("اسم المريض : " + widget.name.toString() ,style: TextStyle(
                    color: Colors.green,
                  fontWeight: FontWeight.bold,
                    fontSize: 18
                ),textAlign: TextAlign.center,),
                SizedBox(
                  height: 10,
                ),
                Text("العمر : " + widget.age.toString() ,style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),textAlign: TextAlign.center,),
                SizedBox(
                  height: 10,
                ),
                Text("العنوان : " + widget.address.toString() ,style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),textAlign: TextAlign.center,),
                SizedBox(
                  height: 10,
                ),
                Text("رقم الهاتف : " + widget.phone.toString() ,style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),textAlign: TextAlign.center,),
                SizedBox(
                  height: 10,
                ),
                Text("الأمراض المزمنة : " + widget.another.toString() ,style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),textAlign: TextAlign.center,),
                SizedBox(
                  height: 10,
                ),
                Text("ناريخ المراجعة : " + widget.date.toString() ,style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  fontSize: 18
                ),textAlign: TextAlign.center,),
                SizedBox(
                  height: 10,
                ),
                Text("المرفقات", textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                SizedBox(
                  height: 5,
                ),
                InteractiveViewer(
                  panEnabled: false, // Set it to false
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 2,
                  child: Image.network(
                    widget.image.toString(),
                    width: 20,
                    height: 180,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),






              ],
            ),
          ),
        )
    );
  }
}
