<?php
defined('IN_DESTOON') or exit('Access Denied');

if(!$_userid || $action == 'logout') dheader('/member/login.php');
require DT_ROOT.'/module/'.$module.'/common.inc.php';
require MD_ROOT.'/member.class.php';
require DT_ROOT.'/include/post.func.php';
$do = new member;
$do->userid = $_userid;
$info = $do->get_one();
$seo_title = '个人资料-会员中心-';
$two_nav_selected = 'index';

include template('index', $module);
?>