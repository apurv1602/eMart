import 'package:emart/consts/consts.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.color(darkFontGrey).fontFamily(bold).size(16).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make()
    ],
  ).box.white.rounded.padding(EdgeInsets.all(4)).height(80).width(width).make();
}
