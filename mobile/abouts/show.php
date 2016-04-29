<?php
/**
 * 手机端-公司动态-动态详情
 */
define('DT_REWRITE', true);
require '../../common.inc.php';

require_once '../../module/info/info.class.php';
$oInfo = new info(24);
$oInfo->table = $db->pre.'info_24';
$oInfo->table_data = $db->pre.'info_data_24';

$id = isset($id)?intval($id):0;
if(empty($id)){
    dalert('非法操作','/mobile/abouts/news.php');
}

$oInfo->itemid = $id;
$info= $oInfo->get_one();

if(!$oInfo->checkInfo($info)){
    dalert($oInfo->errmsg,'/mobile/abouts/news.php');
}
//更新浏览量
$oInfo->editHits();


$two_nav_selected = 'news';
$topname = '公司动态';
$seo_title = $info['title'].'-公司动态-';
$backurl = '/mobile/abouts/news.php';
include template('abouts/show','mobile');