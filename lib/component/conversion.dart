import 'package:conversion/component/expression.dart';

import 'body.dart';

class Conversion{
  changeConvertValue(double _convert_value){
    var convert_items = {};
    double convert_value;

    //01. 입력된 숫자 convert_value 에 setting
    if(_convert_value == null || _convert_value == ''){
      convert_value = 1;
    }else{
      convert_value = _convert_value;
    }

    //02. 단위 변환하기
    if(expression_target == 'Basic_001'){
      /*
         01 : 'm(meter)',          02 : 'mm',             03 : 'cm',            04 : 'km',
         05 : 'μm',                06 : 'nm',             07 : 'in(inch)',      08 : 'ft(feet)',
         09 : 'ft(US survey)',     10 : 'yd(yard)',       11 : 'mil',           12 : 'mi(mile)',
         13 : 'mile(US survey)',   14 : 'mile(UK)',       15 : 'Aungstrom',     16 : 'fermi',
         17 : 'pc(parsec)',        18 : 'kpc',            19 : 'Mpc',           20 : 'au',
         21 : 'fathom',            22 : 'rod',            23 : 'furlong',       24 : '자',
         25 : '간',                26 : '리',              27 : '광년',          28 : 'chain',
         29 : '해리',
     */

      if(expression_target_item == 'Basic_001_001'){  //m(meter)
        {}
      }

      convert_items = {
        'Basic_001_001' : 'm(meter)',        'Basic_001_002' : 'mm',            'Basic_001_003' : 'cm',
        'Basic_001_004' : 'km',              'Basic_001_005' : 'μm',            'Basic_001_006' : 'nm',
        'Basic_001_007' : 'in(inch)',        'Basic_001_008' : 'ft(feet)',      'Basic_001_009' : 'ft(US survey)',
        'Basic_001_010' : 'yd(yard)',        'Basic_001_011' : 'mil',           'Basic_001_012' : 'mi(mile)',
        'Basic_001_013' : 'mile(US survey)', 'Basic_001_014' : 'mile(UK)',      'Basic_001_015' : 'Aungstrom',
        'Basic_001_016' : 'fermi',           'Basic_001_017' : 'pc(parsec)',    'Basic_001_018' : 'kpc',
        'Basic_001_019' : 'Mpc',             'Basic_001_020' : 'au',            'Basic_001_021' : 'fathom',
        'Basic_001_022' : 'rod',             'Basic_001_023' : 'furlong',       'Basic_001_024' : '자',
        'Basic_001_025' : '간',              'Basic_001_026' : '리',             'Basic_001_027' : '광년',
        'Basic_001_028' : 'chain',           'Basic_001_029' : '해리'
      };

    }

    return convert_items;
  }


}