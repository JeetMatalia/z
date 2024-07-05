import 'package:flutter/material.dart';
import 'package:material_ui_3/screens/buttons.dart';

class Communication extends StatelessWidget {
  const Communication({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
          child: Column(
            children: [

              // Badge
              Text('Badge', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  // Double digit badge
                  Badge(label: Text('69'),child: Icon(Icons.email_rounded)),

                  // Single digit badge
                  Badge(label: Text('4'),child: Icon(Icons.notifications)),

                  // Simple badge
                  Badge(child: Icon(Icons.home))
                ],
              ),

              const Divider(height: 12),
              const SizedBox(height: 20),

              // Progress Indicator
              Text('Progress Indicator', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 12),

              // Circular Progress Indicator
              const CircularProgressIndicator(),
              const SizedBox(height: 12),

              // Linear Progress Indicator
              const LinearProgressIndicator(),

              const Divider(height: 12),
              const SizedBox(height: 20),

              // Snackbar
              Text('Snackbar', style: Theme.of(context).textTheme.headlineMedium),

              // Button to show Snackbar
              FilledButton.tonalIcon(
                label: const Text('Show Snackbar'),
                icon: const Icon(Icons.message_outlined),
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('This is SnackBar'),
                      action: SnackBarAction(
                          label: 'Okay',
                          onPressed: (){
                            Communication();
                          }
                      ),
                    )
                  );
                },
              )
            ],
          )
      ),
    );
  }
}
