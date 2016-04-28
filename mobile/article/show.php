<?php
/**
 * 手机端-文章模块-文章详情
 */
define('DT_REWRITE', true);
require '../../common.inc.php';
require_once '../../module/article/article.class.php';
$oArticle = new article(21);




$seo_title = '最新资讯-';
$topname = '最新资讯';

include template('article/show','mobile');