import 'dart:ffi';

import 'package:flutter/material.dart';
import 'expression.dart';
import 'conversion.dart';
import 'userSetting.dart';

  class Body extends StatefulWidget {
    static of(BuildContext context, {bool root = false}) => root
        ? context.findRootAncestorStateOfType<_Body>()
        : context.findAncestorStateOfType<_Body>();

    @override
    State<StatefulWidget> createState() => _Body();
  }
  class _Body extends State<Body> {

  @override
  Widget build(BuildContext context) {
    var target = Conversion().changeConvertValue();
    var unit = Expression().getTargetList();
    String selectedUnit = Expression().getTargetItem();
    String selectedTarget = Conversion().getConvertValue().toString();

    FocusNode textFocus = FocusNode();

    List<DropdownMenuItem<String>> menuItems = [];
    for(String key in unit.keys){
      menuItems.add(
          DropdownMenuItem<String>(
            child: Text( unit[key] ), // the value as text label
            value: key, // the respective key as value
          )
      );
    }

    return Column(
      children: [
        Container(
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
                      //focusNode: textFocus,
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
                        height: 2,
                        color: userSetting().getColor(),
                      ),
                      iconSize: 0,
                      onChanged: (String? newValue) {
                        setState(() {
                          Expression().setTargetItem(newValue!);
                        });
                      },
                      items: menuItems,
                    ),
                  )
                ),
              ]
          )
        ),
        Expanded(
          child: ListView.separated(
            itemCount: target.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: Container(
                          height: 35,
                          color: Colors.white,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text(
                            target.values.elementAt(index),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        child: Container(
                          height: 35,
                          color: Colors.white,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            unit.values.elementAt(index),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: userSetting().getColor(),
              height: 5,
              thickness: 2,
            ),
          ),
        ),
      ],
    );
  }
}