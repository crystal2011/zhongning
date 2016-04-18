<?php
/**
 * 手机端-餐饮招聘-详情页
 */
define('DT_REWRITE', true);
require '../../common.inc.php';
require_once '../../module/job/job.class.php';
$oJob = new job(9);

$isajax = isset($isajax)?true:false;
if($isajax){  //用户发布、编辑预览
    $_POST = strip_sql(daddslashes($_POST));
    strip_key($_POST);
    $content = $_POST['content'];
    unset($_POST['content']);
    $_POST = dhtmlspecialchars($_POST);
    $_POST['content'] = addslashes(dsafe($content));
    $info = $_POST;
    $codetishicode = $info['code'];
    $id = $info['likes'] = $info['hits'] = $info['comments'] = 0;
    $info['telephone'] = $info['mobile'];
    $info['addtime'] = $DT_TIME;
    $seo_title = $info['title'].'-餐饮供应-预览-';
    $topname = '餐饮供应-预览';
    $backurl = 'javascript:history.back();';
}else{
    $id = isset($id)?intval($id):0;
    if(empty($id)){
        dalert('非法操作','/mobile/job/index.php');
    }


    $oJob->itemid = $id;
    $info = $oJob->get_one();
    if(isset($showtype)){   //预览
        $s = chcekHorn($info,2);
        if($s!==true) dalert($s,$forward);
        $backurl = '/mobile/discount/index.php';
    }else {
        if (!$checkJob = $oJob->checkJob($info)) {
            dalert($oJob->errmsg, '/mobile/job/index.php');
        }
        $oJob->editHits();  //更新浏览量
        addHits($info['userid']);
        $backurl = '/mobile/job/index.php';
    }
    //当时发布的code
    require_once '../../module/special/special.class.php';
    $oSpecial = new special(11);
    $codetishicode = $oSpecial->getShowCode($id,2);
    $seo_title = $info['title'].'-餐饮招聘-';
    $topname = '餐饮招聘';

}


$aRecommendFood = $oJob->getright('title,itemid,introduce,thumb,hits,likes,company,areaid',20,'addtime desc');  //推荐

$aSetting = cache_read('module-9.php');
$aSetting['education'] = explode('|',$aSetting['education']);
$aSetting['type'] = explode('|',$aSetting['type']);

$commenttypeid = 3;
$likenum = 3;
$moduleidtype = 2;


include template('job/show','mobile');