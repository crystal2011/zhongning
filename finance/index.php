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
    );
    if(!$post = $oFood->pass($post,false)){
        exit(json_encode(array('status'=>'n','info'=>$oFood->errmsg)));
    }
    $oFood->add($post);
    //预约加1


    exit(json_encode(array('status'=>'y','info'=>'申请成功')));
}else{
    $nav_selected = 'finance';

    $seo_title = '融资业务-';
    include template('index','finance');
}


?>