import 'package:flutter/material.dart';
import 'package:wbc_detector/components/extends_text_card.dart';
import 'package:wbc_detector/model/notice.dart';

//공지사항 페이지
class NoticePage extends StatelessWidget {
  static String routeName = "/notice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("공지사항"),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      //body: Center(child: Text("notice page")),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Divider(height: 12, color: Colors.grey[200], thickness: 12),
          ),
          SliverList(
            //공지사항 리스트 생성
            delegate: SliverChildListDelegate(List.generate(
                notice.length,
                (index) => ExtendsTextCard(
                      item: notice[index],
                    ))),
          ),
        ],
      ),
    );
  }
}
