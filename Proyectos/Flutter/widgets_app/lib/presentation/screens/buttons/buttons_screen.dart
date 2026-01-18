import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name='buttons_screen'; 

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
            // navigator de flutter --------------------------------
          // Navigator.of(context).pop();
            // go router -------------------------------
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated button')),
            const ElevatedButton(onPressed: null, child:Text('Elevated Disabled')),
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.add_call),
              label: const Text('Elevated Icon'),
              ),
              FilledButton(onPressed: () {}, child: const Text('Filled')),
              FilledButton.icon(
                onPressed: () {}, 
                icon: const Icon(Icons.abc),
                label: const Text('Filled Icon'),
                ),
              OutlinedButton(onPressed: () {}, child: const Text('outlined')),
              OutlinedButton.icon(
                onPressed: () {}, 
                label: const Text('Outlined button icon'),
                icon:const Icon(Icons.terminal)
                ),
                TextButton(onPressed: (){}, child:const Text('text')),
                TextButton.icon(
                  onPressed: (){},
                  label:const Text('text icon'),
                  icon:const Icon(Icons.add_alert)
                  ),
                // TODO custom button

                IconButton(onPressed: () {}, icon:const Icon(Icons.app_registration_rounded)),
                IconButton(
                  onPressed: () {}, 
                  icon:const Icon(Icons.app_registration_rounded),
                  style: ButtonStyle(
                    backgroundColor:WidgetStatePropertyAll(colors.primary) 
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}