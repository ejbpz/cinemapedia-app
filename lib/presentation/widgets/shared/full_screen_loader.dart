import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  final List<String> messages = [
    'Cargando películas',
    'Comprando palomitas',
    'Cargando populares',
    'No falta mucho',
    'Ya casi...',
  ];

  Stream<String> getLoadingMessages() {
    return Stream.periodic(
      const Duration(milliseconds: 1200), (step) {
        return messages[step];
      }
    ).take(messages.length);
  }

  FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshot) {
              if(!snapshot.hasData) return const Text('Cargando...');

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}