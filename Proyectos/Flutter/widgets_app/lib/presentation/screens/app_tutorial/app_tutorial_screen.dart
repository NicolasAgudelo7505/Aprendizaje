import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'busca la comida',
    'Exercitation eu sunt occaecat deserunt ipsum ex ullamco laborum. Cupidatat eu et esse sunt ex consectetur excepteur nostrud exercitation cupidatat minim exercitation pariatur. Amet enim veniam est fugiat incididunt aliquip id duis. Commodo duis mollit nulla laboris dolore dolor. Qui nostrud commodo voluptate qui voluptate. Dolore et cupidatat dolore tempor aute veniam amet consectetur elit nostrud. Nostrud sit commodo incididunt nulla cillum veniam cupidatat velit occaecat incididunt mollit.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Mollit non aliquip sunt laboris consectetur minim nisi nostrud ipsum. Aliquip exercitation ad et dolore nostrud quis incididunt reprehenderit et esse esse. Mollit aliquip esse ad velit sint. Excepteur fugiat officia incididunt qui occaecat ea do non ullamco non sint tempor labore veniam. Lorem voluptate commodo quis irure enim excepteur. Duis adipisicing proident non do officia voluptate occaecat magna est tempor.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'disfruta la comida',
    'Eu ipsum eu commodo eiusmod enim laborum cillum cillum ipsum quis dolor. Laboris ad sint in quis in. Qui laborum elit non nostrud. Reprehenderit duis Lorem officia consequat ad quis.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController=PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {

      final page = pageViewController.page ?? 0;
      if ( !endReached && page >= (slides.length -1.5)){
        setState(() {
            endReached=true;
        });
      }

    },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                ).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child:TextButton(
              child: Text ('Salir'),
              onPressed: ()=> context.pop(), 
              ) 
            ),

          endReached?
            Positioned(
              right: 30,
              bottom: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Comenzar'),
                  ),
              )
              ): SizedBox()

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle =Theme.of(context).textTheme.bodySmall;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl),),
          const SizedBox(height: 20,),
          Text(title, style: titleStyle,),
          const SizedBox(height: 10,),
          Text(caption, style: captionStyle,),
        ],
      ),
    );
  }
}
