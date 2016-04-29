<?php
define('DT_REWRITE', true);
require '../../common.inc.php';
require_once '../../module/exhibit/exhibit.class.php';
$oBrand = new exhibit(8);

$id = isset($id)?intval($id):0;
if(empty($id)){
    dalert('非法操作','/mobile/tarck/index.php');
}

$oBrand->itemid = $id;
$info= $oBrand->get_one();

if(!$oBrand->checkJob($info)){
    dalert($oBrand->errmsg,'/mobile/tarck/index.php');
}
//更新浏览量
$oBrand->editHits();

$seo_title = $info['title'].'-业绩公示-';
$topname = '业绩公示';
$backurl = '/mobile/tarck/index.php';
include template('show', 'mobile/track');
?>