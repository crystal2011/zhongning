<?php 
defined('IN_DESTOON') or exit('Access Denied');
class buy {
	var $moduleid;
	var $itemid;
	var $db;
	var $table;
	var $table_data;
	var $split;
	var $fields;
	var $errmsg = errmsg;

    function buy($moduleid=6) {
		global $db, $table, $table_data, $MOD;
		$this->moduleid = $moduleid;
        $this->table = $db->pre.'buy_6';
        $this->table_data = $db->pre.'buy_data_6';
		$this->split = '';
		$this->db = &$db;
		$this->fields = array('userid','level','title','introduce','price','status','hits','addtime','adddate','edittime','editdate','mobile','sell_itemid','month','bonding');
    }

    function pass($post,$isadmin=true) {
        global $DT_TIME, $MOD;
        if(!is_array($post)) return false;
        if($isadmin) {
            require_once DT_ROOT . '/module/member/member.class.php';
            $member_do = new member;
            if (!$aUser = $member_do->isCompany($post['username'])) return $this->_($member_do->errmsg);
            else $post['userid'] = $aUser['userid'];
        }

        if(!is_length($post['title'],2,5)) return $this->_('真实姓名输入有误');
        if(!is_mobile($post['mobile'])) return $this->_('联系手机输入有误');
        $post['sell_itemid'] = intval($post['sell_itemid']);

        if(!$this->itemid){
            //添加时 检测投资项目是否可投资
            require_once DT_ROOT . '/module/sell/sell.class.php';
            $oSell = new sell(5);
            $oSell->itemid = $post['sell_itemid'];
            $aSell = $oSell->get_one();
            if(!$oSell->checkSell($aSell)) return $this->_($oSell->errmsg);
        }else{ //编辑时  项目id改变检测
            $info = $this->get_one();
            if($info['sell_itemid'] != $post['sell_itemid']){
                require_once DT_ROOT . '/module/sell/sell.class.php';
                $oSell = new sell(5);
                $oSell->itemid = $post['sell_itemid'];
                $aSell = $oSell->get_one();
                if(!$oSell->checkSell($aSell)) return $this->_($oSell->errmsg);
            }
        }
        if(!preg_match('/[1-9][0-9]{0,8}/',$post['price']) || $post['price']>100000000 || $post['price']<30000) return $this->_('投资金额输入有误');
        if(!is_length($post['month'],2,10)) return $this->_('投资期限输入有误');
        if($post['bonding'] != 0 && $post['bonding'] != 1) return $this->_('是否有担保选择有误');
        return $post;
    }

	function set($post) {
		global $MOD, $DT_TIME, $DT_IP, $TYPE, $_username, $_userid;
		$post['edittime'] = $DT_TIME;
        if($this->itemid) {
			$new = $post['content'];
			if($post['thumb']) $new .= '<img src="'.$post['thumb'].'"/>';
			$r = $this->get_one();
			$old = $r['content'];
			if($r['thumb']) $old .= '<img src="'.$r['thumb'].'"/>';
			delete_diff($new, $old);
		} else {
            $post['addtime'] = $DT_TIME;
            $post['status'] = isset($post['status'])?$post['status']:3;
		}
		return array_map("trim", $post);
	}

    function logList($field='*',$condition='1=1',$order='itemid desc',$limit=10){
        global $page;
        $offset = ($page-1)*$limit;
        $result = $this->db->query("select {$field} from {$this->db->pre}buy_log where $condition order by $order limit $offset,$limit");
        $list = array();
        while($r = $this->db->fetch_array($result)){
            $list[] = $r;
        }
        $count = $this->db->get_one("select count(*) as num from {$this->db->pre}buy_log where $condition");
        $totalpage = ceil($count['num']/$limit);
        return array($list,$totalpage);
    }

	function get_one() {
		$r = $this->db->get_one("SELECT * FROM {$this->table} WHERE itemid=$this->itemid");
        return $r;
	}

    function get_log_list($condition = '1=1', $order = 'edittime DESC', $cache = '') {
        global $MOD, $pages, $page, $pagesize, $offset, $items, $sum;
        if($page > 1 && $sum) {
            $items = $sum;
        } else {
            $r = $this->db->get_one("SELECT COUNT(*) AS num FROM {$this->db->pre}buy_log WHERE $condition", $cache);
            $items = $r['num'];
        }

        $pages = defined('CATID') ? listpages(1, CATID, $items, $page, $pagesize, 10, $MOD['linkurl']) : pages($items, $page, $pagesize);
        if($items < 1) return array();
        $lists = $catids = $CATS = array();
        $result = $this->db->query("SELECT * FROM {$this->db->pre}buy_log WHERE $condition ORDER BY $order LIMIT $offset,$pagesize", $cache);
        while($r = $this->db->fetch_array($result)) {
            $lists[] = $r;
        }
        return $lists;
    }

    function addInvestNums($invest_money){
        $this->db->query("update {$this->db->pre}nums set invest_nums = invest_nums + 1,invest_money = invest_money + $invest_money");


    }

    function delInvestNums($invest_money){
        $this->db->query("update {$this->db->pre}nums set invest_nums = invest_nums - 1,invest_money = invest_money - $invest_money");
    }

