// import 'package:flutter/material.dart';
// import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
// import 'package:request/screens/HistoryRequest.dart';
// import 'package:request/screens/Homepage.dart';

// class Navigation extends StatefulWidget {
//   @override
//   _NavigationState createState() => _NavigationState();
// }

// class _NavigationState extends State<Navigation> {
//   int _selectedIndex = 0;
//   PageController _pageController = PageController();

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.black38,
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         children: [
//           HistoryRequest(),
//         ],
//       ),
//       bottomNavigationBar: ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(50.0),
//           topRight: Radius.circular(50.0),
//         ),
//         child: Container(
//           height: screenHeight * 0.08,
//           decoration: BoxDecoration(
//             color: Colors.black38,
//           ),
//           child: FlashyTabBar(
//             backgroundColor: Colors.black,
//             selectedIndex: _selectedIndex,
//             showElevation: true,
//             onItemSelected: (index) {
//               setState(() {
//                 _selectedIndex = index;
//                 _pageController.jumpToPage(index);
//               });
//             },
//             items: [
//               FlashyTabBarItem(
//                 icon: Icon(Icons.home, color: Colors.white),
//                 title: Text('Home', style: TextStyle(color: Colors.white)),
//               ),
//               FlashyTabBarItem(
//                 icon: Icon(Icons.history, color: Colors.white),
//                 title: Text('History', style: TextStyle(color: Colors.white)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
