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
  ];
}
