<?php
defined('DT_ADMIN') or exit('Access Denied');
include tpl('header');
show_menu($menus);
?>
<form method="post" action="?" id="dform" >
<input type="hidden" name="moduleid" value="<?php echo $moduleid;?>"/>
<input type="hidden" name="file" value="<?php echo $file;?>"/>
<input type="hidden" name="action" value="<?php echo $action;?>"/>
<input type="hidden" name="itemid" value="<?php echo $itemid;?>"/>
<input type="hidden" name="forward" value="<?php echo $forward;?>"/>
<div class="tt"><?php echo $action == 'add' ? '添加' : '修改';?><?php echo $MOD['name'];?></div>
<table cellpadding="2" cellspacing="1" class="tb">
<tr>
<td class="tl"><span class="f_red">*</span> <?php echo $MOD['name'];?>标题</td>
<td><input name="post[title]" type="text" id="title" size="60" datatype="*2-50" maxlength="50" value="<?php echo $title;?>"/> </td>
</tr>

<tr>
<td class="tl"><span class="f_hid">*</span> 详细说明</td>
<td><textarea name="post[content]" id="content" class="dsn"><?php echo $content;?></textarea>
<?php echo deditor($moduleid, 'content', $MOD['editor'], '100%', 350);?><br/><span id="dcontent" class="f_red"></span>
</td>
    </tr>
    <tr>
        <td class="tl" height="30"><span class="f_hid">*</span> 内容选项</td>
        <td>
            <a href="javascript:pagebreak();Ds('subtitle');"><img src="admin/image/pagebreak.gif" align="absmiddle"/> 插入分页符</a>&nbsp;&nbsp;
            <input type="checkbox" name="post[save_remotepic]" value="1"<?php if($MOD['save_remotepic']) echo 'checked';?>/>下载远程图片&nbsp;&nbsp;
            <input type="checkbox" name="post[clear_link]" value="1"<?php if($MOD['clear_link']) echo 'checked';?>/>清除链接&nbsp;&nbsp;
            截取内容 <input name="post[introduce_length]" type="text" size="2" value="<?php echo $MOD['introduce_length']?>"/> 字符至简介&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        <td class="tl"><span class="f_hid">*</span> <?php echo $MOD['name'];?>简介</td>
        <td><textarea name="post[introduce]" style="width:90%;height:45px;"><?php echo $introduce;?></textarea></td>
    </tr>
</tr>

<tr>
<td class="tl"><span class="f_hid">*</span> <?php echo $MOD['name'];?>状态</td>
<td>
<input type="radio" name="post[status]" value="3" <?php if($status == 3) echo 'checked';?>/> 通过
<input type="radio" name="post[status]" value="2" <?php if($status == 2) echo 'checked';?>/> 待审
<input type="radio" name="post[status]" value="1" <?php if($status == 1) echo 'checked';?> onclick="if(this.checked) Dd('note').style.display='';"/> 拒绝
<input type="radio" name="post[status]" value="0" <?php if($status == 0) echo 'checked';?>/> 删除
</td>
</tr>
    </table>
<div class="sbt"><input type="submit" name="submit" value=" 确 定 " class="btn"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value=" 重 置 " class="btn"/></div>
</form>
    <script src="<?php echo DT_SKIN; ?>js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
    $("#dform").Validform({
        tiptype: 3,
        datatype:{
            "mobile":function(gets,obj,curform,regxp){
                if(!is_mobile(gets) && !is_phone(gets)) return '输入错误';
                return true;
            },
            'money':function(gets,obj,curform,regxp){
                if(!is_price(gets)) return false;
                return true;
            }
        }
    })
</script>
<script type="text/javascript">Menuon(<?php echo $menuid;?>);</script>
<?php include tpl('footer');?>