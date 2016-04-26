<?php
/**
 * 我的申请   融资企业申请融资
 */
defined('IN_DESTOON') or exit('Access Denied');
require DT_ROOT.'/module/'.$module.'/common.inc.php';
require MD_ROOT.'/member.class.php';
require DT_ROOT.'/include/post.func.php';
if(!$_userid) dheader($CFG['url'].'member/login.php');
require DT_ROOT.'/module/food/food.class.php';
$oFood = new food(23);
if($action=='show'){
    $id = isset($id)?intval($id):0;
    if(empty($id)) dalert('申请信息不存在','myapply.php');
    $oFood->itemid = $id;
    $info = $oFood->get_one();
    if(!$info || $info['userid']!=$_userid) dalert('申请信息不存在','myapply.php');
    $seo_title = '我的申请-详情-会员中心-';
    $two_nav_selected = 'myapply';

    //融资进度
    list($aLog,$totalpage) = $oFood->logList('*','food_itemid='.$id,'addtime desc',10);

    include template('myapplyshow', $module);
}else{

    list($aFood,$totalpage) = $oFood->foodList('*',' userid = '.$_userid,'addtime desc','10');

    $seo_title = '我的申请-会员中心-';
    $two_nav_selected = 'myapply';
    include template('myapply', $module);
}
?>