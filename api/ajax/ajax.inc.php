<?php
defined('IN_DESTOON') or exit('Access Denied');
$at = isset($at)?$at:'';
switch($at) {
    case 'gettoken':
        //获取token
        set_token();
        break;
    case 'islogin':
        exit(json_encode(array('status' => $_userid ? 'y' : 'n')));
        break;
}