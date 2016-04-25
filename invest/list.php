<?php
/**
 * 投资申请
 *
 */
define('DT_REWRITE', true);
require '../common.inc.php';

//投资项目
require_once DT_ROOT.'/module/sell/sell.class.php';
$oSell = new sell(5);
list($aSell,$totalpage) = $oSell->sellList('*',' status=3 ','addtime desc','10');




require_once '../module/extend/ad.class.php';
$oAd = new ad;
$oAd->aid = 53;
$aAd = $oAd->get_one();
if($aAd){
    $oAd->pid = $aAd['pid'];
    $pAd = $oAd->get_one_place();
}else{
    $pAd['height'] = 0;
}
$nav_selected = 'invest';
$seo_title = '投资理财-';
include template('list','invest');
?>