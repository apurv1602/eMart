import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/home_screen_controller.dart';
import 'package:emart/views/cart_screen/cart_screen.dart';
import 'package:emart/views/category_screen/category_screen.dart';
import 'package:emart/views/home_screen/home_screen.dart';
import 'package:emart/views/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeScreenController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];

    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: Container(
        child: Obx(
          () => navBody.elementAt(controller.currentNaveIndex.value),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNaveIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          items: navbarItem,
          onTap: (value) {
            controller.currentNaveIndex.value = value;
          },
        ),
      ),
    );
  }
}
