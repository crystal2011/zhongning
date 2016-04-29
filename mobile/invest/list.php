<?php
/**
 * 投资申请
 *
 */
define('DT_REWRITE', true);
require '../../common.inc.php';

require_once DT_ROOT . '/module/sell/sell.class.php';
$oSell = new sell(5);
list($aSell, $totalpage) = $oSell->sellList('*', ' status=3 ', 'addtime desc', '10');

if($action=='ajax'){
    $info = '';
    if($aSell){
        foreach($aSell as $k=>$v){
            $info .= '<tr class="daibg'.($k%2).'">
                    <td><img src="'.DT_SKIN_TWO.'images/wycms/mobile/dai.png" class="daiicon" />'.mb_substr($v['title'],0,6,'utf-8').(mb_strlen($v['title'])>6?'...':'').'</td>
                    <td align="center">'.$v['setbacks'].'</td>
                    <td align="center"><img src="'.DT_SKIN_TWO.'images/wycms/mobile/tou'.$v['setstatus'].'.jpg"  '.($v['setstatus']==0?'onclick="location.href=\'/mobile/invest/show.php?id='.$v['itemid'].'\'"':'').' width="60px" /></td>
                    </tr>';
        }
    }
    exit(json_encode(array('info'=>$info,'totalpage'=>$totalpage)));
}else {
    $seo_title = '投资理财-';
    $topname = '投资理财';
    $backurl = '/mobile/index.php';
    include template('list','mobile/invest');

}


?>