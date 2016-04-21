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

//投资项目
require_once 'module/sell/sell.class.php';
$oSell = new sell(5);
$aSell = $oSell->sellLists('*',' status=3 ','addtime desc','6');

//最新资讯
//文章
require_once 'module/article/article.class.php';
$oArticle = new article(21);
$mygetcount = false;
$pagesize = 5;
$aArticleHasThumb = $oArticle->get_list("status = 3 and thumb != ''"); //最新有图
$snd = '';
if($aArticleHasThumb){
    $sArticleHasThumb = '';
    foreach($aArticleHasThumb as $k=>$v){
        $sArticleHasThumb .= $v['itemid'].',';
    }
    $snd = " and itemid not in (".substr($sArticleHasThumb,0,-1).")";
}
$pagesize = 5;
$aArticleNews = $oArticle->get_list("status = 3 ".$snd); //最新没上面


$seo_title = '';
$nav_selected = 'index';
include template('index');
?>