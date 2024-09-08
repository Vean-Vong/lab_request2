import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/my_drawer.dart';
import 'notifiction_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        backgroundColor: Colors.grey[100],
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => Notifications());
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],

      // Drawer
      drawer: const CustomDrawer(),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
