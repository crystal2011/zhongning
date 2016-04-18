<?php
/**
 * 手机端-首页
 */
define('DT_REWRITE', true);
require '../common.inc.php';
//最新新闻
require_once '../module/article/article.class.php';
$oArticle = new article(21);

//有图片的最新两个文章
$pagesize = 2;
$offset = 0;
$where = " thumb!='' ";
$aArticle = $oArticle->get_list($where .' and status = 3');
$articlewhereid = '';
if(isset($aArticle[0])){
    $articlewhereid .= $aArticle[0]['itemid'];
}
if(isset($aArticle[1])){
    $articlewhereid .= ','.$aArticle[1]['itemid'];
}

$mygetcount = false;
$pagesize = 3;
$aNewsNew = $oArticle->get_list(($articlewhereid?'itemid not in ('.$articlewhereid.') and ':'').'status = 3');



require_once '../module/member/member.class.php';
$oMember = new member();

$where = ' 1=1 ';
if(isset($dtcity['areaid'])){
    $areainfo = get_area($dtcity['areaid']);
    $arrchildid = $areainfo['arrchildid'];
    $where = " areaid in ($arrchildid)";
}

//名厨
require_once '../module/know/know.class.php';
$oCai = new know();
$pagesize = 4;
$aCai = $oCai->get_list($where.' and status = 3');
$aSchool = $oMember->getListUser($aCai);



//餐饮供应
require_once '../module/food/food.class.php';
$oFood = new food(23);
$aHotFood = $oFood->getright('title,itemid,price,likes,hits,unit,thumb',10,'addtime desc');

include template('index','mobile');