<?php
define('DT_REWRITE', true);
require '../common.inc.php';

$pagesize = 30;
$offset = ($page-1)*$pagesize;
require_once '../module/group/group.class.php';
$oGroup = new group(21);
$list = $oGroup->get_list(' status = 3');

require_once '../module/extend/ad.class.php';
$oAd = new ad;
$oAd->aid = 55;
$aAd = $oAd->get_one();
if($aAd){
    $oAd->pid = $aAd['pid'];
    $pAd = $oAd->get_one_place();
}else{
    $pAd['height'] = 0;
}


$nav_selected = 'question';
$seo_title = '常见问题-';
include template('index','question');
?>