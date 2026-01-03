void main (){
  print(greetEveryone());
  
  print('Suma ${addTwonumbersOptional(10,20)}');
  
  print (greetPerson(name: 'nicolás'));
}

String greetEveryone () => 'hello everyone!';

// int addTwonumbers(int a, int b){
//   return a+b;
// }

int addTwonumbers (int a, int b)=>a+b;
int addTwonumbersOptional (int a, [int b=0]){
//   b??=0
  return a+b;
}

String greetPerson({required String name, String message='hola'}){
  return '${message},${name}';
}
