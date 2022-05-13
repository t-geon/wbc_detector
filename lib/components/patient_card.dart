import 'package:flutter/material.dart';
import 'package:wbc_detector/model/patient.dart';
import 'package:wbc_detector/pages/list/list_detail_page.dart';

PatientDetail select = Null as PatientDetail;

class PatientCard extends StatelessWidget {
  const PatientCard({
    Key? key,
    required this.details,
  }) : super(key: key);

  final PatientDetail details;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //해당 환자 목록 누르면 상세정보 창으로 넘어간다.
        select = details;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListDetailPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        //환자 검사목록 중 1개 구성
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  details.name, //환자 이름
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(details.content), //환자 문구(설명)
                contentPadding: const EdgeInsets.all(0),
              ),
            ),
            Column(
              children: [
                Text(
                  details.time, //환자 검사 시간
                  style: TextStyle(color: Color(0xFFa5a5a5), fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
