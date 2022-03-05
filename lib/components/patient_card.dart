import 'package:flutter/material.dart';
import 'package:wbc_detector/model/patient.dart';
import 'package:wbc_detector/pages/list/list_detail_page.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    Key? key,
    required this.patient,
  }) : super(key: key);

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //해당 환자 목록 누르면 상세정보 창으로 넘어간다.
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
                leading: CircleAvatar(
                  //환자 사진
                  radius: 25,
                  backgroundImage: NetworkImage(patient.image),
                ),
                title: Text(
                  patient.title, //환자 이름
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(patient.content), //환자 문구(설명)
                contentPadding: const EdgeInsets.all(0),
              ),
            ),
            Column(
              children: [
                Text(
                  patient.time, //환자 검사 시간
                  style: TextStyle(color: Color(0xFFa5a5a5), fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                if (patient.count != "0") // 1
                  Container(
                    //채팅에서 메세지 개수 뜨는건데 없어도 될 듯
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFde6344)),
                    child: Text(
                      patient.count,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
