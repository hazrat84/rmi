<?php
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language ?>" lang="<?php print $language->language ?>" dir="<?php print $language->dir ?>">
  <head>
    <?php print $head ?>
    <title><?php print $head_title ?></title>
    <?php print $styles ?>
    <?php print $scripts ?>
    <!--[if IE 7]>
      <?php print phptemplate_get_ie_styles(); ?>
    <![endif]-->
    <!--[if IE]>
    <?php
    print '<link type="text/css" rel="stylesheet" media="all" href="' . base_path() . drupal_get_path('theme', 'rmi') . '/fix-ie.css" />';
    ?>
    <![endif]-->
  </head>
  <body<?php print phptemplate_body_class($left, $right); ?>>

<!-- Layout -->
  <div id="header-region" class="clear-block"></div>

    <div id="wrapper">
    <div id="container" class="clear-block">
      <div class="body">
        <!-- Header Starts -->
      <div class="header">  
        <div id="logo">
          <?php
            if ($logo) {
                //print '<img src="' . check_url($logo) . '" alt="' . $site_title . '" id="logo" />';
              }
           ?>
          <img src="<?php echo base_path() . drupal_get_path('theme', 'rmi');?>/images/logo.png" /> 
        </div>
        <div class="header_menus">
          <div class="secd_menu">
            <div class="my_account_link_div">
                <div class="second_menu">
                  <?php if (isset($secondary_links)) : ?>
                    <?php print theme('links', $secondary_links, array('class' => 'links secondary-links')) ?>
                  <?php endif; ?>
                </div>
            </div>
            <div class="welcome">Welcome <?php global $user; print $user->name; ?> </div>
            <div class="social_icons_div">
              <div class="social_icon">
                <a href="https://www.facebook.com/pages/Register-my-info/412264385461530#!/pages/Register-my-info/412264385461530" target="_blank">
                  <img src="<?php echo base_path() . drupal_get_path('theme', 'rmi');?>/images/facebook.png" />
                </a>
              </div>
              <div class="social_icon twitter">
                <a href="https://twitter.com/registermyinfo" target="_blank">
                  <img src="<?php echo base_path() . drupal_get_path('theme', 'rmi');?>/images/twitter.png" />
                </a>
              </div>
              <div class="social_icon rss">
                <img src="<?php echo base_path() . drupal_get_path('theme', 'rmi');?>/images/rss.png" />
              </div>
            </div>
          </div>
          <div id="cfnavbar">
             <?php print $dropmenu; ?>
          </div>
        </div>
      </div>
      <div class="header_bottom">&nbsp;</div>
      <!-- Header Ends -->
          <div id="center">
            <div id="squeeze">
              <div class="right-corner">
                <div class="left-corner">
                    <?php if ($mission): print '<div id="mission">'. $mission .'</div>'; endif; ?>
                    <div class="wrapper">
                      <div class="content">
                        <div class="page_panel">
                          <div class="page_panel_blue_belt"><div class="page_panel_header"><?php print $title ; ?></div></div>
                          <div class="page_panel_body"> 
                            <?php print $content ?>
                          </div>
                        </div>
                        <?php  if ($show_messages && $messages): print $messages; endif; ?>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
          </div>
    <center>
        <div class="footer_msg">
            <?php print $footer_message ?>
        </div>
      </center>      
	</div>
  <center>
      <div class="footer">
        <div class="footer_left">
          <ul>
              <li><a href="#">Home</a></li>
              <li><a href="#">How it Works</a></li>
              <li><a href="#">Solutions</a></li>
              <li><a href="#">GET RMI</a></li>
          </ul>
        </div>
        <div class="footer_right">
          <div class="copyright"> &copy;2013 Infinitude Inc.</div> 
          <div class="footer_links">
            <ul>
              <li><a href="#">About Us</a></li>
              <li><a href="#">News</a></li>
              <li><a href="#">Help</a></li>
              <li class="last"><a href="#">Contact Us</a></li>
          </ul>
          </div> 
        </div>
      </div>
    </center>    
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