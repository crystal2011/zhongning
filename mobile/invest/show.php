<?php
/**
 * 投资申请
 *
 */
define('DT_REWRITE', true);
require '../../common.inc.php';
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
        'userid'=>$_userid,
        'status'=>2,
        'gender'=>isset($gender)?$gender:'',
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
    if(empty($id)) dalert('投资项目不存在','/mobile/invest/list.php');

    $oSell->itemid = $id;
    $info = $oSell->get_one();
    if(!$oSell->checkSell($info)){
        dalert($oSell->errmsg,'/mobile/invest/list.php');
    }

    $topname = '投资理财';
    $seo_title = $info['title'].'-投资理财-';
    $backurl = '/mobile/list.php';
    include template('show','mobile/invest');
}

?>