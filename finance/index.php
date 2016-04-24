<?php
/**
 * 融资申请
 *
 */
define('DT_REWRITE', true);
require '../common.inc.php';

if($submit){
    if(!$_userid) exit(json_encode(array('status'=>'n','info'=>'请先登录')));
    require DT_ROOT.'/include/post.func.php';

    $captcha = isset($captcha)?$captcha:'';
    if(captcha($captcha,1,true)) exit(json_encode(array('status'=>'yn','info'=>'验证码错误')));
    if(!check_token()) exit(json_encode(array('status'=>'n','info'=>'操作失效，请重试')));

    require DT_ROOT.'/module/food/food.class.php';
    $oFood = new food(23);
    $post = array(
        'title'=>isset($title)?$title:'',
        'mobile'=>isset($mobile)?$mobile:'',
        'address'=>isset($address)?$address:'',
        'price'=>isset($price)?$price:'',
        'introduce'=>isset($introduce)?$introduce:'',
        'month'=>isset($month)?$month:'',
        'danbao'=>isset($danbao)?$danbao:'',
        'userid'=>$_userid,
        'status'=>2
    );
    if(!$post = $oFood->pass($post,false)){
        exit(json_encode(array('status'=>'n','info'=>$oFood->errmsg)));
    }
    $oFood->add($post);
    //预约加1


    exit(json_encode(array('status'=>'y','info'=>'申请成功')));
}else{


    require_once '../module/extend/ad.class.php';
    $oAd = new ad;
    $oAd->aid = 52;
    $aAd = $oAd->get_one();
    if($aAd){
        $oAd->pid = $aAd['pid'];
        $pAd = $oAd->get_one_place();
    }else{
        $pAd['height'] = 0;
    }
    $nav_selected = 'finance';
    $seo_title = '融资业务-';
    include template('index','finance');
}


?>