	function get_list($condition = 'status=3', $order = 'addtime DESC', $cache = '') {
		global $MOD, $pages, $page, $pagesize, $offset, $items, $sum,$mygetcount;
		if($page > 1 && $sum) {
			$items = $sum;
		} else if($mygetcount!==false){
			$r = $this->db->get_one("SELECT COUNT(*) AS num FROM {$this->table} WHERE $condition", $cache);
			$items = $r['num'];
		}
		$pages = defined('CATID') ? listpages(1, CATID, $items, $page, $pagesize, 10, $MOD['linkurl']) : pages($items, $page, $pagesize);
		if($items < 1 && $mygetcount!==false) return array();
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
        if($post['status']==3){
            $this->addInvestNums($post['price']);
        }
		return $this->itemid;
	}

	function edit($post) {
		$this->delete($this->itemid, false);
		$post = $this->set($post);
		$sql = '';
		foreach($post as $k=>$v) {
			if(in_array($k, $this->fields)) $sql .= ",$k='$v'";
		}
        $info = $this->get_one();
        $sql = substr($sql, 1);
	    $this->db->query("UPDATE {$this->table} SET $sql WHERE itemid=$this->itemid");

        if($info['status'] == 3 && $post['status']!=3){
            $this->delInvestNums($post['price']);
        }else if($info['status'] != 3 && $post['status']==3){
            $this->addInvestNums($post['price']);
        }

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
		$keyword = $item['title'].','.($item['tag'] ? $item['tag'].',' : '').$TYPE[$item['typeid']].','.strip_tags(cat_pos(get_cat($item['catid']), ','));
		if($keyword != $item['keyword']) {
			$keyword = str_replace("//", '', addslashes($keyword));
			$update .= ",keyword='$keyword'";
		}
		$item['itemid'] = $itemid;
		$linkurl = itemurl($item);
		if($linkurl != $item['linkurl']) $update .= ",linkurl='$linkurl'";
		$member = $item['username'] ? userinfo($item['username']) : array();
		if($member) $update .= update_user($member, $item);
		if($update) $this->db->query("UPDATE {$this->table} SET ".(substr($update, 1))." WHERE itemid=$itemid");
	}

	function recycle($itemid) {
		if(is_array($itemid)) {
			foreach($itemid as $v) { $this->recycle($v); }
		} else {
            $this->itemid = $itemid;
            $info = $this->get_one();
            if($info['status']==3){
                $this->delInvestNums($info['price']);
            }
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
            $this->itemid = $itemid;
            $info = $this->get_one();
            $this->addInvestNums($info['price']);
			$this->db->query("UPDATE {$this->table} SET status=3 WHERE itemid=$itemid");
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
            if($r['status']==3){
                $this->delInvestNums($r['price']);
            }
			if($all) {
				$userid = get_user($r['username']);
				if($r['thumb']) delete_upload($r['thumb'], $userid);
				if($r['content']) delete_local($r['content'], $userid);
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
            $this->addInvestNums($item['price']);
			$this->db->query("UPDATE {$this->table} SET status=3,hits=hits+1,edittime=$DT_TIME,editdate='$editdate' WHERE itemid=$itemid");
			return true;
		}
	}

	function reject($itemid) {
		global $_username, $DT_TIME;
		if(is_array($itemid)) {
			foreach($itemid as $v) { $this->reject($v); }
		} else {
            $this->itemid = $itemid;
            $info = $this->get_one();
            if($info['status']==3){
                $this->delInvestNums($info['price']);
            }
			$this->db->query("UPDATE {$this->table} SET status=1 WHERE itemid=$itemid");
			return true;
		}
	}

	function expire($condition = '') {
		global $DT_TIME;
		$this->db->query("UPDATE {$this->table} SET status=4 WHERE status=3 AND totime>0 AND totime<$DT_TIME $condition");
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
		$itemids = is_array($itemid) ? implode(',', $itemid) : $itemid;
		$this->db->query("UPDATE {$this->table} SET edittime='$DT_TIME',editdate='$editdate' WHERE itemid IN ($itemids)");
	}

	function _update($username) {
		global $DT_TIME;
		$this->db->query("UPDATE {$this->table} SET status=4 WHERE status=3 AND totime>0 AND totime<$DT_TIME AND username='$username'");
	}

	function _($e) {
		$this->errmsg = $e;
		return false;
	}
    function buyList($field='*',$condition='1=1',$order='addtime desc',$limit=10){
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
    function checkBuy($aBuy){
        if(!$aBuy){
            return $this->_('美食分享不存在');
        }
        if($aBuy['status']!=3){
            return $this->_('美食分享已下架');
        }
        return true;
    }
    function editHits(){
        $this->db->query("update {$this->table} set hits = hits + 1 where itemid = $this->itemid");
    }

    function getright($field='*',$limit,$order=''){
        global $dtcity;
        $where = ' status=3 ';
        if($dtcity){
            $info = get_area($dtcity['areaid']);
            $arrchildid = $info['arrchildid'];
            $where .= " and areaid in ($arrchildid)";
        }
        $list = array();
        $result = $this->db->query("select {$field} from {$this->table} where {$where} order by {$order} limit $limit");
        while($r=$this->db->fetch_array($result)){
            $list[] = $r;
        }
        return $list;
    }

    function getLevelBuy($field='*',$limit,$catid=0,$level=0){
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
        $aHotBuy= array();
        $result = $this->db->query("select {$field} from {$this->table} where {$where} and level={$level} and status = 3 order by itemid desc limit $limit");
        while($r=$this->db->fetch_array($result)){
            $aHotBuy[] = $r;
        }
        return $aHotBuy;
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