<?php
define('DT_REWRITE', true);
require '../common.inc.php';

require_once '../module/info/info.class.php';
$oInfo = new info(24);
$oInfo->table = $db->pre.'info_24';
list($aInfo,$totalpage) = $oInfo->foodList('*',' status = 3');

$aHotArticle = $oInfo->getright('title,itemid',8,'hits desc'); //热门


$nav_selected = 'abouts';
$two_nav_selected = 'news';
$seo_title = '公司动态-';
include template('news','abouts');
?>