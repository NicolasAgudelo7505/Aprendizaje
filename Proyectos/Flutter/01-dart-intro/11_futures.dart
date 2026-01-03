void main (){
  print('inicio del main');
  
  httpGet('https://fernando-herrera.com/cursos').then( (value){
    print(value);
  }).catchError((err){
    print('Error:$err');
  });
  
  print('fin del programa');
}

Future<String> httpGet (String url){
  return Future.delayed(const Duration(seconds: 1),(){
    throw 'Error en la petición htpp';
    return 'respuesta de la petición http';
  });
}