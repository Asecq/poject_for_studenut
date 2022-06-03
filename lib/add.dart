import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
// ignore: camel_case_types
class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  _addState createState() => _addState();
}
TextEditingController _fullname = TextEditingController();
TextEditingController _age = TextEditingController();
TextEditingController _address = TextEditingController();
TextEditingController _phone = TextEditingController();
TextEditingController _another = TextEditingController();
TextEditingController _price = TextEditingController();
TextEditingController _details = TextEditingController();
TextEditingController _treatment = TextEditingController();

// ignore: camel_case_types
class _addState extends State<add> {
  CollectionReference data = FirebaseFirestore.instance.collection("data");
  // Camera implementation
  File? _image;
  var time = intl.DateFormat('yyyy/MM/dd').format(DateTime.now());
  final ImagePicker _picker = ImagePicker();
  Future getImage() async {
    final image = await _picker.pickImage(source: ImageSource.camera );
    setState(() {
      _image = File(image!.path);
    });
  }
  Future getGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery );

    setState(() {
      _image = File(image!.path);
    });
  }
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
    _another.text = "لا يوجد";
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("اضافة مراجع جديد" , style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),

          ),
          body: Container(
            color: Colors.white,
            child:  ListView(
              children:[
                const SizedBox(
                  height: 20,
                ),
                Padding(padding: const EdgeInsets.only(right: 20,left: 20 , top: 25),
                  child: TextField(
                    controller: _fullname,
                    textAlign: TextAlign.right,
                    decoration:  InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      hintText: 'الاسم الكامل',
                    ),
                  ),),
                Padding(padding: const EdgeInsets.only(right: 20,left: 20 , top: 20),
                  child: TextField(
                    controller: _age,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      hintText: 'العمر',
                    ),
                  ),),
                Padding(padding: const EdgeInsets.only(right: 20,left: 20 , top: 20),
                  child: TextField(
                    controller: _address,
                    textAlign: TextAlign.right,
                    decoration:  InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      hintText: 'العنوان',
                    ),
                  ),),
                Padding(padding: const EdgeInsets.only(right: 20,left: 20 , top: 20),
                  child: TextField(
                    controller: _phone,
                    textAlign: TextAlign.right,
                    decoration:  InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      hintText: 'رقم الهاتف',
                    ),
                  ),),
                Padding(padding: const EdgeInsets.only(right: 20,left: 20 , top: 20),
                  child: TextField(
                    controller: _price,
                    textAlign: TextAlign.right,
                    decoration:  InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      hintText: 'سعر الجلسة',
                    ),
                  ),),
                Padding(padding: const EdgeInsets.only(right: 20,left: 20 , top: 20),
                  child: TextField(
                    controller: _details,
                    textAlign: TextAlign.right,
                    decoration:  InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      hintText: 'تفاصيل المراجعة',
                    ),
                  ),),
                Padding(padding: const EdgeInsets.only(right: 20,left: 20 , top: 20),
                  child: TextField(
                    controller: _treatment,
                    textAlign: TextAlign.right,
                    decoration:  InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      hintText: 'العلاج',
                    ),
                  ),),
                Padding(padding: const EdgeInsets.only(right: 20,left: 20 , top: 20),
                  child: TextField(


                    controller: _another,
                    textAlign: TextAlign.right,
                    decoration:  InputDecoration(

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      hintText: 'امراض مزمنة',
                    ),
                  ),),
                const SizedBox(
                  height: 20,
                ),
              TextButton.icon(onPressed: (){
                DatePicker.showDatePicker(context,


                    showTitleActions: true,

                    minTime: DateTime(2020, 1, 1),


                    maxTime: DateTime(2029, 12, 21), onChanged: (date) {
                    setState(() {
                      time = date.year.toString() + "/" + date.month.toString() +"/"+ date.day.toString();
                    });
                    }, onConfirm: (datee) {
                  setState(() {
                    time = datee.year.toString() + "/" + datee.month.toString() +"/"+ datee.day.toString();
                  });
                      print('confirm $time');
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
              }, icon: const Icon(Icons.date_range , color: Colors.black,), label: const Text("تاريخ المراجعة" , style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),) ),
               Center(child:  Text(time),),

                TextButton.icon(
                  onPressed: getGallery
                  , icon: const Icon(Icons.image , color: Colors.black,), label: const Text("تحميل صورة من الاستوديو" , style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),) ),

                TextButton.icon(
                  onPressed: getImage
                    , icon: const Icon(Icons.camera_alt , color: Colors.black,), label: const Text("التقاط صورة" , style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),) ),
            const SizedBox(height: 5.0),
            _image == null ? const Text("") : Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                ),
  ]),
                const SizedBox(height: 5.0),

                SizedBox(
                  width: 100,
                  child: ElevatedButton.icon(

                      style: ButtonStyle(




                          backgroundColor: MaterialStateProperty.all(Colors.greenAccent)),


                      onPressed: () async {
                        if(_fullname.text.isNotEmpty && _phone.text.isNotEmpty && _age.text.isNotEmpty && _address.text.isNotEmpty && _another.text.isNotEmpty){
                          uploadItemImage(_image);
                        }else{

                        }




                      },
                      icon: const Icon(Icons.login , color: Colors.black,),
                      label: const Text(
                        "اضافة" ,
                        style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold),
                      )),
                ),

              ],
            ),
          ),
        )
    );
  }
  Future<String> uploadItemImage(mFileImage) async {

    String basename = p.basename(_image!.path);
    final Reference storageReference =
    FirebaseStorage.instance.ref();

    TaskSnapshot taskSnapshot = await
    storageReference.child(basename)
        .putFile(mFileImage);

    var downloadUrl = await taskSnapshot.ref.getDownloadURL();

    await data
        .add({
      'name': _fullname.text.trim(), // John Doe
      'age': _age.text.trim(), // Stokes and Sons
      'address': _address.text.trim(),
      'date' : time,
      'another' : _another.text.trim(),
      'phone' : _phone.text.trim(),
      'image' : downloadUrl
    })
        .then((value) {
      print("User Added");

    }

    )
        .catchError((error) => print("Failed to add user: $error"));


    return downloadUrl;
  }
}
