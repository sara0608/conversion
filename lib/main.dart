import 'package:flutter/material.dart';
import 'dart:async';

import 'package:conversion/component/body.dart';
import 'package:conversion/component/expression.dart';
import 'package:conversion/component/userSetting.dart';
import 'package:conversion/component/conversion.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  final title = [
    {0, '기본', 'Basic'}         //index : 0
    , {1, '길이', 'Basic_001'}, {1, '면적', 'Basic_002'}
    , {1, '체적', 'Basic_003'}, {1, '질량', 'Basic_004'}
    , {1, '시간', 'Basic_005'}, {1, '속도', 'Basic_006'}
    , {1, '각',   'Basic_007'}, {1, '유량', 'Basic_008'}
    , {1, '압력', 'Basic_009'}, {1, '진공압력', 'Basic_010'}
    , {1, '온도', 'Basic_011'}, {1, '온도차', 'Basic_012'}
    , {0, '에너지/전기/빛', 'Light'} //index : 13
    , {2, '에너지', 'Light_001'}, {2, '동력', 'Light_002'}
    , {2, '전류', 'Light_003'},   {2, '전압', 'Light_004'}
    , {2, '자기장', 'Light_005'}, {2, '정전용량', 'Light_006'}
    , {2, '전하량', 'Light_007'}, {2, '자속', 'Light_008'}
    , {2, '각속도', 'Light_009'}, {2, '인덕턴스', 'Light_010'}
    , {2, '조도', 'Light_011'},   {2, '휘도', 'Light_012'}
    , {0, '물리/기계', 'Physics'}      //index : 26
    , {3, '힘', 'Physics_001'},    {3, '비체적', 'Physics_002'}
    , {3, '밀도', 'Physics_003'},   {3, '비열', 'Physics_004'}
    , {3, '가속도', 'Physics_005'}, {3, '표면장력', 'Physics_006'}
    , {3, '비중량', 'Physics_007'}, {3, '토크', 'Physics_008'}
    , {0, '기계공학', 'Machine'}       //index : 35
    , {4, '질량유량', 'Machine_001'}, {4, '엔탈피', 'Machine_002'}
    , {4, '엔트로피', 'Machine_003'}, {4, '확산계수', 'Machine_004'}
    , {4, '점성계수', 'Machine_005'}, {4, '동점성계수', 'Machine_006'}
    , {4, '열전도율', 'Machine_007'}, {4, '투과율', 'Machine_008'}
    , {4, '열유속', 'Machine_009'},   {4, '열저항', 'Machine_010'}
    , {4, '열저항율', 'Machine_011'}, {4, '열발생율', 'Machine_012'}
    , {4, '열용량', 'Machine_013'},   {4, '열전달계수', 'Machine_014'}
    , {4, '열밀도', 'Machine_015'},   {4, '열차폐', 'Machine_016'}
    , {0, '방사선', 'Radiation'}        //index : 52
    , {5, '방사능', 'Radiation_001'},    {5, '조사선량', 'Radiation_002'}
    , {5, '등가선량', 'Radiation_003'},  {5, '흡수선량', 'Radiation_004'}
    , {5, '표면오염도', 'Radiation_005'}, {5, '공기오염도', 'Radiation_006'}
    , {5, '방사능농도', 'Radiation_007'}
    , {0, '기타', 'Etc'}        //index : 60
    , {6, '지진크기', 'Etc_001'},    {6, '전송속도', 'Etc_002'}
    , {6, '저장용량', 'Etc_003'}
  ];

  String appTitle = "길이";

  @override
  Widget build(BuildContext context) {

    // 초기 device 값 셋팅
    if(!getDeviceYn){
      getDeviceValue();
      Timer _timer = Timer.periodic(Duration(microseconds: 1), (timer) {
        if (customerColor != 0 && expression_target != ""){
          // 01. 초기값 셋팅 완료
          getDeviceYn = true;

          // 02. apptitle 값 바인딩
          for(var i =0; i < title.length; i++){
            if(title[i].elementAt(2) == Expression().getExpression()){
              appTitle = title[i].elementAt(1).toString();
            }
          }

          // 03. 완료 (timer cancel, setState 주기)
          setState(() {});
          timer.cancel();
        }
      });
    }

    ValueNotifier<bool> visibleYn01 = ValueNotifier<bool>(false);
    ValueNotifier<bool> visibleYn02 = ValueNotifier<bool>(false);
    ValueNotifier<bool> visibleYn03 = ValueNotifier<bool>(false);
    ValueNotifier<bool> visibleYn04 = ValueNotifier<bool>(false);
    ValueNotifier<bool> visibleYn05 = ValueNotifier<bool>(false);
    ValueNotifier<bool> visibleYn06 = ValueNotifier<bool>(false);

    return MaterialApp(
      title: 'Conversion_if_units',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              title: Text(appTitle,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)
              ),
              backgroundColor: userSetting().getColor(),
              centerTitle: true,
              elevation: 0,
          ),
          body: Body(),
          bottomNavigationBar: Container(
            height: 60,
            color: Colors.grey,
            child: Text("광고부분",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white)
            ),
          ),
          drawer: Drawer(
            width: 250,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                itemCount: title.length,
                itemBuilder: (BuildContext context, int index){

                  // index(1) = 기본
                  if(title[index].elementAt(0)==1){
                    return ValueListenableBuilder(
                      valueListenable: visibleYn01,
                      builder: (BuildContext context, bool value, Widget child) {
                        return Visibility(
                          visible: visibleYn01.value,
                          child: ListTile(
                            title: Text(
                                title[index].elementAt(1).toString(),
                                style: TextStyle(fontSize: 15)
                            ),
                            leading: Icon(Icons.arrow_right, color: userSetting().getColor()),
                            minLeadingWidth : 10,
                            visualDensity: VisualDensity(vertical: -3),
                            dense: true,
                            onTap: () {
                              Expression().setExpression(title[index].elementAt(2).toString());
                              Conversion().setConvertValue("1");
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
                      builder: (BuildContext context, bool value, Widget child) {
                        return Visibility(
                          visible: visibleYn02.value,
                          child: ListTile(
                            title: Text(
                                title[index].elementAt(1).toString(),
                                style: TextStyle(fontSize: 15)
                            ),
                            leading: Icon(Icons.arrow_right, color: userSetting().getColor()),
                            minLeadingWidth : 10,
                            visualDensity: VisualDensity(vertical: -3),
                            dense: true,
                            onTap: () {
                              Expression().setExpression(title[index].elementAt(2).toString());
                              Conversion().setConvertValue("1");
                              Navigator.pop(context);
                              setState(() {});
                            },
                          ),
                        );
                      },
                    );
                  }
                  // index(3) = 물리/기계
                  if(title[index].elementAt(0)==3){
                    return ValueListenableBuilder(
                      valueListenable: visibleYn03,
                      builder: (BuildContext context, bool value, Widget child) {
                        return Visibility(
                          visible: visibleYn03.value,
                          child: ListTile(
                            title: Text(
                                title[index].elementAt(1).toString(),
                                style: TextStyle(fontSize: 15)
                            ),
                            leading: Icon(Icons.arrow_right, color: userSetting().getColor()),
                            minLeadingWidth : 10,
                            visualDensity: VisualDensity(vertical: -3),
                                dense: true,
                                onTap: () {
                                  Expression().setExpression(title[index].elementAt(2).toString());
                                  Conversion().setConvertValue("1");
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                              ),
                            );
                          },
                        );
                      }
                      // index(4) = 기계공학
                      if(title[index].elementAt(0)==4){
                        return ValueListenableBuilder(
                          valueListenable: visibleYn04,
                          builder: (BuildContext context, bool value, Widget child) {
                            return Visibility(
                              visible: visibleYn04.value,
                              child: ListTile(
                                title: Text(
                                    title[index].elementAt(1).toString(),
                                    style: TextStyle(fontSize: 15)
                                ),
                                leading: Icon(Icons.arrow_right, color: userSetting().getColor()),
                                minLeadingWidth : 10,
                                visualDensity: VisualDensity(vertical: -3),
                                dense: true,
                                onTap: () {
                                  Expression().setExpression(title[index].elementAt(2).toString());
                                  Conversion().setConvertValue("1");
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                              ),
                            );
                          },
                        );
                      }
                      // index(5) = 방사능
                      if(title[index].elementAt(0)==5){
                        return ValueListenableBuilder(
                          valueListenable: visibleYn05,
                          builder: (BuildContext context, bool value, Widget child) {
                            return Visibility(
                              visible: visibleYn05.value,
                              child: ListTile(
                                title: Text(
                                    title[index].elementAt(1).toString(),
                                    style: TextStyle(fontSize: 15)
                                ),
                                leading: Icon(Icons.arrow_right, color: userSetting().getColor()),
                                minLeadingWidth : 10,
                                visualDensity: VisualDensity(vertical: -3),
                                dense: true,
                                onTap: () {
                                  Expression().setExpression(title[index].elementAt(2).toString());
                                  Conversion().setConvertValue("1");
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                              ),
                            );
                          },
                        );
                      }
                    // index(6) = 기타
                    if(title[index].elementAt(0)==6){
                      return ValueListenableBuilder(
                        valueListenable: visibleYn06,
                        builder: (BuildContext context, bool value, Widget child) {
                          return Visibility(
                            visible: visibleYn06.value,
                            child: ListTile(
                              title: Text(
                                  title[index].elementAt(1).toString(),
                                  style: TextStyle(fontSize: 15)
                              ),
                              leading: Icon(Icons.arrow_right, color: userSetting().getColor()),
                              minLeadingWidth : 10,
                              visualDensity: VisualDensity(vertical: -3),
                              dense: true,
                              onTap: () {
                                Expression().setExpression(title[index].elementAt(2).toString());
                                Conversion().setConvertValue("1");
                                Navigator.pop(context);
                                setState(() {});
                              },
                            ),
                          );
                        },
                      );
                    }
                      // index(0)
                      ValueNotifier<bool> boolList = ValueNotifier<bool> (true);
                      return ValueListenableBuilder(
                          valueListenable: boolList,
                          builder: (BuildContext context, bool value, Widget child) {
                            return ListTile(
                              title: Text(
                                  title[index].elementAt(1).toString(),
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                              ),
                              trailing: Icon(Icons.add_box_rounded, color: userSetting().getColor()),
                              leading: index == 0 ? Icon(Icons.straighten_sharp)
                                     : index == 13 ? Icon(Icons.electric_bolt)
                                     : index == 26 ? Icon(Icons.psychology)
                                     : index == 35 ? Icon(Icons.precision_manufacturing)
                                     : index == 52 ? Icon(Icons.warning_rounded)
                                     : Icon(Icons.topic),
                              minLeadingWidth: 0,
                              onTap: () {

                                  if (index == 0) {
                                    visibleYn01.value = !visibleYn01.value;

                                    visibleYn02.value = false;
                                    visibleYn03.value = false;
                                    visibleYn04.value = false;
                                    visibleYn05.value = false;
                                    visibleYn06.value = false;

                                    boolList.value = !boolList.value ;
                                  }
                                  else if (index == 13) {
                                    visibleYn02.value = !visibleYn02.value;

                                    visibleYn01.value = false;
                                    visibleYn03.value = false;
                                    visibleYn04.value = false;
                                    visibleYn05.value = false;
                                    visibleYn06.value = false;

                                    boolList.value = !boolList.value ;
                                  }
                                  else if (index == 26) {
                                    visibleYn03.value = !visibleYn03.value;

                                    visibleYn01.value = false;
                                    visibleYn02.value = false;
                                    visibleYn04.value = false;
                                    visibleYn05.value = false;
                                    visibleYn06.value = false;

                                    boolList.value = !boolList.value ;
                                  }
                                  else if (index == 35) {
                                    visibleYn04.value = !visibleYn04.value;

                                    visibleYn01.value = false;
                                    visibleYn02.value = false;
                                    visibleYn03.value = false;
                                    visibleYn05.value = false;
                                    visibleYn06.value = false;

                                    boolList.value = !boolList.value ;
                                  }
                                  else if (index == 52) {
                                    visibleYn05.value = !visibleYn05.value;

                                    visibleYn01.value = false;
                                    visibleYn02.value = false;
                                    visibleYn03.value = false;
                                    visibleYn04.value = false;
                                    visibleYn06.value = false;

                                    boolList.value = !boolList.value ;
                                  }
                                  else if (index == 60) {
                                    visibleYn06.value = !visibleYn06.value;

                                    visibleYn01.value = false;
                                    visibleYn02.value = false;
                                    visibleYn03.value = false;
                                    visibleYn04.value = false;
                                    visibleYn05.value = false;

                                    boolList.value = !boolList.value ;
                                  }
                                },
                            );
                          }
                      );
                    }
                ),),
                Row(
                    children: <Widget>[
                      Expanded( child: Divider(height: 5, thickness: 3,)),
                      Text("  Setting  "),
                      Expanded( child: Divider(height: 5, thickness: 3,)),
                    ]
                ),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          userSetting().setColor(Colors.pink);
                          setState(() {});
                        }, // Handle your callback
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0,10,10,10),
                            child: Ink(height: 30, width: 30, color: Colors.pink)
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          userSetting().setColor(Colors.deepOrange);
                          setState(() {});
                        }, // Handle your callback
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0,10,10,10),
                            child: Ink(height: 30, width: 30, color: Colors.deepOrange)
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          userSetting().setColor(Colors.green);
                          setState(() {});
                        }, // Handle your callback
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0,10,10,10),
                            child: Ink(height: 30, width: 30, color: Colors.green)
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          userSetting().setColor(Colors.indigoAccent);
                          setState(() {});
                        }, // Handle your callback
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0,10,10,10),
                            child: Ink(height: 30, width: 30, color: Colors.indigoAccent)
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          userSetting().setColor(Colors.deepPurpleAccent);
                          setState(() {});
                        }, // Handle your callback
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0,10,10,10),
                            child: Ink(height: 30, width: 30, color: Colors.deepPurpleAccent)
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          userSetting().setColor(Colors.blueGrey);
                          setState(() {});
                        }, // Handle your callback
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0,10,10,10),
                            child: Ink(height: 30, width: 30, color: Colors.blueGrey)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        onDrawerChanged: (isOpen){
            if(!isOpen){
              visibleYn01.value = false;
              visibleYn02.value = false;
              visibleYn03.value = false;
              visibleYn04.value = false;
              visibleYn05.value = false;
              visibleYn06.value = false;
            }
            setState(() {
              for(var i =0; i < title.length; i++){
                if(title[i].elementAt(2) == Expression().getExpression()){
                  appTitle = title[i].elementAt(1).toString();
                }
              }
            });
        },
      )
    );


  }
}