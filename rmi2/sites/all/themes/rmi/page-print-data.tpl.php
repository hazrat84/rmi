<?php
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language ?>" lang="<?php print $language->language ?>" dir="<?php print $language->dir ?>">
  <head>
    <?php print $head ?>
    <title><?php print $head_title ?></title>
    <?php print $styles ?>
    <?php global $base_url ?>
    <link type="text/css" rel="stylesheet" media="all" href="<?php echo $base_url."/".drupal_get_path('theme','rmi') ?>/print.css?" />
    <?php print $scripts ?>
    <!--[if lt IE 7]>
      <?php print phptemplate_get_ie_styles(); ?>
    <![endif]-->
  </head>
  <body<?php print phptemplate_body_class($left, $right); ?> onload="window.print();">
<!-- Layout -->
  <div id="header-region" class="clear-block"><?php print $header; ?></div>

    <div id="wrapper">
    <div id="container" class="clear-block">
      <div class="body">
          <div class="logo">
              <?php
                if ($logo || $site_title) {
                    print '<h2><a href="' . check_url($front_page) . '" title="' . $site_title . '">';
                    if ($logo) {
                        print '<img src="' . $base_path . 'sites/all/themes/rmi/images/logo.png" alt="' . $site_title . '" id="logo" />';
                    }
                    print '</a></h2>';
                }
                ?>
          </div>
          <div class="site_name"><?php echo $site_name ?></div>
          <div id="center"><div id="squeeze"><div class="right-corner"><div class="left-corner">
          <?php if ($mission): print '<div id="mission">'. $mission .'</div>'; endif; ?>
                           <?php // if ($tabs): print '<ul class="tabs primary">'. $tabs .'</ul>'; endif; ?>
          <?php //if ($tabs2): print '<ul class="tabs secondary">'. $tabs2 .'</ul>'; endif; ?>
		<div class="wrapper">
			<div class="content">
				<?php if ($title): print '<h2'. ($tabs ? ' class="with-tabs"' : '') .'>'. $title .'</h2>'; endif; ?>
                                        <?php  if ($show_messages && $messages): print $messages; endif; ?>
                                        <div class="box" >
                                            <?php if($accountnav) { ?><div class="nav"><?php print $accountnav; ?></div><?php }  ?>
                                            <?php if($breadcrumb) { ?><div class="bread-crums"><?php print $breadcrumb; ?></div><?php }  ?>
                                            <?php print $content ?>
                                        </div>
			</div>
		</div>

                          </div></div></div></div>
          <div id="footer" class="footer">
              <div class="left">Copyright © Infinitude Inc.</div>
              <div class="right"><?php print $footer_message  ?></div>
          </div>
	</div>
      
      <?php if ($right): ?>
        <div id="sidebar-right" class="sidebar">
          <?php if (!$left && $search_box): ?><div class="block block-theme"><?php print $search_box ?></div><?php endif; ?>
          <?php print $right ?>
        </div>
      <?php endif; ?>

    </div> <!-- /container -->
  </div>
<!-- /layout -->

  <?php print $closure ?>
  </body>
</html>
