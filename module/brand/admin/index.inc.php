<?php
defined('DT_ADMIN') or exit('Access Denied');
require MD_ROOT.'/brand.class.php';
$do = new brand($moduleid);
$menus = array (
    array('添加'.$MOD['name'], '?moduleid='.$moduleid.'&action=add'),
    array($MOD['name'].'列表', '?moduleid='.$moduleid),
    array('审核'.$MOD['name'], '?moduleid='.$moduleid.'&action=check'),
    array('未通过'.$MOD['name'], '?moduleid='.$moduleid.'&action=reject'),
    array('回收站', '?moduleid='.$moduleid.'&action=recycle'),
);

if(in_array($action, array('', 'check', 'expire', 'reject', 'recycle'))) {
	$sfields = array('模糊', '标题');
	$dfields = array('keyword', 'title');
	$sorder  = array('结果排序方式', '更新时间降序', '更新时间升序', '添加时间降序', '添加时间升序', '浏览次数降序', '浏览次数升序', 'ID降序', 'ID升序');
	$dorder  = array($MOD['order'], 'edittime DESC', 'edittime ASC', 'addtime DESC', 'addtime ASC', 'hits DESC', 'hits ASC', 'itemid DESC', 'itemid ASC');
	$level = isset($level) ? intval($level) : 0;
	isset($fields) && isset($dfields[$fields]) or $fields = 0;
	isset($order) && isset($dorder[$order]) or $order = 0;
	
	isset($datetype) && in_array($datetype, array('edittime', 'addtime', 'totime')) or $datetype = 'edittime';
	$fromdate = isset($fromdate) && is_date($fromdate) ? $fromdate : '';
	$fromtime = $fromdate ? strtotime($fromdate.' 0:0:0') : 0;
	$todate = isset($todate) && is_date($todate) ? $todate : '';
	$totime = $todate ? strtotime($todate.' 23:59:59') : 0;

	$areaid = isset($areaid) ? intval($areaid) : 0;
	$thumb = isset($thumb) ? intval($thumb) : 0;
	$guest = isset($guest) ? intval($guest) : 0;
	$itemid or $itemid = '';
	$minvip = isset($minvip) ? intval($minvip) : '';
	$minvip or $minvip = '';
	$maxvip = isset($maxvip) ? intval($maxvip) : '';
	$maxvip or $maxvip = '';

	$fields_select = dselect($sfields, 'fields', '', $fields);
	$level_select = level_select('level', '级别', $level, 'all');
	$order_select  = dselect($sorder, 'order', '', $order);

	$condition = '';
	if($_childs) $condition .= " AND catid IN (".$_childs.")";//CATE
	if($_areaids) $condition .= " AND areaid IN (".$_areaids.")";//CITY
	if($keyword) $condition .= " AND $dfields[$fields] LIKE '%$keyword%'";
	if($catid) $condition .= ($CAT['child']) ? " AND catid IN (".$CAT['arrchildid'].")" : " AND catid=$catid";
	if($areaid) $condition .= ($AREA[$areaid]['child']) ? " AND areaid IN (".$AREA[$areaid]['arrchildid'].")" : " AND areaid=$areaid";
	if($level) $condition .= $level > 9 ? " AND level>0" : " AND level=$level";
	if($fromtime) $condition .= " AND `$datetype`>=$fromtime";
	if($totime) $condition .= " AND `$datetype`<=$totime";
	if($thumb) $condition .= " AND thumb<>''";
	if($guest) $condition .= " AND username=''";
	if($minvip)  $condition .= " AND vip>=$minvip";
	if($maxvip)  $condition .= " AND vip<=$maxvip";
	if($itemid) $condition .= " AND itemid=$itemid";

	$timetype = strpos($dorder[$order], 'add') !== false ? 'add' : '';
}
switch($action) {
	case 'add':
		if($submit) {
			if($post = $do->pass($post)) {
				$do->add($post);
				dmsg('添加成功', '?moduleid='.$moduleid.'&action='.$action.'&catid='.$post['catid']);
			} else {
				msg($do->errmsg);
			}
		} else {
			foreach($do->fields as $v) {
				isset($$v) or $$v = '';
			}
			$content = '';
			$status = 3;
			$addtime = timetodate($DT_TIME);
			$totime = '';
			$username = '';
			$item = array();
			$menuid = 0;
			isset($url) or $url = '';
			if($url) {
				$tmp = fetch_url($url);
				if($tmp) extract($tmp);
			}
			include tpl('edit', $module);
		}
	break;
	case 'edit':
		$itemid or msg();
		$do->itemid = $itemid;
		if($submit) {
			if($post = $do->pass($post)) {
				$do->edit($post);
				dmsg('修改成功', $forward);
			} else {
				msg($do->errmsg);
			}
		} else {
			$item = $do->get_one();
			extract($item);
			$addtime = timetodate($addtime);
			$totime = $totime ? timetodate($totime, 3) : '';
            $fromtime = $fromtime ? timetodate($fromtime, 3) : '';
			$menuon = array('4', '3', '2', '1');
			$menuid = $menuon[$status];
			include tpl($action, $module);
		}
	break;
	case 'move':
		if($submit) {
			$fromids or msg('请填写来源ID');
			if($tocatid) {
				$db->query("UPDATE {$table} SET catid=$tocatid WHERE `{$fromtype}` IN ($fromids)");
				dmsg('移动成功', $forward);
			} else {
				msg('请选择目标分类');
			}
		} else {
			$itemid = $itemid ? implode(',', $itemid) : '';
			$menuid = 5;
			include tpl($action);
		}
	break;
	case 'update':
		is_array($itemid) or msg('请选择'.$MOD['name']);
		foreach($itemid as $v) {
			$do->update($v);
		}
		dmsg('更新成功', $forward);
	break;
	case 'tohtml':
		is_array($itemid) or msg('请选择'.$MOD['name']);
		foreach($itemid as $itemid) {
			tohtml('show', $module);
		}
		dmsg('生成成功', $forward);
	break;
	case 'delete':
		$itemid or msg('请选择'.$MOD['name']);
		isset($recycle) ? $do->recycle($itemid) : $do->delete($itemid);
		dmsg('删除成功', $forward);
	break;
	case 'restore':
		$itemid or msg('请选择'.$MOD['name']);
		$do->restore($itemid);
		dmsg('还原成功', $forward);
	break;
	case 'refresh':
		$itemid or msg('请选择'.$MOD['name']);
		$do->refresh($itemid);
		dmsg('刷新成功', $forward);
	break;
	case 'clear':
		$do->clear();
		dmsg('清空成功', $forward);
	break;
	case 'level':
		$itemid or msg('请选择'.$MOD['name']);
		$level = intval($level);
		$do->level($itemid, $level);
		dmsg('级别设置成功', $forward);
	break;
	case 'recycle':
		$lists = $do->get_list('status=0'.$condition, $dorder[$order]);
		$menuid = 4;
        require_once DT_ROOT.'/module/member/member.class.php';
        $member_do = new member;
        $getListUser = $member_do->getListUser($lists,'username');
		include tpl('index', $module);
	break;
	case 'reject':
		if($itemid && !$psize) {
			$do->reject($itemid);
			dmsg('拒绝成功', $forward);
		} else {
			$lists = $do->get_list('status=1'.$condition, $dorder[$order]);
			$menuid = 3;
            require_once DT_ROOT.'/module/member/member.class.php';
            $member_do = new member;
            $getListUser = $member_do->getListUser($lists,'username');
			include tpl('index', $module);
		}
	break;
	case 'check':
		if($itemid && !$psize) {
			$do->check($itemid);
			dmsg('审核成功', $forward);
		} else {
			$lists = $do->get_list('status=2'.$condition, $dorder[$order]);
			$menuid = 2;
            require_once DT_ROOT.'/module/member/member.class.php';
            $member_do = new member;
            $getListUser = $member_do->getListUser($lists,'username');
			include tpl('index', $module);
		}
	break;
	default:
		$lists = $do->get_list('status=3'.$condition, $dorder[$order]);
		$menuid = 1;
        require_once DT_ROOT.'/module/member/member.class.php';
        $member_do = new member;
        $getListUser = $member_do->getListUser($lists,'username');
		include tpl('index', $module);
	break;
}
?>