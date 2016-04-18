<?php
defined('IN_DESTOON') or exit('Access Denied');
$type = isset($type)?$type:'';
switch($type){
    case 'getFirstCity':
        //获取第一级分站地区
        $aCity = cache_read('city.php');
        $str = '';
        if(isset($aCity['area']) && $aCity['area']){
            foreach($aCity['area'] as $k=>$v){
                $str .= '<option value="'.$v['areaid'].'">'.$v['areaname'].'</option>';
            }
        }
        echo $str;
        break;
    case 'wapgetFirstCity':
        //获取第一级分站地区
        $aCity = cache_read('city.php');
        $str = '';
        if(isset($aCity['area']) && $aCity['area']){
            foreach($aCity['area'] as $k=>$v){
                $str .= '<li data-id="'.$v['areaid'].'">'.$v['areaname'].'</li>';
            }
        }
        echo $str;
        break;
    case 'getFirstCityli':
        //获取第一级分站地区
        $areaid = isset($areaid)?$areaid:0;
        $aCity = get_mainarea($areaid);
        $str = '';
        if($aCity){
            foreach($aCity as $k=>$v){
                $str .= '<li data-id="'.$v['areaid'].'">'.$v['areaname'].'</li>';
            }
        }
        echo $str;
        break;
    case 'wapgetSecondCity':
        //获取第二级分站地区
        $aCity = cache_read('city.php');
        $areaid = isset($areaid)?intval($areaid):0;
        $str = '';
        if(isset($aCity['area'][$areaid]['list']) && $aCity['area'][$areaid]['list']){
            foreach($aCity['area'][$areaid]['list'] as $k=>$v){
                $str .= '<li data-id="'.$v['areaid'].'">'.$v['areaname'].'</li>';
            }
        }
        echo $str;
        break;
    case 'getSecondCity':
        //获取第二级分站地区
        $aCity = cache_read('city.php');
        $areaid = isset($areaid)?intval($areaid):0;
        $str = '';
        if(isset($aCity['area'][$areaid]['list']) && $aCity['area'][$areaid]['list']){
            foreach($aCity['area'][$areaid]['list'] as $k=>$v){
                $str .= '<option value="'.$v['areaid'].'">'.$v['areaname'].'</option>';
            }
        }
        echo $str;
        break;
    case 'getCityButton':
        //分区刷新
        $areaid = isset($areaid)?intval($areaid):0;
        setcity($areaid);
        echo true;
        break;
    default:
        break;
}