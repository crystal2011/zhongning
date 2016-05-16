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
    <td class="tl"><span class="f_red">*</span> 您的称呼</td>
    <td>
        <input name="post[title]" type="text" id="title" datatype="*1-20" maxlength="20" size="30" value="<?php echo $title;?>"/>
        <select name="post[gender]"><option value="1" checked> 先生</option><option value="2" <?php echo $gender==2?'selected':''; ?>>女士</option></select>
        <?php echo level_select('post[level]', '级别', $level, 'id="level"');?>

        <span id="dtitle" class="f_red"></span>
    </td>
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
        <td><input name="post[price]" type="text" id="price" datatype="money" maxlength="9" size="60" value="<?php echo $price;?>"/> 注：最低起投金额为30000元</td>
    </tr>
    <tr>
        <td class="tl"><span class="f_red">*</span> 投资期限</td>
        <td>
            <select name="post[month]" datatype="*">
                <option value="">请选择期限</option>
                <option value="1" <?php echo $month==1?'selected':''; ?>>1个月</option>
                <option value="2" <?php echo $month==2?'selected':''; ?>>2个月</option>
                <option value="3" <?php echo $month==3?'selected':''; ?>>3个月</option>
                <option value="4" <?php echo $month==4?'selected':''; ?>>4个月</option>
                <option value="5" <?php echo $month==5?'selected':''; ?>>5个月</option>
                <option value="6" <?php echo $month==6?'selected':''; ?>>6个月</option>
                <option value="7" <?php echo $month==7?'selected':''; ?>>7个月</option>
                <option value="8" <?php echo $month==8?'selected':''; ?>>8个月</option>
                <option value="9" <?php echo $month==9?'selected':''; ?>>9个月</option>
                <option value="10" <?php echo $month==10?'selected':''; ?>>10个月</option>
                <option value="11" <?php echo $month==11?'selected':''; ?>>11个月</option>
                <option value="12" <?php echo $month==12?'selected':''; ?>>12个月</option>
            </select>
        </td>
    </tr>
<tr>
<td class="tl"><span class="f_hid">*</span> 信息状态</td>
<td>
<input type="radio" name="post[status]" value="3" <?php if($status == 3) echo 'checked';?>/> 完成投资
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
        tiptype: 3,
        datatype:{
            "mobile":function(gets,obj,curform,regxp){
                if(!is_mobile(gets)) return false;
                return true;
            },
            "money":function(gets,obj,curform,regxp){
                var sd = /^[1-9][0-9]{0,8}$/
                var s = parseInt(gets)
                if(!sd.test(gets) || s<30000){
                    return false;
                }
                return true;
            }
        }
    })

</script>
<script type="text/javascript">Menuon(<?php echo $menuid;?>);</script>
<?php include tpl('footer');?>