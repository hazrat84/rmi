<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <?php print $head ?>
    <title><?php print $head_title ?></title>
    <?php print $styles ?>
    <?php print $scripts ?>
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
              <div class="welcome">Welcome <?php
                global $user;
                print $user->name;
                ?> </div>
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
        <div class="content">
          <div class="page_panel">
            <div class="page_panel_blue_belt"><div class="page_panel_header"><?php print $title; ?></div></div>
            <div class="page_panel_body"> 
              <?php //print $content ?>
              <div class="plans">
                <div style="margin: 0 auto;width: 642px;">
                  <!-- --------------- Plan Box 1----------------- -->
                  <div class="plan-box">
                    <div class="plan-title">
                      <p>Individual Plans</p>
                    </div>
                    <div class="plan-body">
                      <div class="plan-head">
                        <p>
                          <span class="small-dollar">$</span>
                          <span class="digits">09</span>
                          <sup>monthly</sup>
                        </p>
                      </div>
                      <div class="plan-list">
                        <ul class="plan-tags">
                          <li><p>15 Data Groups</p></li>
                          <li><p>10GB Space</p></li>
                          <li><p>2 Friends Sharing</p></li>
                          <li><p>Online Access</p></li>
                        </ul>
                      </div>
                    </div>
                    <div class="plan-buttons">
                      <div style="margin: 0 auto;width: 102px;">
                        <input type="button" class="small-button" value="SIGN UP" id="plan_button" />
                      </div>                    
                    </div>
                  </div>
                  <!-- --------------- Plan Box 2----------------- -->
                  <div class="plan-box" style="margin-right: 0;">
                    <div class="plan-title">
                      <p>Individual Plans</p>
                    </div>
                    <div class="plan-body">
                      <div class="plan-head">
                        <p>
                          <span class="small-dollar">$</span>
                          <span class="digits">09</span>
                          <sup>monthly</sup>
                        </p>
                      </div>
                      <div class="plan-list">
                        <ul class="plan-tags">
                          <li><p>15 Data Groups</p></li>
                          <li><p>10GB Space</p></li>
                          <li><p>2 Friends Sharing</p></li>
                          <li><p>Online Access</p></li>
                        </ul>
                      </div>
                    </div>
                    <div class="plan-buttons">
                      <div style="margin: 0 auto;width: 102px;">
                        <input type="button" class="small-button" value="SIGN UP" id="plan_button" />
                      </div>                    
                    </div>
                  </div>
                  
                </div>
                <div class="clear"></div>

              </div>
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
    </div>
    <div class="clear"></div>
    <?php print $closure ?>
  </body>
</html>