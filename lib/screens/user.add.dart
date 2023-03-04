import 'package:flutter/material.dart';
import 'package:gestion_contact/model/user.model.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ctrname = TextEditingController();
    final _ctrage = TextEditingController();

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
                controller: _ctrname,
                style: const TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    labelText: "Nom",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _ctrage,
                style: const TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    labelText: "Age",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    final user =
                        User(name: _ctrname.text, age: int.parse(_ctrage.text));
                  },
                  child: Container(
                    width: double.infinity,
                    child: const Icon(
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
