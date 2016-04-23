<?php
define('DT_REWRITE', true);
require '../common.inc.php';
require_once '../module/article/article.class.php';
$oArticle = new article(21);

$id = isset($id)?intval($id):0;
if(empty($id)){
    dalert('非法操作','/article/index.php');
}

$oArticle->itemid = $id;
$info= $oArticle->get_one();

if(!$oArticle->checkArticle($info)){
    dalert($oArticle->errmsg,'/article/index.php');
}
//更新浏览量
$oArticle->editHits();

$aHotKeyword = $oArticle->getKeyword();
$aNewArticle = $oArticle->getright('title,itemid',8,'addtime desc'); //最新
$aHotArticle = $oArticle->getright('title,itemid',8,'hits desc'); //热门

$anwhere = ' and itemid != '.$id;
if($info['keyword']){
    $anwhere .= ' and keyword like "%'.$info['keyword'].'%"  ';
}
$aLikeArticle = $oArticle->getright('title,itemid',10,'addtime desc',$anwhere); //感兴趣

require_once '../module/extend/ad.class.php';
$oAd = new ad;
$oAd->aid = 54;
$aAd = $oAd->get_one();
if($aAd){
    $oAd->pid = $aAd['pid'];
    $pAd = $oAd->get_one_place();
}else{
    $pAd['height'] = 0;
}


$arkey = '';
$seo_title = $info['title'].'-资讯-';
$nav_selected = 'article';
include template('show', 'article');
?>