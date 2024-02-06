import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/views/profile_screen/components/details_button.dart';
import 'package:emart/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //edit profile
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.edit,
                      color: whiteColor,
                    )),
              ),

              //users detail section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset(
                      imgProfile2,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Dummy user".text.fontFamily(semibold).white.make(),
                          "customer@gmail.com".text.white.make()
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: whiteColor),
                      ),
                      onPressed: () {},
                      child: logout.text.fontFamily(semibold).white.make(),
                    ),
                  ],
                ),
              ),

              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(
                      width: context.screenWidth / 3.4,
                      count: "00",
                      title: "in your cart"),
                  detailsCard(
                      width: context.screenWidth / 3.4,
                      count: "00",
                      title: "in your widh list"),
                  detailsCard(
                      width: context.screenWidth / 3.4,
                      count: "00",
                      title: "yours order")
                ],
              ),

              //button section
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonIcon[index],
                      width: 22,
                    ),
                    title: "${profileButtonList[index]}"
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: lightGrey,
                  );
                },
                itemCount: profileButtonList.length,
              )
                  .box
                  .white
                  .rounded
                  .margin(EdgeInsets.all(12))
                  .padding(EdgeInsets.symmetric(horizontal: 16))
                  .shadowSm
                  .make()
                  .box
                  .color(redColor)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
