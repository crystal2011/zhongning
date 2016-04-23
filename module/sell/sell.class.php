<?php 
defined('IN_DESTOON') or exit('Access Denied');
class sell {
	var $moduleid;
	var $itemid;
	var $db;
	var $table;
	var $table_data;
	var $table_search;
	var $split;
	var $errmsg = errmsg;

    function sell($moduleid) {
		global $db, $table, $table_data, $table_search, $MOD;
		$this->moduleid = $moduleid;
		$this->table = $db->pre.'sell_5';
		$this->table_data = $db->pre.'sell_data_5';
		$this->table_search = $table_search;
		$this->split = '';
		$this->db = &$db;
		$this->fields = array('level','title','setbacks','setstatus','fee','introduce','price','status','addtime','adddate','edittime','editdate','company','month','reason','apr','bonding');

    }

	function pass($post,$isadmin=true) {
		global $DT_TIME, $MOD;
		if(!is_array($post)) return false;
        if(!is_length($post['title'],2,50)) return $this->_('融资年期输入有误');
        if(!is_length($post['company'],2,50)) return $this->_('融资企业输入有误');
        if(!is_length($post['price'],2,10)) return $this->_('融资金额输入有误');
        if(!is_length($post['month'],2,10)) return $this->_('融资期限输入有误');
        if(!is_length($post['reason'],2,50)) return $this->_('融资原因输入有误');
        if(!is_length($post['fee'],2,50)) return $this->_('投资利息输入有误');
        if(!is_length($post['bonding'],2,50)) return $this->_('担保公司输入有误');

        if(!is_length($post['setbacks'],1,10)) return $this->_('进度输入有误');
        if(!is_length($post['apr'],2,10)) return $this->_('年利率输入有误');

        return $post;
	}

	function set($post) {
		global $MOD, $DT_TIME, $DT_IP, $TYPE, $_username;
		$post['edittime'] = $DT_TIME;

        $post['content'] = stripslashes($post['content']);
        $post['content'] = save_local($post['content']);
        if(isset($post['clear_link']) && $post['clear_link']) $post['content'] = clear_link($post['content']);
        if(isset($post['save_remotepic']) && $post['save_remotepic']) $post['content'] = save_remote($post['content']);
        if(strpos($post['content'], 'pagebreak') !== false) $post['content'] = str_replace(array('<hr class="de-pagebreak" /></p>', '<p><hr class="de-pagebreak" />', '<hr class="de-pagebreak" /></div>', '<div><hr class="de-pagebreak" />'), array('</p><hr class="de-pagebreak" />', '<hr class="de-pagebreak" /><p>', '</div><hr class="de-pagebreak" />', '<hr class="de-pagebreak" /><div>'), $post['content']);
        if($post['content'] && empty($post['introduce'])) $post['introduce'] = addslashes(get_intro($post['content'], isset($post['introduce_length']) && $post['introduce_length']?$post['introduce_length']:200));

        if($this->itemid) {
			$new = $post['content'];
			$r = $this->get_one();
			$old = $r['content'];
			delete_diff($new, $old);
		} else {
            $post['status'] = isset($post['status'])?$post['status']:3;
            $post['addtime'] = $DT_TIME;
		}
		$content = $post['content'];
		unset($post['content']);
		$post = dhtmlspecialchars($post);
		$post['content'] = addslashes(dsafe($content));
		return array_map("trim", $post);
	}

	function get_one() {
		$r = $this->db->get_one("SELECT * FROM {$this->table} WHERE itemid=$this->itemid");
		if($r) {
			$content_table = content_table($this->moduleid, $this->itemid, $this->split, $this->table_data);
			$t = $this->db->get_one("SELECT content FROM {$content_table} WHERE itemid=$this->itemid");
			$r['content'] = $t ? $t['content'] : '';
			return $r;
		} else {
			return array();
		}
	}

