<?php
/**
 * 手机端-首页
 */
define('DT_REWRITE', true);
require '../common.inc.php';

//广告Flash
require_once '../module/extend/ad.class.php';
$oAd = new ad;
$sAdPlaceHot = $oAd->getAdAllFlash1(37);

include template('index','mobile');