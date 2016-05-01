<?php
/**
 * 我的预约  投资人预约登记投标
 */
require '../../member/config.inc.php';
require '../../common.inc.php';
require DT_ROOT.'/module/'.$module.'/common.inc.php';
$action = isset($action)?$action:'';

require MD_ROOT.'/member.class.php';
require DT_ROOT.'/include/post.func.php';

require_once DT_ROOT.'/module/buy/buy.class.php';
$oBuy = new buy;

require_once DT_ROOT . '/module/sell/sell.class.php';
$oSell = new sell(5);

if($action=='ajax'){
    if(!$_userid) exit(json_encode(array('status'=>'n','info'=>'请登录')));
    $id = isset($id)?intval($id):0;
    if(empty($id)) exit(json_encode(array('status'=>'n','info'=>'预约信息不存在')));
    $oBuy->itemid = $id;
    $info = $oBuy->get_one();
    if(!$info || $info['userid']!=$_userid) exit(json_encode(array('status'=>'n','info'=>'预约信息不存在')));

    //投资进度
    list($aLog,$totalpage) = $oBuy->logList('*','food_itemid='.$id,'addtime desc',10);
    $info = '';
    if($aLog){
        foreach($aLog as $k=>$v){

            $info .= '<tr>
                <td  align="center">'.date('Y-m-d H:i:s',$v['addtime']).'</td>
                <td>'.$v['content'].'</td>
            </tr>';
        }
    }
    exit(json_encode(array('info'=>$info,'totalpage'=>$totalpage)));
}else {
    if(!$_userid) dheader($CFG['url'].'mobile/member/login.php');
    $id = isset($id)?intval($id):0;
    if(empty($id)) dalert('预约信息不存在','myorder.php');
    $oBuy->itemid = $id;
    $info = $oBuy->get_one();
    if(!$info || $info['userid']!=$_userid) dalert('预约信息不存在','myorder.php');

    $oSell->itemid = $info['sell_itemid'];
    $aSell = $oSell->get_one();

    //投资进度
    list($aLog,$totalpage) = $oBuy->logList('*','food_itemid='.$id,'addtime desc',10);


    $seo_title = '我的预约-详情-会员中心-';
    $topname = '我的预约';
    include template('myordershow', 'mobile/member');
}