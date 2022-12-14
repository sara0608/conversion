import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'expression.dart';
import 'conversion.dart';
import 'userSetting.dart';


  class Body extends StatefulWidget {
    final bool isDialog;

    const Body({Key key, this.isDialog = false}) : super(key: key);
    @override
    _Body createState() => _Body();
  }
  class _Body extends State<Body> {

    final FocusNode textFocus = FocusNode();

    KeyboardActionsConfig _buildConfig(BuildContext context) {
      return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(focusNode: textFocus, toolbarButtons: [
                (node) {
              return GestureDetector(
                onTap: () => node.unfocus(),
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "DONE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          ]),
        ],
      );
    }

  @override
  Widget build(BuildContext context) {
    var target = Conversion().changeConvertValue();
    var unit = Expression().getTargetList();
    String selectedUnit = Expression().getTargetItem();
    String selectedTarget = Conversion().getConvertValue().toString();

    List<DropdownMenuItem<String>> menuItems = [];
    for(String key in unit.keys){
      menuItems.add(
          DropdownMenuItem<String>(
            child: Text( unit[key], style: TextStyle(fontSize: 18,),), // the value as text label
            value: key, // the respective key as value
          )
      );
    }
    return KeyboardActions(
      isDialog: widget.isDialog,
      config: _buildConfig(context),
      child: Column(
        children: <Widget>[
          Container(
            height: 65,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: TextEditingController(text: selectedTarget),
                          textAlign: TextAlign.right,
                          textAlignVertical: TextAlignVertical.center,
                          focusNode: textFocus,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: userSetting().getColor(),
                            isDense: true,
                            contentPadding: EdgeInsets.all(10),
                            hintText: "1",
                            hintStyle: TextStyle(color: Colors.white54),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          onChanged: (newValue){
                            Conversion().setConvertValue(newValue);
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: DropdownButton<String>(
                            value: selectedUnit,
                            elevation: 16,
                            underline: Container(
                              height: 3,
                              color: userSetting().getColor(),
                            ),
                            iconSize: 0,
                            onChanged: (String newValue) {
                              setState(() {
                                Expression().setTargetItem(newValue);
                              });
                            },
                            items: menuItems,
                          ),
                        )
                    ),
                  ]
              )
          ),
          Container(
            height: MediaQuery.of(context).size.height
                    - 65  //숫자 넣는 부분
                    - 60  //광고 부분
                    - Scaffold.of(context).appBarMaxHeight,  //appbar 부분
             child: ListView.builder(
              itemCount: target.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(
                    border: Border(
                        top: (index == 0) ? BorderSide(color: userSetting().getColor(),width: 3) : BorderSide.none,
                        bottom: BorderSide(color: userSetting().getColor(),width: 3)
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: 35,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text(
                                target.values.elementAt(index),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: unit.keys.elementAt(index)==Expression().getTargetItem() ? Colors.amber : Colors.black ,
                                ),
                              ),
                            ),
                            onTap: (){
                              Clipboard.setData(ClipboardData(text: target.values.elementAt(index)));
                              Fluttertoast.showToast(
                                  msg: "클립보드에 복사완료",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.black,
                                  fontSize: 16.0
                              );
                            },
                          )
                      ),
                      Expanded(
                          child: Container(
                            height: 35,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              unit.values.elementAt(index),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: unit.keys.elementAt(index)==Expression().getTargetItem() ? Colors.amber : Colors.black ,
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}