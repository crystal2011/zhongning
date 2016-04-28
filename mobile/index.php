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

//投资项目
require_once '../module/sell/sell.class.php';
$oSell = new sell(5);
$aSell = $oSell->sellLists('*',' status=3 ','addtime desc','5');

//最新资讯
//文章
require_once '../module/article/article.class.php';
$oArticle = new article(21);
$mygetcount = false;
$pagesize = 2;
$aArticleHasThumb = $oArticle->get_list("status = 3 and thumb != ''"); //最新有图
$snd = '';
if($aArticleHasThumb){
    $sArticleHasThumb = '';
    foreach($aArticleHasThumb as $k=>$v){
        $sArticleHasThumb .= $v['itemid'].',';
    }
    $snd = " and itemid not in (".substr($sArticleHasThumb,0,-1).")";
}
$pagesize = 3;
$aArticleNews = $oArticle->get_list("status = 3 ".$snd); //最新没上面

include template('index','mobile');