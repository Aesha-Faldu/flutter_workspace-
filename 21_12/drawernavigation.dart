
import 'package:flutter/material.dart';

class navigationDrawer extends StatefulWidget {
  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<navigationDrawer> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NavigationDrawer",style: TextStyle(color: Colors.white),), backgroundColor: Colors.deepPurple),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Aesha Faldu"),
              accountEmail: Text("falduaesha2002@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("A"),
              ),
            ),
            buildListTile(Icons.person, "My Profile"),
            buildListTile(Icons.shopping_cart_rounded, "My Cart"),
            buildListTile(Icons.compare_arrows_outlined, "My Transaction"),
            buildListTile(Icons.paid_outlined, "Subscription"),
            buildListTile(Icons.people_outline_sharp, "About Us"),
            buildListTile(Icons.call, "Contact Us"),
            buildListTile(Icons.task_rounded, "Terms & Condition"),
            buildListTile(Icons.save_as_sharp, "Privacy Policy"),
            buildListTile(Icons.location_on_outlined, "Change City"),
            buildListTile(Icons.logout_outlined, "Logout"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "Home", backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart", backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile", backgroundColor: Colors.deepPurple),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Widget buildListTile(IconData icon, String title) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          Navigator.pop(context);
        },
        hoverColor: Colors.deepPurple // Set the hover color here
      ),
    );
  }
}
