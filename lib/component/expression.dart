import 'package:flutter/material.dart';
import 'body.dart';
import 'conversion.dart';
import 'package:shared_preferences/shared_preferences.dart';

var expression_target = 'Basic_001';
var expression_target_item = 'Basic_001_001';

class Expression{

  setExpression(String _target) async{
    expression_target = _target;
    expression_target_item = expression_target + '_001';

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("customerExpression", _target);
  }

  getExpression(){
    return expression_target;
  }

  setTargetItem(String _targetItem){
    expression_target_item = _targetItem;
  }

  getTargetItem(){
    return expression_target_item;
  }

  getTargetList(){
    var items = {};

    /* 기본 */

    if (expression_target == 'Basic_001'){  //길이
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
    else if (expression_target == 'Basic_002'){ //면적
      items = {
        'Basic_002_001' : 'm²',              'Basic_002_002' : 'mm²',           'Basic_002_003' : 'cm²',
        'Basic_002_004' : 'km²',             'Basic_002_005' : 'hm²',           'Basic_002_006' : 'μm²',
        'Basic_002_007' : 'nm²',             'Basic_002_008' : '평',            'Basic_002_009' : 'barn',
        'Basic_002_010' : 'in²',             'Basic_002_011' : 'ft²',           'Basic_002_012' : 'yd²',
        'Basic_002_013' : 'mi(mile)²',       'Basic_002_014' : 'chain²',        'Basic_002_015' : 'acre',
        'Basic_002_016' : 'a(are)',          'Basic_002_017' : 'ha',            'Basic_002_018' : 'rod²',
        'Basic_002_019' : 'rood',            'Basic_002_020' : '평방자',         'Basic_002_021' : '단보',
        'Basic_002_022' : '정보',             'Basic_002_023' : 'circular mil',
      };
    }
    else if (expression_target == 'Basic_003'){ //체적
      items = {
        'Basic_003_001' : 'm³',              'Basic_003_002' : 'cc',            'Basic_003_003' : 'ml',
        'Basic_003_004' : 'cl',              'Basic_003_005' : 'cm³',           'Basic_003_006' : 'dL(deciL)',
        'Basic_003_007' : 'L(liter)',        'Basic_003_008' : 'gal(UK)',       'Basic_003_009' : 'gal(US)',
        'Basic_003_010' : 'in³',             'Basic_003_011' : 'ft³',           'Basic_003_012' : 'yd³',
        'Basic_003_013' : 'barrel(US)',      'Basic_003_014' : 'bushel(US)',    'Basic_003_015' : 'liq pt(US)',
        'Basic_003_016' : 'fl oz(US)',       'Basic_003_017' : 'bushel(UK)',    'Basic_003_018' : 'gill(UK)',
        'Basic_003_019' : 'gill(US)',        'Basic_003_020' : 'liq qt(US)',    'Basic_003_021' : 'cup(US)',
        'Basic_003_022' : '홉',               'Basic_003_023' : '되',            'Basic_003_024' : '말',
        'Basic_003_025' : 'acre*ft',         'Basic_003_026' : 'cord(128ft³)',  'Basic_003_027' : 'mi(mile)³',
        'Basic_003_028' : 'fl oz(UK)',       'Basic_003_029' : 'peck(US)',      'Basic_003_030' : 'st(stere)',
        'Basic_003_031' : 'tablespoon',      'Basic_003_032' : 'teaspoon',
      };
    }
    else if (expression_target == 'Basic_004'){ //질량
      items = {
        'Basic_004_001' : 'g(gram)',         'Basic_004_002' : '㎍',            'Basic_004_003' : 'mg',
        'Basic_004_004' : 'cg',              'Basic_004_005' : 'kg',            'Basic_004_006' : 't(ton)',
        'Basic_004_007' : 't(ton,UK)',       'Basic_004_008' : 't(ton,US)',     'Basic_004_009' : 'dalton',
        'Basic_004_010' : 'grain',           'Basic_004_011' : 'carat',         'Basic_004_012' : 'lb(pound)',
        'Basic_004_013' : 'oz(ounce)',       'Basic_004_014' : 'slug',          'Basic_004_015' : '돈',
        'Basic_004_016' : '냥',              'Basic_004_017' : '근',             'Basic_004_018' : '관',
        'Basic_004_019' : 'pennyweight',
      };
    }
    else if (expression_target == 'Basic_005'){ //시간
      items = {
        'Basic_005_001' : 's(sec)',          'Basic_005_002' : 'fs(femtosec)',  'Basic_005_003' : 'ps(picosec)',
        'Basic_005_004' : 'ns(nanosec)',     'Basic_005_005' : '㎲(microsec)',   'Basic_005_006' : 'ms(milisec)',
        'Basic_005_007' : 'min',             'Basic_005_008' : 'h(hour)',       'Basic_005_009' : 'd(day)',
        'Basic_005_010' : 'wk(week)',        'Basic_005_011' : 'month',         'Basic_005_012' : 'yr(year)',
        'Basic_005_013' : 'decade',          'Basic_005_014' : 'century',       'Basic_005_015' : 'millenium',
        'Basic_005_016' : '(항성)s',          'Basic_005_017' : '(항성)min',      'Basic_005_018' : '(항성)h',
        'Basic_005_019' : '항성)d',           'Basic_005_020' : '(항성)yr',       'Basic_005_021' : '(회귀)yr',
        'Basic_005_022' : 'shake',
      };
    }
    else if (expression_target == 'Basic_006'){ //속도
      items = {
        'Basic_006_001' : 'm/s',             'Basic_006_002' : 'cm/h',          'Basic_006_003' : 'cm/min',
        'Basic_006_004' : 'cm/s',            'Basic_006_005' : 'ft/h',          'Basic_006_006' : 'ft/min',
        'Basic_006_007' : 'ft/s',            'Basic_006_008' : 'm/h',           'Basic_006_009' : 'm/min',
        'Basic_006_010' : 'km/h',            'Basic_006_011' : 'km/min',        'Basic_006_012' : 'km/s',
        'Basic_006_013' : 'mi(mile)/h',      'Basic_006_014' : 'mi/min',        'Basic_006_015' : 'mi/s',
        'Basic_006_016' : 'in/min',          'Basic_006_017' : 'in/s',          'Basic_006_018' : 'yd/h',
        'Basic_006_019' : 'yd/min',         'Basic_006_020' : 'yd/s',          'Basic_006_021' : 'knot',
        'Basic_006_022' : 'knot(UK)',        'Basic_006_023' : '음속',          'Basic_006_024' : '광속',
      };
    }
    else if (expression_target == 'Basic_007'){ //각도
      items = {
        'Basic_007_001' : 'rad',             'Basic_007_002' : '원',            'Basic_007_003' : '도',
        'Basic_007_004' : '분',              'Basic_007_005' : '초',             'Basic_007_006' : 'grade(gon)',
        'Basic_007_007' : 'octant',          'Basic_007_008' : 'quadrant',      'Basic_007_009' : 'sextant',
        'Basic_007_010' : 'turn',            'Basic_007_011' : 'revolution',    'Basic_007_012' : 'mil',
      };
    }
    else if (expression_target == 'Basic_008'){ //유량
      items = {
        'Basic_008_001' : 'm³/s',            'Basic_008_002' : 'cm³/h',         'Basic_008_003' : 'cm³/min',
        'Basic_008_004' : 'cm³/s',           'Basic_008_005' : 'm³/d',          'Basic_008_006' : 'm³/h',
        'Basic_008_007' : 'm³/min',          'Basic_008_008' : 'L/d',           'Basic_008_009' : 'L/h',
        'Basic_008_010' : 'L/min',           'Basic_008_011' : 'L/s',           'Basic_008_012' : 'gal/day(US)',
        'Basic_008_013' : 'gal/hr(US)',      'Basic_008_014' : 'gal/min(US)',   'Basic_008_015' : 'gal/sec(US)',
        'Basic_008_016' : 'gal/day(UK)',     'Basic_008_017' : 'gal/hr(UK)',    'Basic_008_018' : 'gal/min(UK)',
        'Basic_008_019' : 'gal/sec(UK)',     'Basic_008_020' : 'ft³/day',       'Basic_008_021' : 'ft³/hr',
        'Basic_008_022' : 'ft³/min',         'Basic_008_023' : 'ft³/sec',       'Basic_008_024' : 'yd³/h',
        'Basic_008_025' : 'yd³/min',         'Basic_008_026' : 'yd³/s',         'Basic_008_027' : 'barrel/d',
        'Basic_008_028' : 'barrel/h',        'Basic_008_029' : 'barrel/min',    'Basic_008_030' : 'barrel/s',
        'Basic_008_031' : 'in³/min',
      };
    }
    else if (expression_target == 'Basic_009'){ //압력
      items = {
        'Basic_009_001' : 'Pa(N/m²)',        'Basic_009_002' : 'daPa',          'Basic_009_003' : 'hPa',
        'Basic_009_004' : 'kPa',             'Basic_009_005' : 'MPa',           'Basic_009_006' : 'atm',
        'Basic_009_007' : 'bar',             'Basic_009_008' : 'mbar',          'Basic_009_009' : 'μbar',
        'Basic_009_010' : 'dyn/cm²',         'Basic_009_011' : 'mmHg',          'Basic_009_012' : 'cmHg',
        'Basic_009_013' : 'inHg',            'Basic_009_014' : 'inWTR',         'Basic_009_015' : 'kg/cm²',
        'Basic_009_016' : 'kg/m²',           'Basic_009_017' : 'lb/ft²',        'Basic_009_018' : 'psi',
        'Basic_009_019' : 'Torr',            'Basic_009_020' : 'N/cm²',         'Basic_009_021' : 'mmWTR',
        'Basic_009_022' : 'cmWTR',           'Basic_009_023' : 'ftHg',          'Basic_009_024' : 'ftWTR',
        'Basic_009_025' : 'pdl/ft²',         'Basic_009_026' : 'at(tech atm)',  'Basic_009_027' : 'g/cm²',
        'Basic_009_028' : 'cmHg(0℃)',        'Basic_009_029' : 'cmWTR(4℃)',    'Basic_009_030' : 'ftWTR(39.2℉)',
        'Basic_009_031' : 'inHg(32℉)',       'Basic_009_032' : 'inHg(60℉)',    'Basic_009_033' : 'inWTR(39.2℉)',
        'Basic_009_034' : 'inWTR(60℉)',      'Basic_009_035' : 'kip/in²',       'Basic_009_036' : 'kg/mm²',
      };
    }
    else if (expression_target == 'Basic_010'){ //진공 압력
      items = {
        'Basic_010_001' : 'mmHg.V',          'Basic_010_002' : 'cmHg.V',        'Basic_010_003' : 'inHg.V',
        'Basic_010_004' : 'ftHg.V',          'Basic_010_005' : 'mmWTR.V',       'Basic_010_006' : 'cmWTR.V',
        'Basic_010_007' : 'inWTR.V',         'Basic_010_008' : 'ftWTR.V',       'Basic_010_009' : 'mmHg.A',
        'Basic_010_010' : 'cmHg.A',          'Basic_010_011' : 'inHg.A',        'Basic_010_012' : 'ftHg.A',
        'Basic_010_013' : 'mmWTR.A',         'Basic_010_014' : 'cmWTR.A',       'Basic_010_015' : 'inWTR.A',
        'Basic_010_016' : 'ftWTR.A',         'Basic_010_017' : 'psia',
      };
    }
    else if (expression_target == 'Basic_011'){ //온도
      items = {
        'Basic_011_001' : '섭씨(℃)',          'Basic_011_002' : '화씨(℉)',        'Basic_011_003' : '절대(K)',
        'Basic_011_004' : '랭킨(R)',
      };
    }
    else if (expression_target == 'Basic_012'){ //온도차
      items = {
        'Basic_012_001' : 'Δ℃',               'Basic_012_002' : 'Δ℉',          'Basic_012_003' : 'ΔK',
        'Basic_012_004' : 'ΔR',
      };
    }

    /* Light 에너지/전기/빛 */

    else if (expression_target == 'Light_001'){ //에너지
     items = {
        'Light_001_001' : 'J',               'Light_001_002' : 'KJ',            'Light_001_003' : 'MJ',
        'Light_001_004' : 'GJ',              'Light_001_005' : 'amu',           'Light_001_006' : 'BTU',
        'Light_001_007' : 'BTU(th)',         'Light_001_008' : 'BTU(mean)',     'Light_001_009' : 'BTU(39℉)',
        'Light_001_010' : 'BTU(59℉)',        'Light_001_011' : 'BTU(60℉)',     'Light_001_012' : 'cal',
        'Light_001_013' : 'ca(th)',          'Light_001_014' : 'cal(mean)',     'Light_001_015' : 'kcal',
        'Light_001_016' : 'dyn*cm',          'Light_001_017' : 'erg',           'Light_001_018' : 'eV',
        'Light_001_019' : 'KeV',             'Light_001_020' : 'MeV',           'Light_001_021' : 'gf*cm',
        'Light_001_022' : 'N*m',             'Light_001_023' : 'Wh',            'Light_001_024' : 'W*s',
        'Light_001_025' : 'kWh',             'Light_001_026' : 'MWh',           'Light_001_027' : 'GWh',
        'Light_001_028' : 'lbf*in',           'Light_001_029' : 'lbf*ft',       'Light_001_030' : 'ozf*in',
        'Light_001_031' : 'Hp*h(Elect)',      'Light_001_032' : 'kgf*m',        'Light_001_033' : 'PSh',
        'Light_001_034' : 'poundal*ft',       'Light_001_035' : 'therm(EU)',    'Light_001_036' : 'therm(US)',
        'Light_001_037' : 'ton of TNT',
     };
    }
    else if (expression_target == 'Light_002'){ //동력
      items = {
        'Light_002_001' : 'W(Watts)',        'Light_002_002' : 'kW',            'Light_002_003' : 'MW',
        'Light_002_004' : 'mW',              'Light_002_005' : 'BTU/h',         'Light_002_006' : 'BTU/min',
        'Light_002_007' : 'BTU/s',           'Light_002_008' : 'cal/s',         'Light_002_009' : 'kcal/s',
        'Light_002_010' : 'kcal/min',        'Light_002_011' : 'kcal/h',        'Light_002_012' : 'Hp(Boiler)',
        'Light_002_013' : 'Hp(Elect)',       'Light_002_014' : 'Hp(metric)',    'Light_002_015' : 'Hp(water)',
        'Light_002_016' : 'erg/s',           'Light_002_017' : 'kgf*m/s',       'Light_002_018' : 'lbf*ft/min',
        'Light_002_019' : 'lbf*ft/s',        'Light_002_020' : 'lbf*ft/h',      'Light_002_021' : 'poundal*ft/s',
        'Light_002_022' : 'prony',           'Light_002_023' : '냉동톤',         'Light_002_024' : 'PS',
        'Light_002_025' : 'Hp(UK)',          'Light_002_026' : 'BTU(th)/h',     'Light_002_027' : 'BTU(th)/min',
        'Light_002_028' : 'BTU(th)/s',       'Light_002_029' : 'cal(th)/min',  'Light_002_030' : 'cal(th)/s',
        'Light_002_031' : 'kcal(th)/min',    'Light_002_032' : 'kcal(th)/s',
      };
    }
    else if (expression_target == 'Light_003'){ //전류
      items = {
        'Light_003_001' : 'A(Amp)',          'Light_003_002' : 'mA',            'Light_003_003' : 'kA',
        'Light_003_004' : 'μA',              'Light_003_005' : 'stA',           'Light_003_006' : 'abA',
        'Light_003_007' : 'Bi(biot)',        'Light_003_008' : 'Gi(gilbert)',
      };
    }
    else if (expression_target == 'Light_004'){ //전압
      items = {
        'Light_004_001' : 'V(Volt)',         'Light_004_002' : 'mV',            'Light_004_003' : 'kV',
        'Light_004_004' : 'abV',             'Light_004_005' : 'stV',
      };
    }
    else if (expression_target == 'Light_005'){ //자기장
      items = {
        'Light_005_001' : 'G(Gauss)',        'Light_005_002' : 'T(Tesla)',      'Light_005_003' : 'mG',
        'Light_005_004' : 'γ(gamma)',
      };
    }
    else if (expression_target == 'Light_006'){ //정전용량
      items = {
        'Light_006_001' : 'F(farad)',        'Light_006_002' : 'μF',            'Light_006_003' : 'pF',
        'Light_006_004' : 'stF',             'Light_006_005' : 'abF',
      };
    }
    else if (expression_target == 'Light_007'){ //전하량
      items = {
        'Light_007_001' : 'C(Coulomb)',      'Light_007_002' : 'abC',           'Light_007_003' : 'stC',
        'Light_007_004' : 'Ah',              'Light_007_005' : 'Faraday',       'Light_007_006' : 'Fr(Franklin)',
      };
    }
    else if (expression_target == 'Light_008'){ //자속
      items = {
        'Light_008_001' : 'Mx(Maxwell)',     'Light_008_002' : 'Wb(weber)',     'Light_008_003' : 'Unit Pole',
      };
    }
    else if (expression_target == 'Light_009'){ //각속도
      items = {
        'Light_009_001' : 'rad/s',           'Light_009_002' : 'rad/min',       'Light_009_003' : 'Hz',
        'Light_009_004' : 'kHz',             'Light_009_005' : 'MHz',           'Light_009_006' : 'rpm',
        'Light_009_007' : 'rev/h',           'Light_009_008' : 'deg/s',
      };
    }
    else if (expression_target == 'Light_010'){ //인덕턴스
      items = {
        'Light_010_001' : 'H(Henry)',        'Light_010_002' : 'mH',            'Light_010_003' : 'μH',
        'Light_010_004' : 'abH',             'Light_010_005' : 'stH',
      };
    }
    else if (expression_target == 'Light_011'){ //조도
      items = {
        'Light_011_001' : 'flame',           'Light_011_002' : 'ft*cd',         'Light_011_003' : 'lx',
        'Light_011_004' : 'm*cdl',           'Light_011_005' : 'ph(phot)',      'Light_011_006' : 'lm/ft²',
        'Light_011_007' : 'lm/m²',
      };
    }
    else if (expression_target == 'Light_012'){ //휘도
      items = {
        'Light_012_001' : 'cd/m²',           'Light_012_002' : 'cd/in²',        'Light_012_003' : 'ft*lambert',
        'Light_012_004' : 'lambert',         'Light_012_005' : 'st(stilb)',
      };
    }

    /* 물리/기계 */

    else if (expression_target == 'Physics_001'){ //힘
      items = {
        'Physics_001_001' : 'N',               'Physics_001_002' : 'mN',            'Physics_001_003' : 'kN',
        'Physics_001_004' : 'dyn',             'Physics_001_005' : 'gf(gram force)','Physics_001_006' : 'kgf',
        'Physics_001_007' : 'J/cm',            'Physics_001_008' : 'J/m',           'Physics_001_009' : 'lbf',
        'Physics_001_010' : 'ozf',             'Physics_001_011' : 'poundal',       'Physics_001_012' : 'tf(ton.f)(UK)',
        'Physics_001_013' : 'tf(ton.f)(US)',   'Physics_001_014' : 'kip',
      };
    }
    else if (expression_target == 'Physics_002'){ //비체적
      items = {
        'Physics_002_001' : 'm³/kg',           'Physics_002_002' : 'L/kg',          'Physics_002_003' : 'in³/lb',
        'Physics_002_004' : 'ft³/lb',          'Physics_002_005' : 'ft³/slug',      'Physics_002_006' : 'gal/grain(US)',
        'Physics_002_007' : 'cm³/g',           'Physics_002_008' : 'in³/oz',        'Physics_002_009' : 'gal/oz(UK)',
        'Physics_002_010' : 'gal/oz(US)',      'Physics_002_011' : 'yd³/lb',        'Physics_002_012' : 'gal(UK)/lb',
        'Physics_002_013' : 'gal(US)/lb',      'Physics_002_014' : 'yd³/t(US)',     'Physics_002_015' : 'yd³/t(UK)',
      };
    }
    else if (expression_target == 'Physics_003'){ //밀도
      items = {
        'Physics_003_001' : 'kg/m³',           'Physics_003_002' : 'g/cm³',         'Physics_003_003' : 'lb/ft³',
        'Physics_003_004' : 'lb/in³',          'Physics_003_005' : 'lb/gal(UK)',    'Physics_003_006' : 'lb/gal(US)',
        'Physics_003_007' : 'lb/yd³',          'Physics_003_008' : 't/yd³(US)',     'Physics_003_009' : 't/yd³(UK)',
        'Physics_003_010' : 'oz/gal(US)',      'Physics_003_011' : 'oz/gal(UK)',    'Physics_003_012' : 'oz/in³',
        'Physics_003_013' : 'slug/ft³',        'Physics_003_014' : 'grain/gal(US)',
      };
    }
    else if (expression_target == 'Physics_004'){ //비열
      items = {
        'Physics_004_001' : 'J/kg*℃',          'Physics_004_002' : 'kJ/kg*℃',      'Physics_004_003' : 'cal/kg*℃',
        'Physics_004_004' : 'kcal/kg*℃',       'Physics_004_005' : 'cal/g*℃',      'Physics_004_006' : 'BTU/lb*℉',
        'Physics_004_007' : 'Wh/kg*℃',         'Physics_004_008' : 'kWh/kg*℃',     'Physics_004_009' : 'J/kg*K',
        'Physics_004_010' : 'BTU(th)/lb*℉',    'Physics_004_011' : 'cal(th)/g*℃',
      };
    }
    else if (expression_target == 'Physics_005'){ //가속도
      items = {
        'Physics_005_001' : 'm/s²',             'Physics_005_002' : 'g',          'Physics_005_003' : 'ft/s²',
        'Physics_005_004' : 'Gal',              'Physics_005_005' : 'in/s²',
      };
    }
    else if (expression_target == 'Physics_006'){ //표면장력
      items = {
        'Physics_006_001' : 'lbf/ft',           'Physics_006_002' : 'N/m',        'Physics_006_003' : 'dyn/cm',
        'Physics_006_004' : 'lbf/in',
      };
    }
    else if (expression_target == 'Physics_007'){ //비중량
      items = {
        'Physics_007_001' : 'N/m³',             'Physics_007_002' : 'kN/m³',      'Physics_007_003' : 'dyn/cm³',
        'Physics_007_004' : 'kgf/m³',           'Physics_007_005' : 'lbf/ft³',
      };
    }
    else if (expression_target == 'Physics_008'){ //토크
      items = {
        'Physics_008_001' : 'N*m',             'Physics_008_002' : 'dyn*cm',        'Physics_008_003' : 'kgf*m',
        'Physics_008_004' : 'kgf*cm',          'Physics_008_005' : 'pdl*ft',        'Physics_008_006' : 'lbf*ft',
        'Physics_008_007' : 'lbf*in',          'Physics_008_008' : 'ozf*in',
      };
    }

    /* 기계공학 */

    else if (expression_target == 'Machine_001'){ //질량유량
      items = {
        'Machine_001_001' : 'kg/s',            'Machine_001_002' : 'kg/min',        'Machine_001_003' : 'kg/h',
        'Machine_001_004' : 'g/s',             'Machine_001_005' : 't(ton)/s',      'Machine_001_006' : 't/min',
        'Machine_001_007' : 't/h',             'Machine_001_008' : 't(UK)/h',       'Machine_001_009' : 't(US)/h',
        'Machine_001_010' : 'lb/s',            'Machine_001_011' : 'lb/min',        'Machine_001_012' : 'lb/h',
      };
    }
    else if (expression_target == 'Machine_002'){ // 엔달피
      items = {
        'Machine_002_001' : 'J/kg',            'Machine_002_002' : 'kJ/kg',         'Machine_002_003' : 'cal/g',
        'Machine_002_004' : 'cal/kg',          'Machine_002_005' : 'kcal/kg',       'Machine_002_006' : 'BTU/lb',
        'Machine_002_007' : 'BTU(th)/lb',      'Machine_002_008' : 'cal(th)/g',
      };
    }
    else if (expression_target == 'Machine_003'){ //엔트로피
      items = {
        'Machine_003_001' : 'J/kg*℃',          'Machine_003_002' : 'kJ/kg*℃',      'Machine_003_003' : 'cal/g*℃',
        'Machine_003_004' : 'cal/kg*℃',        'Machine_003_005' : 'kcal/kg*℃',    'Machine_003_006' : 'BTU/lb*℃',
        'Machine_003_007' : 'J/kg*K',           'Machine_003_008' : 'BTU(th)/lb*℉', 'Machine_003_009' : 'cal(th)/g*K',
      };
    }
    else if (expression_target == 'Machine_004'){ //확산계수
      items = {
        'Machine_004_001' : 'm²/s',            'Machine_004_002' : 'cm²/s',         'Machine_004_003' : 'in²/s',
        'Machine_004_004' : 'ft²/s',           'Machine_004_005' : 'ft²/h',
      };
    }
    else if (expression_target == 'Machine_005'){ //점성계수
      items = {
        'Machine_005_001' : 'Pa*s',            'Machine_005_002' : 'N*s/m²',        'Machine_005_003' : 'kg/m*s',
        'Machine_005_004' : 'P(Poise)',        'Machine_005_005' : 'cP',            'Machine_005_006' : 'μP',
        'Machine_005_007' : 'kgf*s/m²',        'Machine_005_008' : 'kgf*h/m²',      'Machine_005_009' : 'pdl*s/ft²',
        'Machine_005_010' : 'lbf*s/ft²',       'Machine_005_011' : 'lbf*h/ft²',     'Machine_005_012' : 'lb*m/s*ft',
        'Machine_005_013' : 'lbf*s/in²',       'Machine_005_014' : 'lb*m/h*ft',     'Machine_005_015' : 'slug/s*ft',
      };
    }
    else if (expression_target == 'Machine_006'){ //동점성계수
      items = {
        'Machine_006_001' : 'm²/s',            'Machine_006_002' : 'St(Stokes)',    'Machine_006_003' : 'cSt',
        'Machine_006_004' : 'm²/h',            'Machine_006_005' : 'in²/s',         'Machine_006_006' : 'ft²/s',
        'Machine_006_007' : 'in²/h',           'Machine_006_008' : 'ft²/h',
      };
    }
    else if (expression_target == 'Machine_007'){ //열전도율
      items = {
        'Machine_007_001' : 'W/m*℃',          'Machine_007_002' : 'kW/m*℃',       'Machine_007_003' : 'W/cm*℃',
        'Machine_007_004' : 'kW/cm*℃',        'Machine_007_005' : 'kcal/m*h*℃',   'Machine_007_006' : 'cal/s*cm*℃',
        'Machine_007_007' : 'BTU*in/h*℉*ft²', 'Machine_007_008' : 'BTU*ft/h*℉*ft²','Machine_007_009' : 'BTU*in/h*℉*in²',
        'Machine_007_010' : 'BTU*in/s*℉*ft²', 'Machine_007_011' : 'BTU(th)*ft/h*℉*ft²','Machine_007_012' : 'BTU(th)*in/h*℉*ft²',
        'Machine_007_013' : 'BTU(th)*in/s*℉*ft²','Machine_007_014' : 'cal(th)/cm*s*℃', 'Machine_007_015' : 'W/m*K',
      };
    }
    else if (expression_target == 'Machine_008'){ //투과율
      items = {
        'Machine_008_001' : 'kg/Pa*s*m²',      'Machine_008_002' : 'perm(0℃)',     'Machine_008_003' : 'perm(23℃)',
      };
    }
    else if (expression_target == 'Machine_009'){ //열유속
      items = {
        'Machine_009_001' : 'W/m²',            'Machine_009_002' : 'kW/m²',         'Machine_009_003' : 'W/cm²',
        'Machine_009_004' : 'kW/cm²',          'Machine_009_005' : 'kcal/h*m²',     'Machine_009_006' : 'cal/s*cm²',
        'Machine_009_007' : 'BTU/s*in²',       'Machine_009_008' : 'BTU/h*in²',     'Machine_009_009' : 'BTU/s*ft²',
        'Machine_009_010' : 'BTU/h*ft²',       'Machine_009_011' : 'BTU(th)/h*ft²', 'Machine_009_012' : 'BTU(th)/min*ft²',
        'Machine_009_013' : 'BTU(th)/s*ft²',   'Machine_009_014' : 'BTU(th)/s*in²', 'Machine_009_015' : 'cal(th)/min*cm²',
        'Machine_009_016' : 'cal(th)/s*cm²',
      };
    }
    else if (expression_target == 'Machine_010'){ //열저항
      items = {
        'Machine_010_001' : 'K/W',             'Machine_010_002' : '℉*h/BTU',       'Machine_010_003' : '℉*h/BTU(th)',
        'Machine_010_004' : '℉*s/BTU',        'Machine_010_005' : '℉*s/BTU(th)',
      };
    }
    else if (expression_target == 'Machine_011'){ //열저항율
      items = {
        'Machine_011_001' : 'm*K/W',           'Machine_011_002' : '℉*h*ft²/BTU*in', 'Machine_011_003' : '℉*h*ft²/BTU(th)*in',
      };
    }
    else if (expression_target == 'Machine_012'){ //열발생율
      items = {
        'Machine_012_001' : 'W/m³',            'Machine_012_002' : 'kcal/h*m³',     'Machine_012_003' : 'BTU/h*ft³',
        'Machine_012_004' : 'BTU/h*in³',       'Machine_012_005' : 'kcal(th)/h*m³', 'Machine_012_006' : 'BTU(th)/h*ft³',
        'Machine_012_007' : 'BTU(th)/h*in³',
      };
    }
    else if (expression_target == 'Machine_013'){ //열용량
      items = {
        'Machine_013_001' : 'J/℃',            'Machine_013_002' : 'kJ/℃',          'Machine_013_003' : 'cal/℃',
        'Machine_013_004' : 'kcal/℃',         'Machine_013_005' : 'BTU/℉',         'Machine_013_006' : 'J/K',
        'Machine_013_007' : 'BTU(th)/℉',
      };
    }
    else if (expression_target == 'Machine_014'){ //열전달계수
      items = {
        'Machine_014_001' : 'W/℃*m²',         'Machine_014_002' : 'kW/℃*m²',       'Machine_014_003' : 'W/℃*cm²',
        'Machine_014_004' : 'kcal/h*℃*m²',    'Machine_014_005' : 'cal/s*℃*cm²',   'Machine_014_006' : 'BTU/h*℉*ft²',
        'Machine_014_007' : 'BTU/h*℉*in²',    'Machine_014_008' : 'W/K*m²',         'Machine_014_009' : 'BTU(th)/h*℉*ft²',
        'Machine_014_010' : 'BTU(th)/s*℉*ft²','Machine_014_011' : 'cal(th)/s*℃*cm²','Machine_014_012' : 'kcal(th)/h*℃*m²',
      };
    }
    else if (expression_target == 'Machine_015'){ //열밀도
      items = {
        'Machine_015_001' : 'J/m²',           'Machine_015_002' : 'BTU/ft²',       'Machine_015_003' : 'BTU(th)/ft²',
        'Machine_015_004' : 'cal/cm²',        'Machine_015_005' : 'cal(th)/cm²',   'Machine_015_006' : 'langley',
      };
    }
    else if (expression_target == 'Machine_016'){ //열차폐
      items = {
        'Machine_016_001' : 'm²*K/W',         'Machine_016_002' : 'clo',           'Machine_016_003' : '℉*h*ft²/BTU',
        'Machine_016_004' : '℉*h*ft²/BTU(th)',
      };
    }

    /* 방사선 */

    else if (expression_target == 'Radiation_001'){ //방사능
      items = {
        'Radiation_001_001' : 'pCi',             'Radiation_001_002' : 'nCi',           'Radiation_001_003' : 'μCi',
        'Radiation_001_004' : 'mCi',             'Radiation_001_005' : 'Ci',            'Radiation_001_006' : 'mBq',
        'Radiation_001_007' : 'Bq',              'Radiation_001_008' : 'kBq',           'Radiation_001_009' : 'MBq',
        'Radiation_001_010' : 'GBq',             'Radiation_001_011' : 'TBq',           'Radiation_001_012' : 'dps',
        'Radiation_001_013' : 'dpm',             'Radiation_001_014' : 'dph',
      };
    }
    else if (expression_target == 'Radiation_002'){ //조사선량
      items = {
        'Radiation_002_001' : 'nR',             'Radiation_002_002' : 'μR',             'Radiation_002_003' : 'mR',
        'Radiation_002_004' : 'R',              'Radiation_002_005' : 'pGy in air',     'Radiation_002_006' : 'nGy in air',
        'Radiation_002_007' : 'μGy in air',     'Radiation_002_008' : 'mGy in air',     'Radiation_002_009' : 'Gy in air',
        'Radiation_002_010' : 'pC/ky',          'Radiation_002_011' : 'nC/kg',          'Radiation_002_012' : 'μC/kg',
        'Radiation_002_013' : 'mC/kg',          'Radiation_002_014' : 'C/kg',
      };
    }
    else if (expression_target == 'Radiation_003'){ //등가선량
      items = {
        'Radiation_003_001' : 'mrem',           'Radiation_003_002' : 'rem',            'Radiation_003_003' : 'μSv',
        'Radiation_003_004' : 'mSv',            'Radiation_003_005' : 'Sv',
      };
    }
    else if (expression_target == 'Radiation_004'){ //흡수선량
      items = {
        'Radiation_004_001' : 'mrad',           'Radiation_004_002' : 'rad',            'Radiation_004_003' : 'μGy',
        'Radiation_004_004' : 'mGy',            'Radiation_004_005' : 'Gy',
      };
    }
    else if (expression_target == 'Radiation_005'){ //표면오염도
      items = {
        'Radiation_005_001' : 'μCi/cm²',       'Radiation_005_002' : 'dpm/100cm²',     'Radiation_005_003' : 'Bq/cm²',
        'Radiation_005_004' : 'Bq/m²',
      };
    }
    else if (expression_target == 'Radiation_006'){ //공기오염도
      items = {
        'Radiation_006_001' : 'μCCi/cm³',      'Radiation_006_002' : 'MBq/m³',
      };
    }
    else if (expression_target == 'Radiation_007'){ //방사능농도
      items = {
        'Radiation_007_001' : 'Bq/m³',         'Radiation_007_002' : 'Bq/cm³',        'Radiation_007_003' : 'uCi/cc',
        'Radiation_007_004' : 'Ci/cc',
      };
    }

    /* 기타 */

    else if (expression_target == 'Etc_001'){ //공기오염도
      items = {
        'Etc_001_001' : 'g',              'Etc_001_002' : 'M(규모)',
      };
    }
    else if (expression_target == 'Etc_002'){ // 전송속도
      items = {
        'Etc_002_001' : 'cps',             'Etc_002_002' : 'bps',           'Etc_002_003' : 'kbps',
        'Etc_002_004' : 'Mbps',            'Etc_002_005' : 'Bps',           'Etc_002_006' : 'kBps',
        'Etc_002_007' : 'MBps',
      };
    }
    else if (expression_target == 'Etc_003'){ // 저장용량
      items = {
        'Etc_003_001' : 'bit',             'Etc_003_002' : 'Byte',          'Etc_003_003' : 'character',
        'Etc_003_004' : 'kB',              'Etc_003_005' : 'MB',            'Etc_003_006' : 'GB',
        'Etc_003_007' : 'TB',
      };
    }

    return items;
  }

}