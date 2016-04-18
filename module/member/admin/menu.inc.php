<?php
defined('DT_ADMIN') or exit('Access Denied');
$menu = array(
	array('添加会员', '?moduleid=2&action=add'),
	array('会员列表', '?moduleid=2'),
	array('模块设置', '?moduleid=2&file=setting'),
);
$menu_finance = array(
	array($DT['money_name'].'管理', '?moduleid=2&file=record'),
);
$menu_relate = array(
	array('登录日志', '?moduleid=2&file=loginlog'),
);
if(!$_founder) unset($menu_relate[7]);
?>