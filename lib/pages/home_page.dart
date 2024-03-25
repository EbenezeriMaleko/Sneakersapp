import 'package:flutter/material.dart';
import 'package:sneakersapp/components/bottom_nav_bar.dart';
import 'package:sneakersapp/pages/cart_page.dart';
import 'package:sneakersapp/pages/shop_page.dart';


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
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page

    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomBar(
        onTabChange: (index) => navBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) =>  IconButton(         
              icon: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //logo
                DrawerHeader(
                  child:Image.asset(
                    'lib/Images/logo01.png',
                    color: Colors.white,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: Colors.grey[800],
                    ),
                  ),

                //other pages
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white,),
                    title: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white
                        ),
                      ),
                    ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info, 
                      color: Colors.white,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(
                        color: Colors.white
                        ),
                      ),
                    ),
                ),
              ],
            ),


            const Padding(
             padding: EdgeInsets.only(left: 25.0, bottom: 25),
             child: ListTile(
              leading: Icon(
                Icons.logout, 
                color: Colors.white,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white
                  ),
                ),
              ),
           ),

        ],),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
