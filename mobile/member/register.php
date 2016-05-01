<?php
require '../../member/config.inc.php';
require '../../common.inc.php';
require DT_ROOT.'/module/'.$module.'/common.inc.php';
require DT_ROOT.'/include/post.func.php';
require MD_ROOT.'/member.class.php';
$do = new member;
$session = new dsession();
$forward = wapforward();
$action = isset($action)?$action:'';
if($submit) {
    if($_userid) exit(json_encode(array('status'=>'n','info'=>'您已登录')));
    if(!check_token()) exit(json_encode(array('status'=>'n','info'=>'注册失效，请重试')));

    //会员信息数组
    $post = array(
        'truename'=>isset($truename)?$truename:'',
        'email'=>isset($email)?$email:'',
        'password'=>isset($password)?$password:'',
        'cpassword'=>isset($cpassword)?$cpassword:'',
    );

    if(!$do->is_member($post)){
        exit(json_encode(array('status' => 'n', 'info' => $do->errmsg)));
    }

    //发送邮件
    $auth = make_auth($DT_TIME.$post['email']);
    $authurl = $CFG['url'].'mobile/member/register.php?action=email_register&auth='.$auth;
    $db->query("delete from {$db->pre}member_link where email = '".$post['email']."' and type = 1");
    $db->query("insert into {$db->pre}member_link (email,password,auth,authtime,truename,type) values ('".$post['email']."','".$post['password']."','".$auth."',$DT_TIME,'".$post['truename']."',1) ");
    send_mail($post['email'], $DT['sitename'].'用户注册激活信', stripslashes(ob_template('check', 'mail')));
    exit(json_encode(array('status'=>'y', 'info' =>"注册验证邮件已发送,请到邮箱认证！")));

}else if($action=='email_register'){
    if($_userid) dheader($CFG['url'].'mobile/member/login.php');  //验证是否已登录
    $auth = isset($auth)?$auth:'';
    $user = check_auth($auth,1);
    if($user['status']=='n'){
        dalert('邮件已失效',$CFG['url'].'mobile/member/register.php');
    }
    $user = $user['info'];
    $user['cpassword'] = $user['password'];
    $do->add($user);
    dalert('注册成功','login.php');
} else {
    if($_userid) dheader($CFG['url'].'mobile/member/index.php');
    $seo_title = '注册-';
    $topname = '注册';
    $backurl = '/mobile/member/login.php';
    include template('register', 'mobile/member');
}