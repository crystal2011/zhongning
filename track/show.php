<?php
define('DT_REWRITE', true);
require '../common.inc.php';
require_once '../module/exhibit/exhibit.class.php';
$oBrand = new exhibit(8);

$id = isset($id)?intval($id):0;
if(empty($id)){
    dalert('非法操作','/index.php');
}

$oBrand->itemid = $id;
$info= $oBrand->get_one();

if(!$oBrand->checkJob($info)){
    dalert($oBrand->errmsg,'/index.php');
}
//更新浏览量
$oBrand->editHits();

$aNewArticle = $oBrand->getright('title,itemid',8,'addtime desc'); //最新
$aHotArticle = $oBrand->getright('title,itemid',8,'hits desc'); //热门


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

$nav_selected = 'abouts';
$seo_title = $info['title'].'-业绩公示-';
include template('show', 'track');
?>