class User{

  String id ;
  String name;
  int age;


  User({required this.id, required this.name, required this.age});

  //Convertir une collection en Objet
  factory User.fromJson(Map<String,dynamic> json){
    // return User(id: json['id'], name: json['name'], age: json['age']);
    return User(id: json['id'], name: json['name'], age: json['age']);
  }




  // a partir d'un Objet User la methode toJson
  // va retourner une collection

  Map<String,dynamic> toJson(){

    return{
      'id' : id,
      'name' : name,
      'age' : age
    };
  }
}