import 'package:flutter/material.dart';
import 'package:gestion_contact/repository/user.repo.dart';

import '../../model/user.model.dart';

class ListUsers extends StatefulWidget {
  List<User> users;
  ListUsers({required this.users});


  // const ListUsers({Key? key}) : super(key: key);

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {

  get allUsers => widget.users;
  final _ctrupdatename=TextEditingController();
  final _ctrupdateage=TextEditingController();


  @override
  Widget build(BuildContext context) {





    return  ListView.builder(
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
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            title: Text("Modifer : ${allUsers[index].name}"),
                            content: SingleChildScrollView(
                              child: Container(
                                //fixer la taille
                                height: 250,
                                child: Column(
                                  children: [
                                    TextField(
                                      style: TextStyle(fontSize: 22, color:  Colors.blue,),
                                      decoration: InputDecoration(
                                        labelText: "Name",
                                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
                                      controller: _ctrupdatename,


                                    ),
                                    SizedBox(height: 20,),
                                    TextField(
                                      style: TextStyle(fontSize: 22, color:  Colors.blue,),
                                      decoration: InputDecoration(
                                          labelText: "Age",
                                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
                                      controller: _ctrupdateage,
                                    ),
                                    SizedBox(height: 20,),
                                    ElevatedButton(onPressed: (){
                                     final user = User( id: allUsers[index].id,
                                         name: _ctrupdatename.text, age: int.parse(_ctrupdateage.text));
                                     updateUser(user);
                                    },
                                        child: Container(width: double.infinity,
                                          child: Text("Mettre A jour"),))


                                  ],
                                ),

                              ),
                            ),
                            actions: [
                              ElevatedButton(onPressed: (){
                                Navigator.pop(context,"Annuler");
                              }, child: Text("Annuler"))
                            ],
                          ),
                      );
                    },
                    child: Icon(Icons.edit,size: 32, color: Colors.green,),
                  ),
                  TextButton(
                    onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            title: Text("Voulez-vous vraiment supprimer  ${allUsers[index].name}?"),
                            actions: [
                              ElevatedButton(onPressed:() {
                                deleteUser(allUsers[index].id);
                                Navigator.pop(context,"Oui");

                              },
                                  child: Text('Oui')),
                              ElevatedButton(onPressed:() {
                                Navigator.pop(context,"Annuler");
                              },
                                  child: Text('Non')),
                            ],

                          ));
                    },
                    child: Icon(Icons.delete,size: 32, color: Colors.red,),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
