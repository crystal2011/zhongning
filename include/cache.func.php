<?php
/*
	[Destoon B2B System] Copyright (c) 2008-2015 Destoon.COM
	This is NOT a freeware, use is subject to license.txt
*/
defined('IN_DESTOON') or exit('Access Denied');
function cache_all() {
	cache_module();
	cache_area();
	cache_category();
	cache_fields();
	cache_group();
	cache_pay();
	cache_oauth();
	cache_type();
	cache_keylink();
	cache_pay();
	cache_weixin();
	return true;
}

function cache_module($moduleid = 0) {
	global $db;
	if($moduleid) {
		$r = $db->get_one("SELECT * FROM {$db->pre}module WHERE disabled=0 AND moduleid='$moduleid'");
		$setting = array();
		$setting = get_setting($moduleid);
		if(isset($setting['seo_title_index'])) $setting['title_index'] = seo_title($setting['seo_title_index']);
		if(isset($setting['seo_title_list'])) $setting['title_list'] = seo_title($setting['seo_title_list']);
		if(isset($setting['seo_title_show'])) $setting['title_show'] = seo_title($setting['seo_title_show']);
		if(isset($setting['seo_keywords_index'])) $setting['keywords_index'] = seo_title($setting['seo_keywords_index']);
		if(isset($setting['seo_keywords_list'])) $setting['keywords_list'] = seo_title($setting['seo_keywords_list']);
		if(isset($setting['seo_keywords_show'])) $setting['keywords_show'] = seo_title($setting['seo_keywords_show']);
		if(isset($setting['seo_description_index'])) $setting['description_index'] = seo_title($setting['seo_description_index']);
		if(isset($setting['seo_description_list'])) $setting['description_list'] = seo_title($setting['seo_description_list']);
		if(isset($setting['seo_description_show'])) $setting['description_show'] = seo_title($setting['seo_description_show']);
		//cache_write('setting/module-'.$moduleid.'.php', $setting);
		$setting['moduleid'] = $moduleid;
		$setting['name'] = $r['name'];
		$setting['moduledir'] = $r['moduledir'];
		$setting['module'] = $r['module'];
		$setting['ismenu'] = $r['ismenu'];
		$setting['domain'] = $r['domain'];
		$setting['linkurl'] = $r['linkurl'];
		if($moduleid == 3) {
			foreach($setting as $k=>$v) {
				if(strpos($k, '_domain') !== false) {
					$e = str_replace('_domain', '', $k);
					$key = $e.'_url';
					$setting[$key] = $v ? $v : DT_PATH.$e.'/';
				}
			}
		}
		cache_write('module-'.$moduleid.'.php', $setting);
		if(isset($setting['split'])) {			
			if($setting['split']) {
				cache_write($moduleid.'.part', $moduleid);
			} else {
				cache_delete($moduleid.'.part');
			}
		}
		return true;
	} else {
		$result = $db->query("SELECT moduleid,module,name,moduledir,domain,linkurl,style,listorder,islink,ismenu,isblank,logo FROM {$db->pre}module WHERE disabled=0 ORDER by listorder asc,moduleid desc");
		$CACHE = array();
		$modules = array();
		while($r = $db->fetch_array($result)) {
			if(!$r['islink']) {
				$linkurl = $r['domain'] ? $r['domain'] : linkurl($r['moduledir'].'/');
				if($r['moduleid'] == 1) $linkurl = DT_PATH;
				if($linkurl != $r['linkurl']) {
					$r['linkurl'] = $linkurl;
					$db->query("UPDATE {$db->pre}module SET linkurl='$linkurl' WHERE moduleid='$r[moduleid]' ");
				}
				cache_module($r['moduleid']);
			}
			$modules[$r['moduleid']] = $r;
        }
		$CACHE['module'] = $modules;
		$CACHE['dt'] = cache_read('module-1.php');
		cache_write('module.php', $CACHE);
	}
}

function cache_area() {
	global $db;
	$data = array();
    $result = $db->query("SELECT areaid,areaname,parentid,arrparentid,child,arrchildid FROM {$db->pre}area ORDER BY listorder,areaid");
    while($r = $db->fetch_array($result)) {
		$areaid = $r['areaid'];
        $data[$areaid] = $r;
    }
	cache_write('area.php', $data);
}

