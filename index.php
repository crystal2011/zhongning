<?php
/**
 * PC 首页
 */
require 'common.inc.php';

//公告
require_once 'module/brand/brand.class.php';
$oBrand = new brand();
$pagesize =10;
$aBrand = $oBrand->get_list(' status = 3','addtime desc');

//公告
require_once 'module/sell/sell.class.php';
$oSell = new sell(5);
$aSell = $oSell->sellLists('*',' status=3 ','addtime desc','6');

$seo_title = '';
$nav_selected = 'index';
include template('index');
?>