<?php
/**
 * 找回密码
 */
require '../../member/config.inc.php';
require '../../common.inc.php';
require DT_ROOT.'/module/'.$module.'/common.inc.php';
require MD_ROOT.'/member.class.php';
require DT_ROOT.'/include/post.func.php';
$do = new member;
$forward = wapforward();

$action = isset($action)?$action:'';
if($submit) {
    if($_userid) exit(json_encode(array('status'=>'n','info'=>'您已登录')));
    if(!check_token()) exit(json_encode(array('status'=>'n','info'=>'登录失效，请重试')));

    $email = isset($username)?$username:'';

    //会员信息数组
    $post = array(
        'email'=>$email,
        'password'=>isset($password)?$password:'',
        'cpassword'=>isset($cpassword)?$cpassword:'',
    );

    if(!$do->findpw($post)) {
        exit(json_encode(array('status' => 'n', 'info' => $do->errmsg)));
    }

    //发送邮件
    $auth = make_auth($DT_TIME.$post['email']);
    $authurl = $CFG['url'].'mobile/member/findpw.php?action=findpw&auth='.$auth;
    $db->query("delete from {$db->pre}member_link where email = '".$post['email']."' and type = 2");
    $db->query("insert into {$db->pre}member_link (email,password,auth,authtime,type) values ('".$post['email']."','".$post['password']."','".$auth."',$DT_TIME,2) ");
    send_mail($post['email'], $DT['sitename'].'用户找回密码', stripslashes(ob_template('password', 'mail')));
    exit(json_encode(array('status'=>'y', 'info' =>"找回密码验证邮件已发送,请到邮箱认证！")));

}else if($action=='findpw'){
    if($_userid) dheader($CFG['url'].'mobile/member/login.php');  //验证是否已登录
    $auth = isset($auth)?$auth:'';
    $user = check_auth($auth,2);
    if($user['status']=='n') dalert('邮件已失效',$CFG['url'].'mobile/member/register.php');
    $user = $user['info'];
    $do->editpw($user);
    dalert('成功找回密码，请登录','login.php');
} else {
    if($_userid) dheader($CFG['url'].'mobile/member/index.php');
    $seo_title = '找回密码-';
    $topname = '找回密码';
    $nav_selected = 'findpw';
    $backurl = '/mobile/member/login.php';
    include template('findpw', 'mobile/'.$module);
}
?>