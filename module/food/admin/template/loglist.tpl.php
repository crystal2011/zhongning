<?php
defined('DT_ADMIN') or exit('Access Denied');
include tpl('header');
show_menu($menus);
?>
    <form method="post">
        <div class="tt">融资进度</div>
        <table cellpadding="2" cellspacing="1" class="tb">
            <tr>
                <th>审核时间</th>
                <th>融资进度</th>
                <th>操作</th>
            </tr>
            <?php foreach($lists as $k=>$v) {?>
            <tr onmouseover="this.className='on';" onmouseout="this.className='';" align="center">
                <td><?php echo date('Y-m-d H:i:s',$v['addtime']);?></td>
                <td><?php echo $v['content'];?></td>
                <td><span onclick="editlog(<?php echo $v['itemid'] ?>,this)">修改</span>&nbsp;&nbsp;&nbsp;<span onclick="dellog(<?php echo $v['itemid'] ?>);">删除</span></td>
            </tr>
            <?php } ?>
        </table>
    </form>
    <div class="pages"><?php echo $pages;?></div>
    <br/>
    <form method="post" action="?moduleid=23&file=index&action=logadd&itemid=<?php echo $itemid; ?>">
        <div class="tt">进度发布</div>
        <div style="width:400px;margin:0 auto;">
            <p><span>进度：</span><textarea name="content" id="content" style="width:350px;height:100px;vertical-align: top;"></textarea></p>
            <p>
                <input type="hidden" name="logitemid" id="logitemid" />
                <input type="submit" name="submit" value="提交 " style="padding:5px 10px;margin-left:170px;" />
            </p>
        </div>
    </form>
<script>
    function dellog(itemid){
        if(confirm('您确定要删除该信息')){
            location.href = '?moduleid=23&file=index&action=logdel&itemid='+itemid;
        }
    }
    function editlog(itemid,_this){
        $("#logitemid").val(itemid);
        $("#content").val($(_this).parent().prev().text());
    }
</script>
<?php include tpl('footer');?>