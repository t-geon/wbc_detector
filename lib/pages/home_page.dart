import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wbc_detector/constants.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("홈"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: xl_gap),
            Text(
              'WBC Detector with DVS',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: xl_gap),
            ElevatedButton(
              //파일선택 클릭시 파일 선택할 수 있도록 만들기
              style: ElevatedButton.styleFrom(
                primary: PrimaryColor,
                padding: EdgeInsets.all(16),
              ),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles();
                //final result = await FilePicker.platform.pickFiles(allowMultiple: true);
                //위 코드는 파일 여러개 선택
                if (result == null) return; //아무것도 선택 안함

                //하나의 파일 open
                final file = result.files.first;
                //openFile(file);

                print('Name: ${file.name}');
                print('Bytes: ${file.bytes}');
                print('Size: ${file.size}');
                print('Extension: ${file.extension}');
                print('Path: ${file.path}'); //파일을 읽어서 캐시에 옮긴 경로
                //한번 끄면 캐시에서 지워지기 때문에 계속 사용은 불가

                final newFile =
                    await saveFilePermanently(file); //파일을 newFile에 반환

                print('From Path: ${file.path}'); //원래 파일
                print('To Path: ${newFile.path}'); //파일을 영구적으로 보관하는 경로
              },
              child: Text(
                "aedat4.0 파일 선택",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //파일을 영원히 저장하는 함수
  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory(); //저장소 할당
    final newFile =
        File('${appStorage.path}/${file.name}'); //새 위치 생성(디렉토리이름/파일이름)

    return File(file.path!).copy(newFile.path); //새 파일 내부에 파일 복사후 반환
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
