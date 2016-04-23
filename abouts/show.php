<?php
define('DT_REWRITE', true);
require '../common.inc.php';
require_once '../module/info/info.class.php';
$oInfo = new info(24);
$oInfo->table = $db->pre.'info_24';
$oInfo->table_data = $db->pre.'info_data_24';

$id = isset($id)?intval($id):0;
if(empty($id)){
    dalert('非法操作','/abouts/news.php');
}

$oInfo->itemid = $id;
$info= $oInfo->get_one();

if(!$oInfo->checkInfo($info)){
    dalert($oInfo->errmsg,'/abouts/news.php');
}
//更新浏览量
$oInfo->editHits();

$aNewArticle = $oInfo->getright('title,itemid',8,'addtime desc'); //最新
$aHotArticle = $oInfo->getright('title,itemid',8,'hits desc'); //热门

$seo_title = $info['title'].'-动态-';
$nav_selected = 'abouts';
$two_nav_selected = 'news';
include template('show', 'abouts');
?>