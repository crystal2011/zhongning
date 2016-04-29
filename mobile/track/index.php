<?php
define('DT_REWRITE', true);
require '../../common.inc.php';

require_once '../../module/exhibit/exhibit.class.php';
$oBrand = new exhibit(8);
list($aBrand,$totalpage) = $oBrand->brandList('title,itemid,introduce,addtime','status = 3','addtime desc',20);

if($action=='ajax'){
    $info = '';
    if($aBrand){
        foreach($aBrand as $k=>$v){
            $info .= '<div class="content">
                        <div class="clear info">
                            <div class="text"  style="padding:0px;">
                                <a class="title" href="/mobile/track/show.php?id='.$v['itemid'].'">'.$v['title'].'</a>
                                <p class="introduce">'.$v['introduce'].'</p>
                                <p class="numviesshow clear">
                                    <span class="fr numtimes">'.date('Y-m-d',$v['addtime']).'</span>
                                </p>
                            </div>
                        </div>';
        }
    }
    exit(json_encode(array('info'=>$info,'totalpage'=>$totalpage)));
}else {
    $seo_title = '业绩公示-关于我们-';
    $topname = '关于我们';
    $backurl = '/mobile/index.php';
    include template('index', 'mobile/track');
}
?>