import 'package:flutter/material.dart';
import 'package:conversion/component/drawer.dart';
import 'package:conversion/component/body.dart';
import 'package:conversion/component/expression.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    final title = [
        {0, '기본', 'Basic'}         //index : 0
        , {1, '길이', 'Basic_001'}, {1, '면적', 'Basic_002'}
        , {1, '체적', 'Basic_003'}, {1, '질량', 'Basic_004'}
        , {1, '시간', 'Basic_005'}, {1, '속도', 'Basic_006'}
        , {1, '각',   'Basic_007'}, {1, '유량', 'Basic_008'}
        , {1, '압력', 'Basic_009'}, {1, '진공압력', 'Basic_010'}
        , {1, '온도', 'Basic_011'}, {1, '온도차', 'Basic_012'}
      , {0, '에너지/전기/빛', 'light'} //index : 13
        , {2, '에너지'}, {2, '동력'}
        , {2, '전류'}, {2, '전압'}
        , {2, '자기장'}, {2, '정전용량'}
        , {2, '전하량'}, {2, '자속'}
        , {2, '각속도'}, {2, '인덕턴스'}
        , {2, '조도'}, {2, '휘도'}
      , {0, '물리/기계', 'physics'}      //index : 26
        , {3, '힘'}, {3, '비체적'}, {3, '밀도'}, {3, '비열'}
        , {3, '가속도'}, {3, '표면장력'}, {3, '비중량'}, {3, '토크'}
      , {0, '기계공학', 'machine'}       //index : 35
        , {4, '질량유량'}, {4, '엔탈피'}, {4, '엔트로피'}, {4, '확산계수'}
        , {4, '점성계수'}, {4, '동점성계수'}, {4, '열전도율'}, {4, '투과율'}
        , {4, '열유속'}, {4, '열저항'}, {4, '열저항율'}, {4, '열발생율'}
        , {4, '열용량'}, {4, '열전달계수'}, {4, '열밀도'}, {4, '열차폐'}
      , {0, '방사선', 'radiation'}        //index : 52
        , {5, '방사능'}, {5, '조사선량'}, {5, '등가선량'}, {5, '흡수선량'}
        , {5, '표면오염도'}, {5, '공기오염도'}, {5, '방사능농도'}
    ];

    ValueNotifier<bool> visibleYn01 = ValueNotifier<bool>(false);
    ValueNotifier<bool> visibleYn02 = ValueNotifier<bool>(false);
    ValueNotifier<bool> visibleYn03 = ValueNotifier<bool>(false);
    ValueNotifier<bool> visibleYn04 = ValueNotifier<bool>(false);
    ValueNotifier<bool> visibleYn05 = ValueNotifier<bool>(false);

    return MaterialApp(
      title: 'Conversion_if_units',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title: Text('단위 변환기', style: TextStyle(fontWeight: FontWeight.bold,),)),
          body: Body(),
          drawer: Drawer(
            child: ListView.builder(
                itemCount: title.length,
                itemBuilder: (BuildContext context, int index){

                  // 초기화 ( 선택없이 나갔을때 중분류 열려있는 이슈)
                  visibleYn01.value = false;
                  visibleYn02.value = false;
                  visibleYn03.value = false;
                  visibleYn04.value = false;
                  visibleYn05.value = false;

                  // index(1) = 기본
                  if(title[index].elementAt(0)==1){
                    return ValueListenableBuilder(
                      valueListenable: visibleYn01,
                      builder: (BuildContext context, bool value, Widget? child) {
                        return Visibility(
                          visible: visibleYn01.value,
                          child: ListTile(
                            title: Text(title[index].elementAt(1).toString()),
                            leading: Icon(Icons.arrow_right),
                            minLeadingWidth : 10,
                            visualDensity: VisualDensity(vertical: -3),
                            dense: true,
                            onTap: () {
                              Expression().setExpression(title[index].elementAt(2).toString());
                              Navigator.pop(context);
                              setState(() {});
                            },
                          ),
                        );
                      },
                    );
                  }
                  // index(2) = 에너지/전기/빛
                  if(title[index].elementAt(0)==2){
                    return ValueListenableBuilder(
                      valueListenable: visibleYn02,
                      builder: (BuildContext context, bool value, Widget? child) {
                        return Visibility(
                          visible: visibleYn02.value,
                          child: ListTile(
                            title: Text(title[index].elementAt(1).toString()),
                            leading: Icon(Icons.arrow_right),
                            minLeadingWidth : 10,
                            visualDensity: VisualDensity(vertical: -3),
                            dense: true,
                            onTap: () {},
                          ),
                        );
                      },
                    );
                  }
                  // index(3) = 물리/기계
                  if(title[index].elementAt(0)==3){
                    return ValueListenableBuilder(
                      valueListenable: visibleYn03,
                      builder: (BuildContext context, bool value, Widget? child) {
                        return Visibility(
                          visible: visibleYn03.value,
                          child: ListTile(
                            title: Text(title[index].elementAt(1).toString()),
                            leading: Icon(Icons.arrow_right),
                            minLeadingWidth : 10,
                            visualDensity: VisualDensity(vertical: -3),
                            dense: true,
                            onTap: () {},
                          ),
                        );
                      },
                    );
                  }
                  // index(4) = 기계공학
                  if(title[index].elementAt(0)==4){
                    return ValueListenableBuilder(
                      valueListenable: visibleYn04,
                      builder: (BuildContext context, bool value, Widget? child) {
                        return Visibility(
                          visible: visibleYn04.value,
                          child: ListTile(
                            title: Text(title[index].elementAt(1).toString()),
                            leading: Icon(Icons.arrow_right),
                            minLeadingWidth : 10,
                            visualDensity: VisualDensity(vertical: -3),
                            dense: true,
                            onTap: () {},
                          ),
                        );
                      },
                    );
                  }
                  // index(5) = 방사능
                  if(title[index].elementAt(0)==5){
                    return ValueListenableBuilder(
                      valueListenable: visibleYn05,
                      builder: (BuildContext context, bool value, Widget? child) {
                        return Visibility(
                          visible: visibleYn05.value,
                          child: ListTile(
                            title: Text(title[index].elementAt(1).toString()),
                            leading: Icon(Icons.arrow_right),
                            minLeadingWidth : 10,
                            visualDensity: VisualDensity(vertical: -3),
                            dense: true,
                            onTap: () {},
                          ),
                        );
                      },
                    );
                  }
                  // index(0)
                  ValueNotifier<bool> boolList = ValueNotifier<bool> (true);
                  return ValueListenableBuilder(
                      valueListenable: boolList,
                      builder: (BuildContext context, bool value, Widget? child) {
                        return ListTile(
                            title: Text(title[index].elementAt(1).toString()),
                            trailing: boolList.value ? Icon(Icons.add) : Icon(Icons.remove),
                            onTap: () {
                              if (title[index].elementAt(1).toString() ==
                                  title[0].elementAt(1).toString()) {
                                visibleYn01.value = !visibleYn01.value;
                                boolList.value = !boolList.value ;
                              }
                              else if (title[index].elementAt(1).toString() ==
                                  title[13].elementAt(1).toString()) {
                                visibleYn02.value = !visibleYn02.value;
                                boolList.value = !boolList.value ;
                              }
                              else if (title[index].elementAt(1).toString() ==
                                  title[26].elementAt(1).toString()) {
                                visibleYn03.value = !visibleYn03.value;
                                boolList.value = !boolList.value ;
                              }
                              else if (title[index].elementAt(1).toString() ==
                                  title[35].elementAt(1).toString()) {
                                visibleYn04.value = !visibleYn04.value;
                                boolList.value = !boolList.value ;
                              }
                              else if (title[index].elementAt(1).toString() ==
                                  title[52].elementAt(1).toString()) {
                                visibleYn05.value = !visibleYn05.value;
                                boolList.value = !boolList.value ;
                              }
                            }
                        );
                      }
                  );
                }
            ),
          )
      )
    );
  }
}