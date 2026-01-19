import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();

      final snackBar = SnackBar(
        duration:const Duration(seconds: 2),
        content: const Text('hola mundo'),
        action: SnackBarAction(label: 'Ok!', onPressed: (){}),
        persist: false,

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


void openDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: false ,
    builder: (context) => AlertDialog(
      title: const Text('Estás seguro?'),
      content: const Text('Minim fugiat dolore duis ad sit occaecat laboris amet labore irure deserunt. Ea voluptate duis irure commodo deserunt pariatur sit labore excepteur fugiat sint. Officia anim cillum occaecat occaecat velit fugiat Lorem sint culpa proident velit est anim fugiat. Incididunt pariatur reprehenderit irure cillum incididunt eiusmod velit magna incididunt et cillum. Aliqua anim ex eu esse voluptate enim nulla velit est exercitation magna laborum. Quis officia minim irure eiusmod ad sit nisi consequat anim aliquip. Ex irure veniam id veniam labore consequat minim do occaecat est commodo.'),
      actions: [
        TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),
        TextButton(onPressed: ()=> context.pop(), child: const Text('Aceptar')),
      ],
    ),
    );
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Mollit consequat anim sint magna tempor incididunt deserunt magna pariatur culpa. Lorem adipisicing deserunt eu aliquip minim occaecat non adipisicing ex culpa sunt. Eiusmod laborum ipsum anim velit minim sit anim. Elit esse voluptate eiusmod aliquip velit ut incididunt. Tempor reprehenderit est dolor voluptate pariatur cupidatat laborum. Proident aliquip elit mollit consectetur amet anim consectetur occaecat nisi dolore sit elit.')
                  ]
                  );
              }, 
              child: Text('Licencias Usadas')),

            FilledButton.tonal(
              onPressed: ()=> openDialog(context), 
              child: Text('Mostrar diálogo')),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackBar(context),
      ),
    );
  }
}