<?php
/**
 * 我的申请   融资企业申请融资
 */
require '../../member/config.inc.php';
require '../../common.inc.php';
require DT_ROOT.'/module/'.$module.'/common.inc.php';
require MD_ROOT.'/member.class.php';
require DT_ROOT.'/include/post.func.php';

require DT_ROOT.'/module/food/food.class.php';
$oFood = new food(23);
if($action=='ajax'){
    if(!$_userid) exit(json_encode(array('status'=>'n','info'=>'请登录')));
    $id = isset($id) ? intval($id) : 0;
    if (empty($id)) exit(json_encode(array('status'=>'n','info'=>'申请信息不存在')));
    $oFood->itemid = $id;
    $info = $oFood->get_one();

    if (!$info || $info['userid'] != $_userid) exit(json_encode(array('status'=>'n','info'=>'申请信息不存在')));

    //融资进度
    list($aLog, $totalpage) = $oFood->logList('*', 'food_itemid=' . $id, 'addtime desc', 10);
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
    $id = isset($id) ? intval($id) : 0;
    if (empty($id)) dalert('申请信息不存在', 'myapply.php');
    $oFood->itemid = $id;
    $info = $oFood->get_one();

    if (!$info || $info['userid'] != $_userid) dalert('申请信息不存在', 'myapply.php');
    $seo_title = '我的申请-详情-会员中心-';
    $topname = '我的申请';
    //融资进度
    list($aLog, $totalpage) = $oFood->logList('*', 'food_itemid=' . $id, 'addtime desc', 10);

    include template('myapplyshow', 'mobile/member');
}