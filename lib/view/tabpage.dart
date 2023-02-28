import 'package:flutter/material.dart';
import 'package:verzeo_minor_project/view/productdescription.dart';
import 'package:verzeo_minor_project/view/profilepage.dart';
import 'package:verzeo_minor_project/view/shoppage.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabPage();
  }
}

class _TabPage extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text(
                                    'Are you sure you want to log out?'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Yes')),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: const Text('No'))
                                ],
                              ));
                    },
                    icon: const Icon(Icons.logout_sharp))
              ],
              title: const Text('Mini E-Commerce',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black)),
              bottom: const TabBar(tabs: [
                Tab(
                  text: 'Profile',
                  icon: Icon(Icons.person),
                ),
                Tab(
                  text: 'Shop',
                  icon: Icon(Icons.shop),
                ),
                Tab(
                  text: 'Product Description',
                  icon: Icon(Icons.production_quantity_limits),
                ),
              ]),
            ),
            body: const TabBarView(children: [
              ProfilePage(),
              ShopPage(),
              ProductDescription(),
            ]),
          )),
    );
  }
}