	function get_list($condition = 'status=3', $order = 'edittime DESC', $cache = '') {
		global $MOD, $pages, $page, $pagesize, $offset, $items, $sum;
		if($page > 1 && $sum) {
			$items = $sum;
		} else {
			$r = $this->db->get_one("SELECT COUNT(*) AS num FROM {$this->table} WHERE $condition", $cache);
			$items = $r['num'];
		}
		$pages = defined('CATID') ? listpages(1, CATID, $items, $page, $pagesize, 10, $MOD['linkurl']) : pages($items, $page, $pagesize);
		if($items < 1) return array();
		$lists = $catids = $CATS = array();
		$result = $this->db->query("SELECT * FROM {$this->table} WHERE $condition ORDER BY $order LIMIT $offset,$pagesize", $cache);
		while($r = $this->db->fetch_array($result)) {
			$lists[] = $r;
		}
		return $lists;
	}

	function add($post) {
		global $MOD;
		$post = $this->set($post);
		$sqlk = $sqlv = '';
		foreach($post as $k=>$v) {
			if(in_array($k, $this->fields)) { $sqlk .= ','.$k; $sqlv .= ",'$v'"; }
		}
        $sqlk = substr($sqlk, 1);
        $sqlv = substr($sqlv, 1);
		$this->db->query("INSERT INTO {$this->table} ($sqlk) VALUES ($sqlv)");
		$this->itemid = $this->db->insert_id();
		$content_table = content_table($this->moduleid, $this->itemid, $this->split, $this->table_data);
		$this->db->query("REPLACE INTO {$content_table} (itemid,content) VALUES ('$this->itemid', '$post[content]')");
		clear_upload($post['content'], $this->itemid);
		return $this->itemid;
	}

	function edit($post) {
		$this->delete($this->itemid, false);
		$post = $this->set($post);
		$sql = '';
		foreach($post as $k=>$v) {
			if(in_array($k, $this->fields)) $sql .= ",$k='$v'";
		}
        $sql = substr($sql, 1);
	    $this->db->query("UPDATE {$this->table} SET $sql WHERE itemid=$this->itemid");
		$content_table = content_table($this->moduleid, $this->itemid, $this->split, $this->table_data);
		$this->db->query("REPLACE INTO {$content_table} (itemid,content) VALUES ('$this->itemid', '$post[content]')");
		clear_upload($post['content'], $this->itemid);
		return true;
	}

	function tohtml($itemid = 0, $catid = 0) {
		global $module, $MOD;
		if($MOD['show_html'] && $itemid) tohtml('show', $module, "itemid=$itemid");
	}

	function update($itemid) {
		global $TYPE;
		$item = $this->db->get_one("SELECT * FROM {$this->table} WHERE itemid=$itemid");
		$update = '';
		$keyword = $item['title'].','.$TYPE[$item['typeid']].','.strip_tags(cat_pos(get_cat($item['catid']), ','));
		if($keyword != $item['keyword']) {
			$keyword = str_replace("//", '', addslashes($keyword));
			$update .= ",keyword='$keyword'";
		} else {
			$keyword = str_replace("//", '', addslashes($keyword));
		}
		$item['itemid'] = $itemid;
		$linkurl = itemurl($item);
		if($linkurl != $item['linkurl']) $update .= ",linkurl='$linkurl'";
		$member = $item['username'] ? userinfo($item['username']) : array();
		if($member) $update .= update_user($member, $item);
		if($update) $this->db->query("UPDATE {$this->table} SET ".(substr($update, 1))." WHERE itemid=$itemid");
		$sorttime = $this->get_sorttime($item['edittime'], $item['vip']);
		$this->db->query("REPLACE INTO {$this->table_search} (itemid,catid,areaid,status,content,sorttime) VALUES ($itemid,'$item[catid]','$item[areaid]','$item[status]','$keyword','$sorttime')");
	}

