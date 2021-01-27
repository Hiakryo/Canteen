import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Views/home.dart';
import 'package:flutter_app/Components/Views/tenants.dart';
import 'package:flutter_app/Components/globals.dart' as globals;

import 'VIews/point.dart';
import 'Views/profile.dart';
import 'Views/qr.dart';

class BottomNavbar extends StatefulWidget {
  @override
  BottomNavbarState createState() => BottomNavbarState();
}

class BottomNavbarState extends State<BottomNavbar> {
  List<Widget> _pages;
  PageController _pageController;
  var _selectedPageIndex;

  @override
  void initState() {
    super.initState();

    _selectedPageIndex = 0;

    _pages = [
      MainScreen(),
      TenantsScreen(),
      QRViewExample(),
      PointScreen(),
      Profile()
    ];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.qr_code),
            label: 'QR',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.monetization_on_rounded),
            label: 'Point',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedPageIndex,
        onTap: (selectedPageIndex) {
          setState(() {
            _selectedPageIndex = selectedPageIndex;
            _pageController.jumpToPage(selectedPageIndex);
          });
        },
        // onChange: (val) {
        //   setState(() {
        //     _selectedPageIndex = val;
        //   });
        // },
        // defaultSelectedIndex: 0,
      ),
    );
  }
}

// class CustomBottomNavigationBar extends StatefulWidget {
//   final int defaultSelectedIndex;
//   final Function(int) onChange;
//   final List<IconData> iconList;

//   CustomBottomNavigationBar(
//       {this.defaultSelectedIndex = 0,
//       @required this.iconList,
//       @required this.onChange});

//   @override
//   _CustomBottomNavigationBarState createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   List<IconData> _iconList = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _iconList = widget.iconList;
//   }

// @override
// Widget build(BuildContext context) {
//   List<Widget> _navBarItemList = [];

//   for (var i = 0; i < _iconList.length; i++) {
//     _navBarItemList.add(buildNavBarItem(_iconList[i], i));
//   }

//   return Row(
//     children: _navBarItemList,
//   );
// }

// Widget buildNavBarItem(IconData icon, int index) {
//   return GestureDetector(
//     onTap: () {
//       widget.onChange(index);
//       setState(() {
//         globals.globalIndex = index;
//         _pageController.jumpToPage();
//         globals.globalIndex = index;
//       });
//       // switch (globals.globalIndex) {
//       //   case 0:
//       //     Navigator.push(
//       //         context, MaterialPageRoute(builder: (context) => Home()));
//       //     break;
//       //   case 1:
//       //     Navigator.push(context,
//       //         MaterialPageRoute(builder: (context) => TenantsScreen()));
//       //     break;
//       //   case 2:
//       //     Navigator.push(context,
//       //         MaterialPageRoute(builder: (context) => TenantsScreen()));
//       //     break;
//       //   case 3:
//       //     Navigator.push(context,
//       //         MaterialPageRoute(builder: (context) => TenantsScreen()));
//       //     break;
//       //   case 4:
//       //     Navigator.push(
//       //         context, MaterialPageRoute(builder: (context) => Profile()));
//       //     break;
//       //   default:
//       // }
//     },
//     child: Container(
//       height: 60,
//       width: MediaQuery.of(context).size.width / _iconList.length,
//       decoration: index == globals.globalIndex
//           ? BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(width: 4, color: Colors.green),
//               ),
//               gradient: LinearGradient(colors: [
//                 Colors.green.withOpacity(0.3),
//                 Colors.green.withOpacity(0.015),
//               ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
//               // color: index == _selectedItemIndex ? Colors.green : Colors.white,
//               )
//           : BoxDecoration(),
//       child: Icon(
//         icon,
//         color: index == globals.globalIndex ? Colors.black : Colors.grey,
//       ),
//     ),
//   );
// }
