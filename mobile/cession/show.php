<?php
/**
 * 手机端-店铺转让-详情页
 */
define('DT_REWRITE', true);
require '../../common.inc.php';
require_once '../../module/sell/sell.class.php';
$oSell = new sell(5);
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
    $seo_title = $info['title'].'-店铺转让-预览-';
    $topname = '店铺转让-预览';
    $info['company'] = '';
    $info['addtime'] = $DT_TIME;
    $backurl = 'javascript:history.back();';
}else{
    $id = isset($id)?intval($id):0;
    if(empty($id)){
        dalert('非法操作','/mobile/cession/index.php');
    }


    $oSell->itemid = $id;
    $info= $oSell->get_one();
    if(isset($showtype)){   //预览
        $s = chcekHorn($info,3);
        if($s!==true) dalert($s,$forward);
        $backurl = $forward;
    }else{
        if(!$oSell->checkSell($info)){
            dalert($oSell->errmsg,'/mobile/cession/index.php');
        }
        //更新浏览量
        $oSell->editHits();
        addHits($info['userid']);
        $backurl = '/mobile/cession/index.php';
    }
    //当时发布的code
    require_once '../../module/special/special.class.php';
    $oSpecial = new special(11);
    $codetishicode = $oSpecial->getShowCode($id,3);
    $seo_title = $info['title'].'-店铺转让-';
    $topname = '店铺转让';
}


$aRecommendFood = $oSell->getright('title,itemid,hits,likes,thumb,price,address,areaid,addtime,comments',4,'addtime desc');  //推荐




$likenum = 4;
$commenttypeid = 4;
$moduleidtype = 3;

include template('cession/show','mobile');