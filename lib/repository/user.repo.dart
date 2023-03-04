
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_contact/model/user.model.dart';

Future addUser(User user) async{
  
  final docUser = FirebaseFirestore.instance.collection("users").doc();

  user.id = docUser.id;
  await docUser.set(user.toJson());
}
//Methode pour la mis ajour

Future updateUser(User user)async{
  final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);
  await docUser.update(user.toJson());
}


//Methode de suppression
Future deleteUser(String id)async{

final docUser =FirebaseFirestore.instance.collection("users").doc(id);
await docUser.delete();
}