	function recycle($itemid) {
		if(is_array($itemid)) {
			foreach($itemid as $v) { $this->recycle($v); }
		} else {
			$this->db->query("UPDATE {$this->table} SET status=0 WHERE itemid=$itemid");
			$this->delete($itemid, false);
			return true;
		}		
	}

	function restore($itemid) {
		global $module, $MOD;
		if(is_array($itemid)) {
			foreach($itemid as $v) { $this->restore($v); }
		} else {
			$this->db->query("UPDATE {$this->table} SET status=3 WHERE itemid=$itemid");
			$this->db->query("UPDATE {$this->table_search} SET status=3 WHERE itemid=$itemid");
			return true;
		}		
	}

	function delete($itemid, $all = true) {
		global $MOD;
		if(is_array($itemid)) {
			foreach($itemid as $v) {
				$this->delete($v, $all);
			}
		} else {
			$this->itemid = $itemid;
			$r = $this->get_one();
			if($all) {
				$this->db->query("DELETE FROM {$this->table} WHERE itemid=$itemid");
				$content_table = content_table($this->moduleid, $this->itemid, $this->split, $this->table_data);
				$this->db->query("DELETE FROM {$content_table} WHERE itemid=$itemid");
				if($MOD['cat_property']) $this->db->query("DELETE FROM {$this->db->pre}category_value WHERE moduleid=$this->moduleid AND itemid=$itemid");
			}
		}
	}

	function check($itemid) {
		global $_username, $DT_TIME, $MOD;
		if(is_array($itemid)) {
			foreach($itemid as $v) { $this->check($v); }
		} else {
			$this->itemid = $itemid;
			$item = $this->get_one();
			$editdate = timetodate($DT_TIME, 3);
			$this->db->query("UPDATE {$this->table} SET status=3,hits=hits+1,editor='$_username',edittime=$DT_TIME,editdate='$editdate' WHERE itemid=$itemid");
			$sorttime = $this->get_sorttime($DT_TIME, $item['vip']);
			$this->db->query("UPDATE {$this->table_search} SET status=3,sorttime='$sorttime' WHERE itemid=$itemid");
			return true;
		}
	}

	function reject($itemid) {
		global $_username, $DT_TIME;
		if(is_array($itemid)) {
			foreach($itemid as $v) { $this->reject($v); }
		} else {
			$this->db->query("UPDATE {$this->table} SET status=1,editor='$_username' WHERE itemid=$itemid");
			$this->db->query("UPDATE {$this->table_search} SET status=1 WHERE itemid=$itemid");
			return true;
		}
	}

	function expire($condition = '') {
		global $DT_TIME;
		$result = $this->db->query("SELECT itemid FROM {$this->table} WHERE status=3 AND totime>0 AND totime<$DT_TIME $condition");
		while($r = $this->db->fetch_array($result)) {
			$itemid = $r['itemid'];
			$this->db->query("UPDATE {$this->table} SET status=4 WHERE itemid=$itemid");
			$this->db->query("UPDATE {$this->table_search} SET status=4 WHERE itemid=$itemid");
		}		
	}

	function clear($condition = 'status=0') {		
		$result = $this->db->query("SELECT itemid FROM {$this->table} WHERE $condition");
		while($r = $this->db->fetch_array($result)) {
			$this->delete($r['itemid']);
		}
	}

	function level($itemid, $level) {
		$itemids = is_array($itemid) ? implode(',', $itemid) : $itemid;
		$this->db->query("UPDATE {$this->table} SET level=$level WHERE itemid IN ($itemids)");
	}

	function type($itemid, $typeid) {
		$itemids = is_array($itemid) ? implode(',', $itemid) : $itemid;
		$this->db->query("UPDATE {$this->table} SET typeid=$typeid WHERE itemid IN ($itemids)");
	}

