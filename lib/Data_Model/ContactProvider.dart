import 'package:flutter/cupertino.dart';
import 'package:contact/Data_Model/Contact.dart';

class ContactProvider extends ChangeNotifier {

  //Contact List
 List<Contact> _contact = new List<Contact>();

 List<Contact> get getContact{
     return _contact;
   }
  
  // function to add data to list of contact 
   void addContact(String name, String number)
   {
     Contact contact = new Contact(name, number);
       
          _contact.add(contact);
       
           notifyListeners();
        }
       
        // function to remove or delete notes by using list index position
        void removeNotes(int index)
        {
          _contact.removeAt(index);
          notifyListeners();
        }
       
       
       }
     
    
