<?php
/**
 * 会员中心
 */
require '../../member/config.inc.php';
require '../../common.inc.php';
if(!$_userid || $action == 'logout') dheader('/mobile/member/login.php');
require DT_ROOT.'/include/post.func.php';

require DT_ROOT.'/module/member/member.class.php';
$do = new member;
$do->userid = $_userid;
$member_info = $do->get_one();

$action = isset($action)?$action:'';
$backurl = '/mobile/member/info.php';
switch($action){
    case 'username_edit':
        $seo_title = '修改用户名-';
        $topname = '修改用户名';
        include template('username_edit', 'mobile/member');
        break;
    case 'idcard_edit':
        $seo_title = '修改身份证号-';
        $topname = '修改身份证号';
        if($member_info['idcard']){
            dalert('不能再次修改身份证号','info.php');
        }
        include template('idcard_edit', 'mobile/member');
        break;
    case 'gender_edit':
        $seo_title = '修改性别-';
        $topname = '修改性别';
        if($member_info['idcard']){
            dalert('不能再次修改性别','info.php');
        }
        include template('gender_edit', 'mobile/member');
        break;
    case 'mobile_edit':
        $seo_title = '修改联系电话-';
        $topname = '修改联系电话';
        include template('mobile_edit', 'mobile/member');
        break;
    case 'email_edit':
        $seo_title = '修改联系邮箱-';
        $topname = '修改联系邮箱';
        include template('email_edit', 'mobile/member');
        break;
    case 'area_edit':
        $seo_title = '修改通讯地址-';
        $topname = '修改通讯地址';
        include template('area_edit', 'mobile/member');
        break;
    case 'info_edit':
        $seo_title = '修改个人简介-';
        $topname = '修改个人简介';
        include template('info_edit', 'mobile/member');
        break;
    case 'change_mobile':
        $seo_title = '更换手机-';
        $topname = '更换手机';
        include template('change_mobile', 'mobile/member');
        break;
    default:
        $seo_title = '个人信息-';
        $topname = '个人信息';
        $backurl = '/mobile/member/index.php';
        include template('info', 'mobile/member');
        break;
}


?>