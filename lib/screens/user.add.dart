import 'package:flutter/material.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un Utilisateur"),

      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  fontSize: 22
                ),
                decoration: InputDecoration(

                  labelText:  "Nom",
                  border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(40)))

                ),
              ),

              SizedBox( height: 20,),

              TextField(
                style: TextStyle(
                    fontSize: 22
                ),
                decoration: InputDecoration(

                    labelText:  "Age",
                    border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(40)))

                ),
              ),

              SizedBox( height: 20,),

              ElevatedButton(
                  onPressed: (){},
                  child: Container(
                    width: double.infinity,
                      child: Icon(
                        Icons.add,
                        size: 32,
                      ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