	function refresh($itemid) {
		global $DT_TIME;
		$editdate = timetodate($DT_TIME, 3);
		if(is_array($itemid)) {
			foreach($itemid as $v) { $this->refresh($v); }
		} else {			
			$this->db->query("UPDATE {$this->table} SET edittime='$DT_TIME',editdate='$editdate' WHERE itemid=$itemid");	
			$this->itemid = $itemid;
			$item = $this->db->get_one("SELECT vip FROM {$this->table} WHERE itemid=$itemid");
			$sorttime = $this->get_sorttime($DT_TIME, $item['vip']);
			$this->db->query("UPDATE {$this->table_search} SET sorttime='$sorttime' WHERE itemid=$itemid");
		}
	}

	function get_sorttime($edittime, $vip) {
		$sorttime = timetodate($edittime, 'Y-m-d').' '.sprintf('%02d', $vip).':'.timetodate($edittime, 'H:i');
		return strtotime($sorttime);
	}

	function _($e) {
		$this->errmsg = $e;
		return false;
	}

    function sellList($field='*',$condition='1=1',$order='hits desc',$limit=10){
        global $page;
        $offset = ($page-1)*$limit;
        $result = $this->db->query("select {$field} from {$this->table} where $condition  order by $order limit $offset,$limit");
        $list = array();
        while($r = $this->db->fetch_array($result)){
            $list[] = $r;
        }
        $count = $this->db->get_one("select count(*) as num from {$this->table} where $condition");
        $totalpage = ceil($count['num']/$limit);
        return array($list,$totalpage);
    }

    function sellLists($field='*',$condition='1=1',$order='hits desc',$limit=10){
        global $page;
        $result = $this->db->query("select {$field} from {$this->table} where $condition  order by $order limit $limit");
        $list = array();
        while($r = $this->db->fetch_array($result)){
            $list[] = $r;
        }
        return $list;
    }
    function checkSell($aSell){
        if(!$aSell){
            return $this->_('投资项目不存在');
        }
        if($aSell['status']!=3){
            return $this->_('投资项目已下架');
        }
        if($aSell['setstatus']==1){
            return $this->_('投资项目已满标');
        }
        return true;
    }
    function editHits(){
        $this->db->query("update {$this->table} set hits = hits + 1 where itemid = $this->itemid");
    }

    function getrightlie($idstr){
        $idstr = implode(',',array_unique($idstr));
        $list = array();
        $result = $this->db->query("select * from {$this->table} where itemid in ($idstr) ");
        while($r=$this->db->fetch_array($result)){
            $list[$r['itemid']] = $r;
        }
        return $list;
    }

    function getright($field='*',$limit,$order=''){
        $where = ' status=3 ';
        $list = array();
        $result = $this->db->query("select {$field} from {$this->table} where {$where} order by {$order} limit $limit");
        while($r=$this->db->fetch_array($result)){
            $list[] = $r;
        }
        return $list;
    }

    function getLevelSell($field='*',$limit,$catid=0,$level=0){
        global $dtcity;
        $where = ' 1=1 ';
        if($catid){
            $info = get_cat($catid);
            $arrchildid = $info['arrchildid'];
            $where .= " and catid in ($arrchildid)";
        }
        if($dtcity){
            $info = get_area($dtcity['areaid']);
            $arrchildid = $info['arrchildid'];
            $where .= " and areaid in ($arrchildid)";
        }
        $aHotSell= array();
        $result = $this->db->query("select {$field} from {$this->table} where {$where} and level={$level} and status = 3 order by itemid desc limit $limit");
        while($r=$this->db->fetch_array($result)){
            $aHotSell[] = $r;
        }
        return $aHotSell;
    }

    function addLike(){
        $this->db->query("update {$this->table} set likes=likes+1 where itemid = ".$this->itemid);
        return true;
    }

    function adddelComments($addordel){
        if($addordel=='add'){
            $this->db->query("update {$this->table} set comments=comments+1 where itemid = ".$this->itemid);
        }else{
            $this->db->query("update {$this->table} set comments=comments-1 where itemid = ".$this->itemid);
        }
        return true;
    }

}
?>