function cache_category($moduleid = 0, $data = array()) {
	global $db, $DT, $MODULE;
	if($moduleid) {
		if(!$data) {
			$result = $db->query("SELECT * FROM {$db->pre}category WHERE moduleid='$moduleid' ORDER BY listorder,catid");
			while($r = $db->fetch_array($result)) {
				$data[$r['catid']] = $r;
			}
		}
		$mod = cache_read('module-'.$moduleid.'.php');
		$a = array();
		$d = array('listorder', 'moduleid', 'item', 'template', 'show_template', 'seo_title', 'seo_keywords', 'seo_description', 'group_list', 'group_show', 'group_add');
		foreach($data as $r) {
			$e = $r['catid'];
			foreach($d as $_d) {
				unset($r[$_d]);
			}
			$a[$e] = $r;
		};
		cache_write('category-'.$moduleid.'.php', $a);

        $categorys = array();
        foreach($data as $id=>$cat) {
            $categorys[$id] = array('catid'=>$id, 'parentid'=>$cat['parentid'], 'catname'=>$cat['catname']);
        }
        require_once DT_ROOT.'/include/tree.class.php';
        $tree = new tree;
        $tree->tree($categorys);
        $tree->get_trees(0);
        cache_write('catelist-'.$moduleid.'.php', $tree->larr);


		if(count($data) < 100) {
			$categorys = array();
			foreach($data as $id=>$cat) {
				$categorys[$id] = array('id'=>$id, 'parentid'=>$cat['parentid'], 'name'=>$cat['catname']);
			}
			require_once DT_ROOT.'/include/tree.class.php';
			$tree = new tree;
			$tree->tree($categorys);
			$content = $tree->get_tree(0, "<option value=\\\"\$id\\\">\$spacer\$name</option>").'</select>';
			cache_write('catetree-'.$moduleid.'.php', $content);
		} else {
			cache_delete('catetree-'.$moduleid.'.php');
		}
	} else {
		foreach($MODULE as $moduleid=>$module) {
			cache_category($moduleid);
		}
	}
}

function cache_pay() {
	global $db;
	$setting = $order = $pay = array();
	$result = $db->query("SELECT * FROM {$db->pre}setting WHERE item LIKE '%pay-%'");
	while($r = $db->fetch_array($result)) {
		if(substr($r['item'], 0, 4) == 'pay-') {
			$setting[substr($r['item'], 4)][$r['item_key']] = $r['item_value'];
			if($r['item_key'] == 'order') $order[substr($r['item'], 4)] = $r['item_value'];
		}
	}
	asort($order);
	foreach($order as $k=>$v) {
		$pay[$k] = $setting[$k];
	}
	cache_write('pay.php', $pay);
}

function cache_oauth() {
	global $db;
	$setting = $order = $oauth = array();
	$result = $db->query("SELECT * FROM {$db->pre}setting WHERE item LIKE '%oauth-%'");
	while($r = $db->fetch_array($result)) {
		if(substr($r['item'], 0, 6) == 'oauth-') {
			$setting[substr($r['item'], 6)][$r['item_key']] = $r['item_value'];
			if($r['item_key'] == 'order') $order[substr($r['item'], 6)] = $r['item_value'];
		}
	}
	asort($order);
	foreach($order as $k=>$v) {
		$oauth[$k] = $setting[$k];
	}
	cache_write('oauth.php', $oauth);
}

function cache_fields($tb = '') {
	global $db, $DT;
	if($tb) {
		$data = array();
		$result = $db->query("SELECT * FROM {$db->pre}fields WHERE tb='$tb' ORDER BY listorder,itemid");
		while($r = $db->fetch_array($result)) {
			$data[$r['itemid']] = $r;
		}
		cache_write('fields-'.$tb.'.php', $data);
	} else {
		$tbs = array();
		$result = $db->query("SELECT * FROM {$db->pre}fields");
		while($r = $db->fetch_array($result)) {
			if(isset($tbs[$r['tb']])) continue;
			cache_fields($r['tb']);
			$tbs[$r['tb']] = $r['tb'];
		}
	}
}

function cache_group() {
	global $db;
	$data = $group = array();
	$result = $db->query("SELECT * FROM {$db->pre}member_group ORDER BY listorder ASC,groupid ASC");
	while($r = $db->fetch_array($result)) {
		$groupid = $r['groupid'];
		$tmp = array();
		$tmp = get_setting('group-'.$groupid);
		$r['reg'] = $tmp['reg'];
		$data[$groupid] = $r;
		if($tmp) {
			foreach($tmp as $k=>$v) {
				isset($r[$k]) or $r[$k] = $v;
			}
		}
		$r['groupid'] = $groupid;
		cache_write('group-'.$groupid.'.php', $r);
	}
	cache_write('group.php', $data);
}

function cache_type($item = '') {
	global $db;
	if($item) {
		$types = array();
		$result = $db->query("SELECT typeid,parentid,typename,style FROM {$db->pre}type WHERE item='$item' AND cache=1 ORDER BY listorder ASC,typeid DESC");
		while($r = $db->fetch_array($result)) {
			$types[$r['typeid']] = $r;
		}
		cache_write('type-'.$item.'.php', $types);
		return $types;
	} else {
		$arr = array();
		$result = $db->query("SELECT item FROM {$db->pre}type WHERE item!='' AND cache=1 ORDER BY typeid DESC");
		while($r = $db->fetch_array($result)) {
			if(!in_array($r['item'], $arr)) {
				$arr[] = $r['item'];
				cache_type($r['item']);
			}
		}
	}
}

function cache_bancomment($moduleid = 0) {
	global $db, $MODULE;
	if($moduleid) {
		$data = array();
		$result = $db->query("SELECT itemid FROM {$db->pre}comment_ban WHERE moduleid='$moduleid' ORDER BY bid DESC ");
		while($r = $db->fetch_array($result)) {
			$data[] = $r['itemid'];
		}
		cache_write('bancomment-'.$moduleid.'.php', $data);
		return $data;
	} else {
		foreach($MODULE as $k=>$v) {
			if($k < 4 || $v['islink']) continue;
			cache_bancomment($k);
		}
	}
}

