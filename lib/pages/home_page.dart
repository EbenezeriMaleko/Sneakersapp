import 'package:flutter/material.dart';
import 'package:sneakersapp/components/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //index to control nav bar
  int _selectedIndex = 0;

  //Update the selected index
  //When bottom bar taped

  void navBottomBar(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //page to display
  // final List<Widget> _Page = [
  //   //shop page
  //   const ShopPage(),
  // ]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomBar(
        onTabChange: (index) => navBottomBar(index),
      ),
    );
  }
}
