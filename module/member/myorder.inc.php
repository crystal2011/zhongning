<?php
/**
 * 我的预约   资人预约登记投标
 */
defined('IN_DESTOON') or exit('Access Denied');
require DT_ROOT.'/module/'.$module.'/common.inc.php';
$action = isset($action)?$action:'';
if(!$_userid) dheader($CFG['url'].'member/login.php');
require MD_ROOT.'/member.class.php';
require DT_ROOT.'/include/post.func.php';

require_once DT_ROOT.'/module/buy/buy.class.php';
$oBuy = new buy;

require_once DT_ROOT . '/module/sell/sell.class.php';
$oSell = new sell(5);

if($action=='show'){
    $id = isset($id)?intval($id):0;
    if(empty($id)) dalert('预约信息不存在','myorder.php');
    $oBuy->itemid = $id;
    $info = $oBuy->get_one();
    if(!$info || $info['userid']!=$_userid) dalert('预约信息不存在','myorder.php');
    $seo_title = '我的预约-详情-会员中心-';

    $oSell->itemid = $info['sell_itemid'];
    $aSell = $oSell->get_one();

    //投资进度
    list($aLog,$totalpage) = $oBuy->logList('*','food_itemid='.$id,'addtime desc',10);

    $two_nav_selected = 'myorder';
    include template('myordershow', $module);
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

    $seo_title = '我的预约-会员中心-';
    $two_nav_selected = 'myorder';
    include template('myorder', $module);
}

?>