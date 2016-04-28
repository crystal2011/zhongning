<?php
define('DT_REWRITE', true);
require '../../common.inc.php';

$pagesize = 30;
$offset = ($page-1)*$pagesize;
require_once '../../module/group/group.class.php';
$oGroup = new group(21);
$list = $oGroup->get_list(' status = 3');

$seo_title = '常见问题-';
$topname = '常见问题';
include template('index','mobile/question');
?>