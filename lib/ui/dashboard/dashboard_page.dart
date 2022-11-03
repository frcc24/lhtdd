import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_page_controller.dart';

class DashboardPage extends GetView<DashboardPageController> {
  static const ROUTE = '/dashboard_page';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
