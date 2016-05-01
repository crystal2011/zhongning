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
    list($aBuy, $totalpage) = $oBuy->buyList('*', 'userid='.$_userid, 'addtime desc', '10');
    //获取项目
    $aSell = array();
    if ($aBuy) {
        $aSellId = array();
        foreach ($aBuy as $k => $v) {
            array_push($aSellId, $v['sell_itemid']);
        }

        $aSell = $oSell->getrightlie($aSellId);
    }
    $info = '';
    if($aBuy){
        foreach($aBuy as $k=>$v){
            $company = isset($aSell[$v['sell_itemid']])?'<a href="/mobile/invest/show.php?id='.$v['sell_itemid'].'"  class="youxiao">'.$aSell[$v['sell_itemid']]['company'].'</a>':'<span class="shixiao">失效</span>';
            if($v['status']==3){
                $status = '完成投资';
            }else if ($v['status']==2){
                $status = '审核中';
            }else if($v['status']==1){
                $status = '拒绝投资';
            }else{
                $status = '失效';
            }
            $info .= '<tr><td colspan="2">
                    企业：'.$company.'</td>
                </tr>
                <tr><td>金额：'.$v['price'].'</td><td >期限：'.$v['month'].'</td></tr>
                <tr>
                    <td>时间：'.date('Y-m-d',$v['addtime']).'</td>
                    <td>
                        状态：'.$status.'</td>
                </tr>
                <tr class="bottomtr"><td colspan="2" align="center"><a href="myordershow.php?id='.$v['itemid'].'" class="blue" >查看</a></td></tr>';
        }
    }
    exit(json_encode(array('info'=>$info,'totalpage'=>$totalpage)));
}else {
    if(!$_userid) dheader($CFG['url'].'mobile/member/login.php');
    list($aBuy, $totalpage) = $oBuy->buyList('*', 'userid='.$_userid, 'addtime desc', '10');
    //获取项目
    $aSell = array();
    if ($aBuy) {
        $aSellId = array();
        foreach ($aBuy as $k => $v) {
            array_push($aSellId, $v['sell_itemid']);
        }

        $aSell = $oSell->getrightlie($aSellId);
    }

    $seo_title = '我的预约-会员中心-';
    $topname = '我的预约';
    include template('myorder', 'mobile/member');
}

?>