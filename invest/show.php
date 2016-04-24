<?php
/**
 * 投资申请
 *
 */
define('DT_REWRITE', true);
require '../common.inc.php';
require DT_ROOT.'/module/sell/sell.class.php';
$oSell = new sell(5);

if($submit){
    if(!$_userid) exit(json_encode(array('status'=>'n','info'=>'请先登录')));
    $id = isset($id)?intval($id):0;
    if(empty($id)) exit(json_encode(array('status'=>'n','info'=>'投资项目不存在')));
    if(!check_token()) exit(json_encode(array('status'=>'n','info'=>'操作失效，请重试')));
    $post = array(
        'title'=>isset($title)?$title:'',
        'mobile'=>isset($mobile)?$mobile:'',
        'price'=>isset($price)?$price:'',
        'sell_itemid'=>$id,
        'month'=>isset($month)?$month:'',
        'bonding'=>isset($bonding)?$bonding:'',
        'userid'=>$_userid,
        'status'=>2,
    );
    require_once DT_ROOT.'/module/buy/buy.class.php';
    $oBuy = new buy;
    if(!$post = $oBuy->pass($post,false)){
        exit(json_encode(array('status'=>'n','info'=>$oBuy->errmsg)));
    }
    $oBuy->add($post);

    require_once DT_ROOT.'/module/member/member.class.php';
    $oMember = new member;
    $oMember->addMyApply();
    exit(json_encode(array('status'=>'y','info'=>'你已提交成功,<br />稍后投资顾问会跟您联系！')));
}else{
    $id = isset($id)?intval($id):0;
    if(empty($id)) dalert('投资项目不存在','/invest/index.php');

    $oSell->itemid = $id;
    $info = $oSell->get_one();
    if(!$oSell->checkSell($info)){
        dalert($oSell->errmsg,'/invest/index.php');
    }

    require_once '../module/extend/ad.class.php';
    $oAd = new ad;
    $oAd->aid = 53;
    $aAd = $oAd->get_one();
    if($aAd){
        $oAd->pid = $aAd['pid'];
        $pAd = $oAd->get_one_place();
    }else{
        $pAd['height'] = 0;
    }

    $nav_selected = 'invest';
    $seo_title = $info['title'].'-投资理财-';
    include template('show','invest');
}

?>