import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//옵션에 사용하는 글씨 버튼들
class TextMenuCard extends StatelessWidget {
  //입력받을 요소
  final String? title;
  final String? icon;
  final GestureTapCallback? press;
  final Color? textColor;
  final Color? iconColor;

  //생성자
  const TextMenuCard({
    Key? key,
    this.title,
    this.icon,
    this.press,
    this.textColor = Colors.black,
    this.iconColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title ?? "",
                style: TextStyle(color: textColor, fontSize: 16),
              ),
              Spacer(),
              SizedBox(
                width: 26,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    icon ?? "assets/icons/right-arrow.svg",
                    color: iconColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
