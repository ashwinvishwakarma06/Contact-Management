import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contact/Data_Model/Contact.dart';
import 'package:contact/Data_Model/ContactProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


// ignore: camel_case_types
class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
     appBar: AppBar(
       title: Text('Contact Manager',style: TextStyle(color: Colors.white,),),
       centerTitle: true,
       backgroundColor: Colors.deepOrange,
       elevation: 20,
        
     ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ContactProvider>(
          builder: (context,ContactProvider data,child){
            return data.getContact.length !=0 ? ListView.builder(
              itemCount: data.getContact.length,
              itemBuilder: (context,index){
                return CardList(data.getContact[index],index);
              },
            ): GestureDetector(
              onTap: (){
              showAlertDialog(context);
            },child: Center(child: Text("ADD SOME CONTACT NOW",style: TextStyle(color: Colors.white,),)));
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {
        showAlertDialog(context);
      },
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.add, color: Colors.white,),
      ),
    );

  }

}

// ignore: must_be_immutable
class CardList extends StatelessWidget {
  final Contact contact;
  int index;

  CardList(this.contact,this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child:Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),

            )
          ),
          child: ListTile(
           leading: Icon(Icons.contact_page),
            title: Text(contact.name),
            subtitle: Text(contact.number),
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.black26,),
          ),
        ),

        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: (){
              print("HELLO DELETED");
              Provider.of<ContactProvider>(context,listen: false).removeNotes(index);
            }
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  // Create button
  Widget okButton = FlatButton(
    child: Text("ADD CONTACT"),
    onPressed: () {
      Provider.of<ContactProvider>(context,listen: false).addContact(name.text, number.text);
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ADD A NEW CONTACT"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: name,
          decoration: InputDecoration(hintText: "Enter Name"),
        ),
        TextField(
          controller: number,
          decoration: InputDecoration(hintText: "Enter Number"),
        ),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}