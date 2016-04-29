<?php
/**
 * 手机端-文章模块-文章详情
 */
define('DT_REWRITE', true);
require '../../common.inc.php';
require_once '../../module/article/article.class.php';
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


$seo_title = $info['title'].'-最新资讯-';
$topname = '最新资讯';
$backurl = '/mobile/abouts/index.php';
include template('article/show','mobile');