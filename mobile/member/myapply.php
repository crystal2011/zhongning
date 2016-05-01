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
    list($aFood,$totalpage) = $oFood->foodList('*',' userid = '.$_userid,'addtime desc','10');
    $info = '';
    if($aFood){
        foreach($aFood as $k=>$v){
            if($v['status']==3){
                $status = '完成融资';
            }else if ($v['status']==2){
                $status = '审核中';
            }else if($v['status']==1){
                $status = '拒绝融资';
            }else{
                $status = '失效';
            }
            $info .= '
                <tr><td>金额：'.$v['price'].'</td><td >期限：'.$v['month'].'</td></tr>
                <tr><td colspan="2">抵押/担保：'.dsubstr($v['danbao'],12,'...').'</td></tr>
                <tr>
                    <td>时间：'.date('Y-m-d',$v['addtime']).'</td>
                    <td>
                        状态：'.$status.'</td>
                </tr>
                <tr class="bottomtr"><td colspan="2" align="center"><a href="myapplyshow.php?id='.$v['itemid'].'" class="blue" >查看</a></td></tr>';
        }
    }
    exit(json_encode(array('info'=>$info,'totalpage'=>$totalpage)));
}else {
    if(!$_userid) dheader($CFG['url'].'member/login.php');
    list($aFood,$totalpage) = $oFood->foodList('*',' userid = '.$_userid,'addtime desc','10');

    $seo_title = '我的申请-会员中心-';
    $topname = '我的申请';
    include template('myapply', 'mobile/member');
}
?>