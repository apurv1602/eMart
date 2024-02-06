import 'package:emart/views/category_screen/item_details.dart';
import 'package:emart/widgets_common/bg_widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:get/get.dart';

class CategoriesDetail extends StatelessWidget {
  final String? title;
  const CategoriesDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      6,
                      (index) => "Baby Clothing"
                          .text
                          .size(12)
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .makeCentered()
                          .box
                          .white
                          .rounded
                          .size(120, 60)
                          .margin(EdgeInsets.symmetric(horizontal: 4))
                          .make()),
                ),
              ),

              // Item Container

              20.heightBox,

              Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.asset(
                              imgP5,
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            "Laptop 4GB/64GB"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            10.heightBox,
                            "\$600"
                                .text
                                .color(redColor)
                                .fontFamily(bold)
                                .size(16)
                                .make()
                          ],
                        )
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .outerShadowSm
                            .roundedSM
                            .padding(const EdgeInsets.all(12))
                            .make()
                            .onTap(() {
                          Get.to(() => ItemDetail(title: "Laptop 4GB/64GB"));
                        });
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
