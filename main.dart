//import 'package:intl/date_symbol_data_local.dart';
//import 'package:intl/intl.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyContact());

class MyContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'My Contacts',
      theme: ThemeData(
        primarySwatch: Colors.black38,
      ),
      home: MyHomePage(title: 'My Contacts'),
    );
  }

}

class MyHomePage extends StatefulWidget{
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
  }

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
  }

  getContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    _contacts.forEach((contact){

    });

    //_contacts.sort((a,b) => a.compareTo(b));
    //DateTime now = DateTime.now();
    //String dateTime = DateFormat.parse("yyyy-MM-dd - kk:mm");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),

        body: Container(
          padding: EdgeInsets.all(20),
            child: Column(
                children: <Widget>[

                  ListView.builder(
                    shrinkWrap: true,
                      itemBuilder: (context,index){
                        Contact contact = contacts[index];
                        return ListTile(
                          title: Text(contact.displayName),
                          subtitle: Text(
                            contact.phones.elementAt(0).value
                          ),

                        );
                      })

                ]
            )

            )
        );
  }

}
/*

List<Contact> mycontacts = [

Contact(user: "Chan Saw Lin", phone: 0152131113, date : "2020-06-35 16:10:05" ),
Contact(user: "Lee Saw Loy", phone: 0161231346 , date : "2019-11-22 00:00:00" ),
Contact(user: "Chan Saw Lin", phone: 0152131113, date : "2020-06-35 16:10:05" ),
Contact(user: "Lee Saw Loy", phone: 0161231346 , date : "2019-11-22 00:00:00" ),

];

}

class Contact{
  String user;
  int phone;
  String date = "check-in" ;

  Contact({this.user, this.phone, this.date})
}

 */
