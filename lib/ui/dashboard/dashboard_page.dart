import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_page_controller.dart';

class DashboardPage extends GetView<DashboardPageController> {
  static const ROUTE = '/dashboard_page';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts_h5 = Theme.of(context).textTheme.headline6;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              color: Colors.white70,
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: const [
                  Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/login_bg.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.0),
                    child: Image(
                      image: AssetImage('assets/logo4u.png'),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Icon(
                  Icons.dashboard,
                  color: Colors.white70,
                ),
                title: Text(
                  'Dashboard',
                  style: ts_h5,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Icon(
                  Icons.leaderboard_rounded,
                  color: Colors.white70,
                ),
                title: Text(
                  'Leads',
                  style: ts_h5,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Icon(
                  Icons.book,
                  color: Colors.white70,
                ),
                title: Text(
                  'Students',
                  style: ts_h5,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Icon(
                  Icons.integration_instructions,
                  color: Colors.white70,
                ),
                title: Text(
                  'Instructor',
                  style: ts_h5,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Icon(
                  Icons.insert_chart,
                  color: Colors.white70,
                ),
                title: Text(
                  'Courses',
                  style: ts_h5,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Icon(
                  Icons.camera_front_outlined,
                  color: Colors.white70,
                ),
                title: Text(
                  'Access Control',
                  style: ts_h5,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white70,
                ),
                title: Text(
                  'Logout',
                  style: ts_h5,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
    );
  }
}
