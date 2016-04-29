<?php
define('DT_REWRITE', true);
require '../../common.inc.php';

require_once '../../module/info/info.class.php';
$oInfo = new info(24);
$oInfo->table = $db->pre.'info_24';
list($aInfo,$totalpage) = $oInfo->foodList('*',' status = 3','itemid desc',10);
if($action=='ajax'){
    $info = '';
    if($aInfo){
        foreach($aInfo as $k=>$v){
            $info .= '<div class="content">
                        <div class="clear info">
                            <a class="thumb" href="/mobile/abouts/show.php?id='.$v['itemid'].'"><img src="'.$v['thumb'].'" /></a>
                            <div class="text">
                                <a class="title" href="/mobile/abouts/show.php?id='.$v['itemid'].'">'.$v['title'].'</a>
                                <p class="introduce">'.$v['introduce'].'</p>
                                <p class="numviesshow clear"><span class="fr numtimes">'.date('Y-m-d',$v['addtime']).'</span></p>
                            </div>
                        </div>';
        }
    }
    exit(json_encode(array('info'=>$info,'totalpage'=>$totalpage)));
}else{
    $two_nav_selected = 'news';
    $topname = '公司动态';
    $seo_title = '公司动态-';
    $backurl = '/mobile/abouts/compintro.php';
    include template('news','mobile/abouts');
}


?>