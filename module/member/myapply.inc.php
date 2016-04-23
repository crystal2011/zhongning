<?php
defined('IN_DESTOON') or exit('Access Denied');
require DT_ROOT.'/module/'.$module.'/common.inc.php';
require MD_ROOT.'/member.class.php';
require DT_ROOT.'/include/post.func.php';
if(!$_userid) dheader($CFG['url'].'member/login.php');

require_once DT_ROOT.'/module/buy/buy.class.php';
$oBuy = new buy;

require_once DT_ROOT . '/module/sell/sell.class.php';
$oSell = new sell(5);

if($action=='show'){
    $id = isset($id)?intval($id):0;
    if(empty($id)) dalert('申请信息不存在','myapply.php');
    $oBuy->itemid = $id;
    $info = $oBuy->get_one();
    if(!$info || $info['userid']!=$_userid) dalert('申请信息不存在','myapply.php');
    $seo_title = '我的申请-详情-会员中心-';

    $oSell->itemid = $info['sell_itemid'];
    $aSell = $oSell->get_one();

    $two_nav_selected = 'myapply';
    include template('myapplyshow', $module);
}else {

    list($aBuy, $totalpage) = $oBuy->buyList('*', ' userid = ' . $_userid, 'addtime desc', '10');
    //获取项目
    $aSell = array();
    if ($aBuy) {
        $aSellId = array();
        foreach ($aBuy as $k => $v) {
            array_push($aSellId, $v['sell_itemid']);
        }

        $aSell = $oSell->getrightlie($aSellId);
    }

    $seo_title = '我的申请-会员中心-';
    $two_nav_selected = 'myapply';
    include template('myapply', $module);
}
?>