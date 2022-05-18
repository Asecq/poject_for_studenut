import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'item.dart';
class filter extends StatefulWidget {
  final String name;
  filter({required this.name });
  @override
  _filterState createState() => _filterState();
}
List items = [];
class _filterState extends State<filter> {


  Future<void> getData() async {
    final CollectionReference _collectionRef =
    FirebaseFirestore.instance
        .collection('data');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    setState(() {
      items = allData.toList();
    });

    print(items[0]["name"]);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {




    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            shadowColor: Colors.greenAccent,
            title: const Text("السجلات" , style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold
            ),),
          ),
          body: (items.isNotEmpty)? ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, index) => (items[index]["name"].toString().contains(widget.name))?Center(
                  child: Column(
                    children: [
                      Card(
                        margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 1.0),
                        child: ListTile(
                          leading: Text(items[index]["name"].toString()),
                          title: Text(items[index]["address"].toString()),
                          subtitle: Text("العمر : " + items[index]["age"].toString()),
                          trailing: Text("تاريخ المراجعة : " + items[index]["date"].toString()),

                          onTap: () async {},
                        ),
                      ),
                      TextButton(onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => item(name: items[index]["name"]
                                    ,phone: items[index]["phone"],
                                    date: items[index]["date"],
                                    address: items[index]["address"],
                                    age: items[index]["age"],
                                    another: items[index]["another"],
                                    image: items[index]["image"])));

                      }, child: Text("عرض المعلومات") ),

                    ],
                  )) : Text("")) : CircularProgressIndicator(),
        )

    );
  }

}
