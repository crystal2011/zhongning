<?php
/**
 * 投资申请
 *
 */
define('DT_REWRITE', true);
require '../../common.inc.php';


$nav_selected = 'invest';

require_once '../../module/extend/ad.class.php';
$oAd = new ad;
$oAd->aid = 53;
$aAd = $oAd->get_one();
if($aAd){
    $oAd->pid = $aAd['pid'];
    $pAd = $oAd->get_one_place();
}else{
    $pAd['height'] = 0;
}

$seo_title = '投资理财-';
$topname = '投资理财';
include template('index','mobile/invest');
?>