function cache_keylink($item = '') {
	global $db;
	if($item) {
		$keylinks = array();
		$result = $db->query("SELECT title,url FROM {$db->pre}keylink WHERE item='$item' ORDER BY listorder DESC,itemid DESC");
		while($r = $db->fetch_array($result)) {
			$keylinks[] = $r;
		}
		cache_write('keylink-'.$item.'.php', $keylinks);
		return $keylinks;
	} else {
		$arr = array();
		$result = $db->query("SELECT item FROM {$db->pre}keylink");
		while($r = $db->fetch_array($result)) {
			if(!in_array($r['item'], $arr)) {
				$arr[] = $r['item'];
				cache_keylink($r['item']);
			}
		}
	}
}

function cache_banip() {
	global $db, $DT_TIME;
	$data = array();
	$result = $db->query("SELECT ip,totime FROM {$db->pre}banip ORDER BY itemid DESC");
	while($r = $db->fetch_array($result)) {
		if($r['totime'] && $r['totime'] < $DT_TIME) continue;
		$data[] = $r;
	}
	cache_write('banip.php', $data);
}

function cache_banword() {
	global $db;
	$data = array();
	$result = $db->query("SELECT * FROM {$db->pre}banword ORDER BY bid DESC");
	while($r = $db->fetch_array($result)) {
		$b = array();
		$b[] = $r['replacefrom'];
		$b[] = $r['replaceto'];
		$b[] = $r['deny'];
		$data[] = $b;
	}
	cache_write('banword.php', $data);
}

function cache_weixin() {

}

function cache_clear_ad($all = false) {
	global $DT_TIME;
	$globs = glob(DT_CACHE.'/htm/*.htm');
	if($globs) {
		foreach($globs as $v) {
			if(strpos(basename($v), 'ad_') === false) continue;
			if($all) {
				file_del($v);
			} else {
				$exptime = intval(substr(file_get($v), 4, 14));
				if($exptime && $DT_TIME > $exptime) file_del($v);
			}
		}
	}
}

function cache_clear_tag($all = false) {
	global $DT_TIME;
	$globs = glob(DT_CACHE.'/tag/*.htm');
	if($globs) {
		foreach($globs as $v) {
			if($all) {
				file_del($v);
			} else {
				$exptime = intval(substr(file_get($v), 4, 14));
				if($exptime && $DT_TIME > $exptime) file_del($v);
			}
		}
	}
}

function cache_clear_sql($dir, $all = false) {
	global $DT_TIME;
	if($dir) {
		$globs = glob(DT_CACHE.'/sql/'.$dir.'/*.php');
		if($globs) {
			foreach($globs as $v) {
				if($all) {
					file_del($v);
				} else {
					$exptime = intval(substr(file_get($v), 8, 18));
					if($exptime && $DT_TIME > $exptime) file_del($v);
				}
			}
		}
	} else {
		cache_clear('php', 'dir', 'sql');
	}
}

function cache_city(){
    global $db, $MODULE;
    $data = array();
    $result = $db->query("SELECT c.areaid,c.name,c.pinyin,a.areaid as parentareaid,a.areaname as parentname,a.parentid FROM {$db->pre}city c inner join {$db->pre}area a on a.areaid = c.areaid and a.parentid!=0 ORDER BY c.letter asc,c.listorder asc");
    $arr = $parentarr = array();
    while($r=$db->fetch_array($result)){
        if(!isset($parentarr[$r['parentid']])){
            $catinfo = get_area($r['parentid']);
            $parentarr[$r['parentid']] = array(
                'areaid'=>$r['parentid'],
                'areaname'=>$catinfo['areaname']
            );
        }
        $parentarr[$r['parentid']]['list'][] = array(
            'areaid'=>$r['parentareaid'],
            'areaname'=>$r['parentname'],
        );
        $cityarr[$r['areaid']] = array(
                                        'areaid'=>$r['areaid'],
                                        'name'=>$r['name'],
                                        'pinyin'=>$r['pinyin'],
                                    );
    }

    $arr = array('area'=>$parentarr,'city'=>$cityarr);
    cache_write('city.php',$arr);
}
function cache_link(){
    global $db;
    $result = $db->query("select * from {$db->pre}link limit 13");
    $str = '<section class="friendLink">';
    while($r=$db->fetch_array($result)){
        $linkurl = $r['linkurl'];
        $title = $r['title'];
        $str .= '<a href="'.$linkurl.'" target="_blank" rel="nofollow">'.$title.'</a>';
    }
    $str .= '</section>';
    file_put(DT_ROOT.'/template/default/link.htm',$str);
}
function cache_area_hot(){
    global $db;
    $result = $db->query("select * from {$db->pre}area where ishot=1 order by listorder asc");
    $arr = array();
    while($r=$db->fetch_array($result)){
        $arr[$r['areaid']] = $r['areaname'];
    }
    cache_write('hotcity.php',$arr);
}
?>