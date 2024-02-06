import 'package:emart/consts/consts.dart';

Widget ourButton({
  onPress,
  color,
  textColor,
  label,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: EdgeInsets.all(12),
    ),
    onPressed: () {
      onPress(); // Corrected to invoke the function
    },
    child: "$label".text.color(textColor).fontFamily(bold).make(),
  );
}
