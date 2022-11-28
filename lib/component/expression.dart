import 'package:flutter/material.dart';
import 'body.dart';
import 'conversion.dart';

var expression_target = 'Basic_001';
var expression_target_item = 'Basic_001_001';

class Expression{

  setExpression(String _target){
    expression_target = _target;
    expression_target_item = expression_target + '_001';
  }

  getExpression(){
    return expression_target;
  }

  changeTargetItem(String _targetItem){

    if(_targetItem != ''){
      expression_target_item = _targetItem;
    }
    return expression_target_item;
  }

  changetarget(){
    var items = {};

    if (expression_target == 'Basic_001'){
      items = {
        'Basic_001_001' : 'm(meter)',        'Basic_001_002' : 'mm',            'Basic_001_003' : 'cm',
        'Basic_001_004' : 'km',              'Basic_001_005' : 'μm',            'Basic_001_006' : 'nm',
        'Basic_001_007' : 'in(inch)',        'Basic_001_008' : 'ft(feet)',      'Basic_001_009' : 'ft(US survey)',
        'Basic_001_010' : 'yd(yard)',        'Basic_001_011' : 'mil',           'Basic_001_012' : 'mi(mile)',
        'Basic_001_013' : 'mile(US survey)', 'Basic_001_014' : 'mile(UK)',      'Basic_001_015' : 'Aungstrom',
        'Basic_001_016' : 'fermi',           'Basic_001_017' : 'pc(parsec)',    'Basic_001_018' : 'kpc',
        'Basic_001_019' : 'Mpc',             'Basic_001_020' : 'au',            'Basic_001_021' : 'fathom',
        'Basic_001_022' : 'rod',             'Basic_001_023' : 'furlong',       'Basic_001_024' : '자',
        'Basic_001_025' : '간',              'Basic_001_026' : '리',             'Basic_001_027' : '광년',
        'Basic_001_028' : 'chain',           'Basic_001_029' : '해리',
      };
    }
    else if (expression_target == 'Basic_002'){
      items = {
        'Basic_002_001' : 'm²',              'Basic_002_002' : 'mm²',           'Basic_002_003' : 'cm²',
        'Basic_002_004' : 'km²',             'Basic_002_005' : 'hm²',           'Basic_002_006' : 'μm²',
        'Basic_002_007' : 'nm²',             'Basic_002_008' : '평',            'Basic_002_009' : 'barn',
        'Basic_002_010' : 'in²',             'Basic_002_011' : 'ft²',           'Basic_002_012' : 'yd²',
        'Basic_002_013' : 'mi(mile)²',       'Basic_002_014' : 'chain²',        'Basic_002_015' : 'acre',
        'Basic_002_016' : 'a(are) ',         'Basic_002_017' : 'ha ',           'Basic_002_018' : 'rod²',
        'Basic_002_019' : 'rood',            'Basic_002_020' : '평방자',         'Basic_002_021' : '단보',
        'Basic_002_022' : '정보',             'Basic_002_023' : 'circular mil',
      };
    }

    return items;
  }


}