<?php
global $base_url;
?>
<div id="node-<?php print $node->nid; ?>" class="node<?php if ($sticky) { print ' sticky'; } ?><?php if (!$status) { print ' node-unpublished'; } ?>">

<?php print $picture ?>

<?php if ($page == 0): ?>
  <h2><a href="<?php print $node_url ?>" title="<?php print $title ?>"><?php print $title ?></a></h2>
<?php endif; ?>
  <div class="close_group"><a href="<?php print $base_url."/".$_REQUEST['destination'] ?>" ><img alt="close" src="<?php print base_path() ?>sites/all/themes/rmi/images/button_delete_blue.png" title="Close" /></a></div>
  <?php if ($submitted): ?>
    <!--<span class="submitted"><?php // print $submitted; ?></span> -->
  <?php endif; ?>

  <div class="content clear-block">
    <?php print $content ?>
  </div>
  <div class="clear-block">
    <div class="meta">
    <?php if ($taxonomy): ?>
      <div class="terms"><?php print $terms ?></div>
    <?php endif;?>
    </div>

    <?php if ($links): ?>
      <div class="links"><?php print $links; ?></div>
    <?php endif; ?>
  </div>

</div>
