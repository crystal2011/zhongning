<?php
defined('DT_ADMIN') or exit('Access Denied');
$menu = array(
	array("添加招聘", "?moduleid=$moduleid&action=add"),
	array("招聘列表", "?moduleid=$moduleid"),
	array("审核招聘", "?moduleid=$moduleid&action=check"),
    array("添加求职", "?moduleid=$moduleid&file=resume&action=add"),
    array("求职列表", "?moduleid=$moduleid&file=resume"),
    array("分类管理", "?file=category&mid=$moduleid"),
	array("更新数据", "?moduleid=$moduleid&file=html"),
	array("模块设置", "?moduleid=$moduleid&file=setting"),
);
?>