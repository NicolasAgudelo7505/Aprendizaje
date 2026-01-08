import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  int clickCounter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true, 
      title: const Text('Counter functions'),
      // en el action se reciben varios widgets por ejemplo iconos, se podría hacer un row si se necesita poner varios
      actions: [
        IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: (){
              setState(() {
                clickCounter=0;  
              });
            }),
      ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter', 
              style: const TextStyle(
              fontSize: 160, 
              fontWeight: FontWeight.w100)),
            Text('Click${clickCounter ==1? '':'s'}', style: const TextStyle(fontSize: 25)),

            // igual pero con if
            // if (clickCounter==1) 
            //   Text('Click', style: const TextStyle(fontSize: 25)),
            // if (clickCounter!=1)
            //   Text('Clicks',style: const TextStyle(fontSize: 25)),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(icon: Icons.refresh_rounded,
          onPressed: () {
            clickCounter=0;
            setState(() {});
          },
          ),  
          const SizedBox(height: 10,),
          CustomButton(icon: Icons.exposure_minus_1,
          onPressed: () {
            if (clickCounter==0)return;
            clickCounter--;
            setState(() {});
          },
          ),
          const SizedBox(height: 10,),
          CustomButton(icon: Icons.plus_one,
          onPressed: () {
            clickCounter++;
            setState(() {});
          },
          ),
        ],
      )
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;


  const CustomButton({
    super.key, 
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 5,
      shape:const StadiumBorder(),
      onPressed: onPressed,
      child:Icon(icon),
    );
  }
}