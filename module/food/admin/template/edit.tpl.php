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
    <tbody id="d_member" >
    <tr>
        <td class="tl"><span class="f_red">*</span> 会员名</td>
        <td><input name="post[username]" type="text"  size="20" datatype="*2-20" value="<?php echo $username;?>" id="username"/> <a href="javascript:_user(Dd('username').value);" class="t">[资料]</a> <span id="dusername" class="f_red"></span></td>
    </tr>
    </tbody>
    <tr>
    <td class="tl"><span class="f_red">*</span> 公司名称</td>
    <td><input name="post[title]" type="text" id="title" size="60" maxlength="50" datatype="*2-50"  value="<?php echo $title;?>"/> <?php echo level_select('post[level]', '级别', $level);?>  <br/><span id="dtitle" class="f_red"></span></td>
    </tr>
    <tr>
        <td class="tl"><span class="f_red">*</span> 联系电话</td>
        <td class="tr">
            <input type="text" name="post[mobile]" id="mobile" datatype="mobile" maxlength="15" size="20"  value="<?php echo $mobile; ?>" > &nbsp;手机/固话
        </td>
    </tr>
    <tr>
        <td class="tl"><span class="f_red">*</span> 公司地址</td>
        <td class="tr"><input type="text" name="post[address]" datatype="*2-50" id="address" size="50" maxlength="50" value="<?php echo $address; ?>" > <span id="daddress class="f_red"></span></td>
    </tr>

    <tbody id="d_guest">
    <tr>
        <td class="tl"><span class="f_red">*</span> 申请金额</td>
        <td class="tr">
            <input type="text" name="post[price]" id="price" size="50" maxlength="7" datatype="money"  value="<?php echo $price; ?>" >
            <span style="color:blue;">( 注:50万-500万 纯数字 )</span>
        </td>
    </tr>
    </tbody>
    <tbody id="d_guest">
    <tr>
        <td class="tl"><span class="f_red">*</span> 申请期限</td>
        <td class="tr">
            <select name="post[month]" datatype="*" >
                <option  value="">请选择期限</option>
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
        <td class="tl"><span class="f_red">*</span> 有无抵押或担保</td>
        <td class="tr">
            <select  name="post[danbao]" datatype="*">
                <option  value="">请选择</option>
                <option value="1" <?php echo $danbao==1?'selected':''; ?>>无</option>
                <option value="2" <?php echo $danbao==2?'selected':''; ?>>有抵押</option>
                <option value="3" <?php echo $danbao==3?'selected':''; ?>>有担保</option>
                <option value="4" <?php echo $danbao==4?'selected':''; ?>>有抵押、有担保</option>
            </select>
        </td>
    </tr>
    </tbody>

    <tr>
        <td class="tl"><span class="f_hid">*</span> 其他需求描述</td>
        <td><textarea name="post[introduce]" maxlength="200" datatype="*5-200" style="width:90%;height:45px;"><?php echo $introduce;?></textarea></td>
    </tr>



    <tr>
    <td class="tl"><span class="f_hid">*</span> <?php echo $MOD['name'];?>状态</td>
    <td>
    <input type="radio" name="post[status]" value="3" <?php if($status == 3) echo 'checked';?>/> 完成融资
    <input type="radio" name="post[status]" value="2" <?php if($status == 2) echo 'checked';?>/> 待审
    <input type="radio" name="post[status]" value="1" <?php if($status == 1) echo 'checked';?> onclick="if(this.checked) Dd('note').style.display='';"/> 拒绝
    <input type="radio" name="post[status]" value="0" <?php if($status == 0) echo 'checked';?>/> 删除
    </td>
    </tr>
</table>
<div class="sbt"><input type="submit" name="submit" value=" 确 定 " class="btn"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value=" 重 置 " class="btn"/></div>
</form>
<?php load('clear.js'); ?>
<?php load('guest.js'); ?>
    <script src="<?php echo DT_SKIN; ?>js/Validform_v5.3.2_min.js"></script>

<script type="text/javascript">

    $("#dform").Validform({
        tiptype: 3,
        datatype:{
            "mobile":function(gets,obj,curform,regxp){
                if(!is_mobile(gets) && !is_phone(gets)) return '输入错误';
                return true;
            },
            "money":function(gets,obj,curform,regxp){
                var sd = /^[1-9][0-9]{0,6}$/
                if(!sd.test(gets) || parseInt(gets)>5000000 || parseInt(gets)<500000){
                    return false;
                }
                return true;
            }
        }
    })
</script>
<script type="text/javascript">Menuon(<?php echo $menuid;?>);</script>
<?php include tpl('footer');?>