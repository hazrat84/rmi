<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language ?>" lang="<?php print $language->language ?>" dir="<?php print $language->dir ?>">
  <head>
    <?php
    global $base_url, $base_path, $user;
    print $head;
    ?>
    <title><?php print $head_title ?></title>
    <?php
    print $styles;
    print $scripts;
    ?>
    <!--[if IE 7]>
      <link rel="stylesheet" type="text/css" href="<?php echo base_path() . drupal_get_path('theme', 'rmi'); ?>/css/ie7.css" media="screen" />
    <![endif]-->
    <!--[if IE 8]>
     
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>
  <body>
    <div id="header_wraps">
      <!--     Main site header        -->
      <div class="header">
        <div class="head-wrapper">
          <div id="logo">
            <?php
            if ($logo || $site_title) {
              print '<a href="' . check_url($front_page) . '" title="' . $site_title . '">';
              if ($logo) {
                print '<img src="' . check_url($logo) . '" alt="' . $site_title . '" id="logo" />';
              }
              print '</a>';
            }
            ?>
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
              <div class="welcome">
                <?php
                profile_load_profile($user);
                $name = $user->profile_first_name;
                print 'Welcome ' . $name;
                ?>
              </div>
              <div class="social_icons_div">
                <div class="social_icon">
                  <a href="https://www.facebook.com/pages/Register-my-info/412264385461530#!/pages/Register-my-info/412264385461530" target="_blank">
                    <img src="<?php echo base_path() . drupal_get_path('theme', 'rmi'); ?>/images/facebook.png" />
                  </a>
                </div>
                <div class="social_icon twitter">
                  <a href="https://twitter.com/registermyinfo" target="_blank">
                    <img src="<?php echo base_path() . drupal_get_path('theme', 'rmi'); ?>/images/twitter.png" />
                  </a>
                </div>
                <div class="social_icon rss">
                  <img src="<?php echo base_path() . drupal_get_path('theme', 'rmi'); ?>/images/rss.png" />
                </div>
              </div>
            </div>
            <div id="cfnavbar">
              <?php print $dropmenu; ?>
            </div>
          </div>
        </div>
        <div class="clear"></div>
      </div>
      <div class="header_bottom">&nbsp;</div>
      <div class="clear"></div>
      <!--     header ENDS ---------------------- -->

      <div class="wrapper">
        <div class="wrap">
          <div class="page_panel">
            <div class="page_panel_blue_belt"><div class="page_panel_header"><?php print $title; ?></div></div>
            <div class="page_panel_body"> 
              <?php print $content ?>
            </div>
          </div>
          <div class="footer_msg">
            <?php print $footer_message ?>
          </div>
        </div>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
    </div>

    <div id="footer_wraps">
      <div class="footer">
        <div class="footer_left">
          <?php
          $img_path = base_path() . drupal_get_path('theme', 'rmi');
          ?>
          <div class="foot_img1" style="float: left;margin: 0 30px;">
            <img src="<?php echo $img_path ?>/images/sym_logo.png" alt="footer image 1" id="logo" />
          </div>
          <div class="foot_img2" style="float: left">
            <img src="<?php echo $img_path ?>/images/truste_logo.png" alt="footer image 2" id="logo" />
          </div>
          <div class="clear"></div>
        </div>
        <div class="footer_right">
          <div class="copyright"> &copy;2013 Infinitude Inc.</div>
        </div>
      </div>
    </div>
    <div class="clear"></div>
    <?php print $closure ?>
  </body>
</html>