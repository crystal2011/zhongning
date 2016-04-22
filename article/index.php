<?php
define('DT_REWRITE', true);
require '../common.inc.php';

//文章
$arkey = isset($arkey)?$arkey:'';
$anwhere = '';
if($arkey){
    $anwhere .= ' keyword like "%'.$arkey.'%" and ';
}
$pagesize = 8;
$offset = ($page-1)*$pagesize;
require_once '../module/article/article.class.php';
$oArticle = new article(21);
$where = ' 1 = 1 ';
$aArticle = $oArticle->get_list($anwhere.' status = 3');
$totalpage = ceil($items/$pagesize);
if($arkey && $aArticle){ //保留关键字
    $oArticle->saveKeyword($arkey);
}

$aHotKeyword = $oArticle->getKeyword();
$aNewArticle = $oArticle->getright('title,itemid',8,'addtime desc'); //最新
$aHotArticle = $oArticle->getright('title,itemid',8,'hits desc'); //热门


$nav_selected = 'article';
$seo_title = '最新资讯-';
include template('index','article');
?>