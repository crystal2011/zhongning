<?php
defined('DT_ADMIN') or exit('Access Denied');
include tpl('header');
show_menu($menus);
?>
<form method="post" action="?" id="dform">
<input type="hidden" name="moduleid" value="<?php echo $moduleid;?>"/>
<input type="hidden" name="file" value="<?php echo $file;?>"/>
<input type="hidden" name="action" value="<?php echo $action;?>"/>
<input type="hidden" name="itemid" value="<?php echo $itemid;?>"/>
<input type="hidden" name="forward" value="<?php echo $forward;?>"/>
<div class="tt"><?php echo $action == 'add' ? '添加' : '修改';?><?php echo $MOD['name'];?></div>
<table cellpadding="2" cellspacing="1" class="tb">
    <tr>
        <td class="tl"><span class="f_red">*</span> 会员名</td>
        <td><input name="post[username]" type="text" datatype="*2-20" size="20" value="<?php echo $username;?>" id="username"/> <a href="javascript:_user(Dd('username').value);" class="t">[资料]</a> <span id="dusername" class="f_red"></span></td>
    </tr>
    <tr>
    <td class="tl"><span class="f_red">*</span> 真实姓名</td>
    <td><input name="post[title]" type="text" id="title" datatype="*2-5" maxlength="5" size="60" value="<?php echo $title;?>"/> <?php echo level_select('post[level]', '级别', $level, 'id="level"');?> <span id="dtitle" class="f_red"></span></td>
    </tr>
    <tr>
        <td class="tl"><span class="f_red">*</span> 联系手机</td>
        <td><input name="post[mobile]" type="text" id="mobile" datatype="m" size="60" value="<?php echo $mobile;?>"/></td>
    </tr>
    <tr>
        <td class="tl"><span class="f_red">*</span> 投资项目id</td>
        <td><input name="post[sell_itemid]" type="text" id="sell_itemid" datatype="n" size="20" value="<?php echo $sell_itemid?$sell_itemid:'';?>"/></td>
    </tr>
    <tr>
        <td class="tl"><span class="f_red">*</span> 投资金额</td>
        <td><input name="post[price]" type="text" id="price" datatype="*2-10" maxlength="10" size="60" value="<?php echo $price;?>"/></td>
    </tr>
    <tr>
        <td class="tl"><span class="f_red">*</span> 投资期限</td>
        <td><input name="post[month]" type="text" id="month" datatype="*2-10" maxlength="10" size="60" value="<?php echo $month;?>"/></td>
    </tr>
    <tr>
        <td class="tl"><span class="f_red">*</span> 是否有担保</td>
        <td><input name="post[bonding]" type="radio" value="1" checked />有 <input name="post[bonding]" type="radio"  value="0" <?php echo empty($bonding)?'checked':''; ?> />否</td>
    </tr>



<tr>
<td class="tl"><span class="f_hid">*</span> 信息状态</td>
<td>
<input type="radio" name="post[status]" value="3" <?php if($status == 3) echo 'checked';?>/> 通过
<input type="radio" name="post[status]" value="2" <?php if($status == 2) echo 'checked';?>/> 待审
<input type="radio" name="post[status]" value="1" <?php if($status == 1) echo 'checked';?> onclick="if(this.checked) Dd('note').style.display='';"/> 拒绝
<input type="radio" name="post[status]" value="0" <?php if($status == 0) echo 'checked';?>/> 删除
</td>
</tr>
</table>
<div class="sbt"><input type="submit" name="submit" value=" 确 定 " class="btn"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value=" 重 置 " class="btn"/></div>
</form><script src="<?php echo DT_SKIN; ?>js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
    $("#dform").Validform({
        tiptype: 3
    })
</script>
<script type="text/javascript">Menuon(<?php echo $menuid;?>);</script>
<?php include tpl('footer');?>