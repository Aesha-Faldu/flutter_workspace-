// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class navigationDrawer extends StatefulWidget{
//   @override
//   navigationState createState() => navigationState();
//
// }
//
// class navigationState extends State<navigationDrawer>{
//
//
//
//
//   int _selectedIndex=0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:  AppBar(title: Text("NavigationDrawer"),backgroundColor: Colors.brown,),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             UserAccountsDrawerHeader(
//               accountName:Text("Aesha Faldu") ,
//               accountEmail: Text("falduaesha2002@gmail.com"),
//             currentAccountPicture:CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Text("A"),
//             ) ,),
//
//             ListTile(leading: Icon(Icons.person ),title: Text("My Profile"),onTap:() {Navigator.pop(context);}),
//             ListTile(leading: Icon(Icons.shopping_cart_rounded),title: Text("My Cart"),onTap:() {Navigator.pop(context);}),
//             ListTile(leading: Icon(Icons.compare_arrows_outlined ),title: Text("My Trasaction"),onTap:() {Navigator.pop(context);}),
//             ListTile(leading: Icon(Icons.paid_outlined ),title: Text("Subscription"),onTap:() {Navigator.pop(context);}),
//             ListTile(leading: Icon(Icons.people_outline_sharp),title: Text("About Us"),onTap:() {Navigator.pop(context);}),
//             ListTile(leading: Icon(Icons.call),title: Text("Contact Us"),onTap:() {Navigator.pop(context);}),
//             ListTile(leading: Icon(Icons.task_rounded),title: Text("Terms&Condition"),onTap:() {Navigator.pop(context);}),
//             ListTile(leading: Icon(Icons.save_as_sharp),title: Text("Privacy Policy"),onTap:() {Navigator.pop(context);}),
//             ListTile(leading: Icon(Icons.location_on_outlined),title: Text("Change City"),onTap:() {Navigator.pop(context);}),
//             ListTile(leading: Icon(Icons.logout_outlined),title: Text("logout"),onTap:() {Navigator.pop(context);}),
//
//
//
//
//
//
//
//           ],
//         ),
//       ),
//
//
//     bottomNavigationBar: BottomNavigationBar(
//     items:
//     [
//
//     BottomNavigationBarItem(icon: Icon(Icons.home_sharp),label: "Home",backgroundColor:Colors.deepPurpleAccent ),
//     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart",backgroundColor:Colors.deepPurpleAccent),
//     BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile",backgroundColor:Colors.deepPurpleAccent),
//
//
//     ],
//     type:BottomNavigationBarType.fixed,
//     currentIndex: _selectedIndex,
//     selectedItemColor: Colors.black,
//     iconSize: 40,
//     onTap: _onItemTapped,
//     elevation: 5,
//     ),
//
//     );
//   }
//
//   void _onItemTapped(int value)
//   {
//     setState(() {
//       _selectedIndex = value;
//     });
//   }
//
// }
//
//















import 'package:flutter/material.dart';

class navigationDrawer extends StatefulWidget {
  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<navigationDrawer> {
  int _selectedIndex = 0;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  // ];

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
