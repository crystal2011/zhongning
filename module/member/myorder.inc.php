<?php
defined('IN_DESTOON') or exit('Access Denied');
$action = isset($action)?$action:'';
if(!$_userid) dheader($CFG['url'].'member/login.php');
require DT_ROOT.'/module/food/food.class.php';
$oFood = new food(23);
if($action=='show'){
    $id = isset($id)?intval($id):0;
    if(empty($id)) dalert('预约信息不存在','myorder.php');
    $oFood->itemid = $id;
    $info = $oFood->get_one();
    if(!$info || $info['userid']!=$_userid) dalert('预约信息不存在','myorder.php');
    $seo_title = '我的预约-详情-会员中心-';
    $two_nav_selected = 'myorder';
    include template('myordershow', $module);
}else{

    list($aFood,$totalpage) = $oFood->foodList('*',' userid = '.$_userid,'addtime desc','10');

    $seo_title = '我的预约-会员中心-';
    $two_nav_selected = 'myorder';
    include template('myorder', $module);
}
?>