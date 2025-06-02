import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({
    super.key, 
    required this.currentIndex
  });

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/$index');
        break;
      case 1:
        context.go('/home/$index');
        break;
      case 2:
        context.go('/home/$index');
        break;
      default:
        context.go('/home/0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => onItemTapped(context, index),
      currentIndex: currentIndex,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.desktop_windows_outlined),
          activeIcon: Icon(Icons.desktop_windows),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.rocket_launch_outlined), 
          activeIcon: Icon(Icons.rocket_launch_rounded), 
          label: 'Populares',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline), 
          activeIcon: Icon(Icons.favorite), 
          label: 'Favoritos',
        ),
      ]
    );
  }
}