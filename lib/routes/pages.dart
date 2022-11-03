import 'package:get/get.dart';

import '../ui/ui.dart';

List<GetPage> getAppPages() {
  return [
    // Initial pages
    GetPage<void>(
      name: LoginPage.ROUTE,
      page: () => const LoginPage(),
      binding: BindingsBuilder<void>(() => Get.lazyPut<LoginPageController>(
          () => LoginPageController(),
          fenix: true)),
    ),
    GetPage<void>(
      name: DashboardPage.ROUTE,
      page: () => const DashboardPage(),
      binding: BindingsBuilder<void>(() => Get.lazyPut<DashboardPageController>(
          () => DashboardPageController(),
          fenix: true)),
    ),
  ];
}
