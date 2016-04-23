<?php
define('DT_REWRITE', true);
require '../common.inc.php';

require_once '../module/brand/brand.class.php';
$oBrand = new brand(21);
list($aBrand,$totalpage) = $oBrand->brandList('title,itemid,introduce,addtime','status = 3','addtime desc',20);


$aHotBrand = $oBrand->getright('title,itemid',8,'hits desc'); //热门


require_once '../module/extend/ad.class.php';
$oAd = new ad;
$oAd->aid = 56;
$aAd = $oAd->get_one();
if($aAd){
    $oAd->pid = $aAd['pid'];
    $pAd = $oAd->get_one_place();
}else{
    $pAd['height'] = 0;
}


$nav_selected = '';
$seo_title = '公告-';
include template('index','bbs');
?>