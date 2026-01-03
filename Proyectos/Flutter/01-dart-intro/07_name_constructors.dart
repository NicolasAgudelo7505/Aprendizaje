void main () {
  
  // Constructores con nombre.
  
  // Objeto con mapa.
   final Map<String, dynamic> rawJson = {
    "name": "Spiderman",
    "power": "Dinero",
    "isAlive": true    
  };
  
  // Instancia de la clase Hero, en la cual se llama el "constructor con nombre" y se le pasa el "Objeto con mapa".
  final ironman = Hero.fromJson( rawJson );
  
  // Se imprime la instancia.
  print ( ironman );  
}
  // Esta es la clase llamada "Hero" con sus atributos y un método.
class Hero {

  // Estos son los atributos de la clase Hero.
String name;
String power;
bool isAlive;
  
  // Este es un constructor normal de la clase.
  Hero({
    required this.name, 
	  required this.power,
    required this.isAlive
	});  
  
  @override
  String toString (){    
    return "$name, $power, isAlive: ${ isAlive ? "YES!":"Nope" }";    
  }  
  
  // Este es el constructor con nombre de la clase Hero.
  Hero.fromJson( Map<String, dynamic> json)    
    : name = json ["name"] ?? "No name encontrado",
      power = json ["power"] ?? "No power encontrado",
      isAlive = json ["isAlive"] ?? "No isAlive encontrado";   
}