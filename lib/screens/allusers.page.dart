import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_contact/model/user.model.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {

    List<User> allUsers = [];
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').orderBy('name').snapshots(),

        builder: (context,snp){
          if(snp.hasError){
            return Center(child: Text("Error"),);
          }
          if(snp.hasData){
            // return C
            allUsers = snp.data!.docs
                .map((doc) => User.fromJson(doc.data() as Map<String,dynamic>)).toList();

            return ListView.builder(
              itemCount: allUsers.length,
                itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber,
                      //pour afficher les deux premier caractere
                      child: Text(allUsers[index].name.substring(0,2).toUpperCase(),style:  TextStyle(fontWeight: FontWeight.bold ) ,),
                    ),
                      title: Text(allUsers[index].name, style: TextStyle(fontSize: 22),),
                    subtitle:  Text(allUsers[index].age.toString()),

                  ),
                );
                }
                  );
          }else{
            return Center(child: CircularProgressIndicator());

          }
        },
      ),
    );
  }
}
