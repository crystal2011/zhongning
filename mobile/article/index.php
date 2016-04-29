<?php
/**
 * 手机端-文章列表-首页
 */
define('DT_REWRITE', true);
require '../../common.inc.php';


$pagesize = 10;
$offset = ($page-1)*$pagesize;
require_once '../../module/article/article.class.php';
$oArticle = new article(21);
$where = ' 1 = 1 ';
if($catid && $catinfo = get_cat($catid)){
    $where = " catid in (".$catinfo['arrchildid'].") ";
}
$list = $oArticle->get_list($where .' and status = 3');
$totalpage = ceil($items/$pagesize);$action=isset($action)?$action:'';

if($action=='ajax'){
    $info = '';
    if($list){
        foreach($list as $k=>$v){

            $v['thumb'] = $v['thumb'] && file_exists(str_replace($CFG['url'],DT_ROOT.'/',$v['thumb']))?$v['thumb']:DT_SKIN_TWO.'images/wycms/default.jpg';

            $info .= '<div class="content">
                        <div class="clear info">
                            <a class="thumb" href="/mobile/article/show.php?id='.$v['itemid'].'"><img src="'.$v['thumb'].'" /></a>
                            <div class="text">
                                <a class="title" href="/mobile/article/show.php?id='.$v['itemid'].'">'.$v['title'].'</a>
                                <p class="introduce">'.$v['introduce'].'</p>
                                <p class="numviesshow clear">
                                    <span class=""><i class="guanjjin">'.dsubstr($v['keyword'],12).'</i></span>
                                    <span class="fr numtimes">'.date('Y-m-d',$v['addtime']).'</span>
                                </p>
                            </div>
                        </div>';
        }
    }
    exit(json_encode(array('info'=>$info,'totalpage'=>$totalpage)));
}else{
    $seo_title = '最新资讯-';
    $topname = '最新资讯';
    $backurl = '/mobile/index.php';
    include template('article/index','mobile');
}
