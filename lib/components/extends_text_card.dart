import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wbc_detector/model/notice.dart';

// 공지사항에서 아래 화살표 누르면 확장되는 문자 카드 구현
class ExtendsTextCard extends StatefulWidget {
  final Notice item;
  const ExtendsTextCard({Key? key, required this.item}) : super(key: key);
  @override
  _ExtendsTextCardState createState() => _ExtendsTextCardState(item);
}

class _ExtendsTextCardState extends State<ExtendsTextCard> {
  _ExtendsTextCardState(this.item);
  final Notice item;
  bool isShow = false;
  void toggle() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 8),
                const SizedBox(width: 15),
                Text(item.title),
                const Spacer(),
                SizedBox(
                  width: 30,
                  child: IconButton(
                    // 6
                    onPressed: () {
                      toggle();
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/down-arrow.svg",
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 7
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.fastOutSlowIn,
            height: isShow ? 100 : 0,
            decoration: BoxDecoration(color: Colors.blue[200]),
            child: Center(child: Text("${item.contents}")),
          )
        ],
      ),
    );
  }
}
