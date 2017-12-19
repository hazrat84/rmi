<?php
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language ?>" lang="<?php print $language->language ?>" dir="<?php print $language->dir ?>">
  <head>
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

      <!-- Layout -->
      <div id="header-region" class="clear-block"></div>

      <div id="wrapper">
        <div id="container" class="clear-block">
          <div id="header" class="header">
            <div class="left">
              <?php
              // Prepare header
              if ($logo || $site_title) {
                print '<h2><a href="' . check_url($front_page) . '" title="' . $site_title . '">';
                if ($logo) {
                  print '<img src="' . check_url($logo) . '" alt="' . $site_title . '" id="logo" />';
                }
                print '</a></h2>';
              }
              ?>
            </div>
            <div class="right">
              <div class="sec_menu_div">
                <?php if (isset($secondary_links)) : ?>
                  <?php print theme('links', $secondary_links, array('class' => 'links secondary-links')) ?>
                <?php endif; ?>
              </div>
              <div class="menu_bar">
                <div class="nav">
                  <?php print $dropmenu; ?>
                  <?php //if (isset($primary_links)) : ?>
                  <?php //print theme('links', $primary_links, array('class' => 'links primary-links')) ?>
                  <?php //endif; ?>
                </div>
                <div class="social_links">
                  <div class="twitter_link"><a href="https://twitter.com/registermyinfo" target="_blank"><img alt="twitter" src="<?php print base_path() ?>sites/all/themes/rmi/images/twitter.png" title="twitter" /></a></div>
                  <div class="facebook_link"><a href="https://www.facebook.com/pages/Register-my-info/412264385461530#!/pages/Register-my-info/412264385461530" target="_blank"><img alt="facebook" src="<?php print base_path() ?>sites/all/themes/rmi/images/facebook.png" title="facebook" /></a></div>
                </div>
              </div>
            </div>
          </div>


          <!--<div id="header" class="header">
              <div class="left">
          <?php
          // Prepare header
          if ($logo || $site_title) {
            print '<h2><a href="' . check_url($front_page) . '" title="' . $site_title . '">';
            if ($logo) {
              print '<img src="' . check_url($logo) . '" alt="' . $site_title . '" id="logo" />';
            }
            print '</a></h2>';
          }
          ?>
                  <div class="nav">
          <?php print $dropmenu; ?>
          <?php //if (isset($primary_links)) : ?>
          <?php //print theme('links', $primary_links, array('class' => 'links primary-links')) ?>
          <?php //endif; ?>
                  </div>
              </div>
              <div class="right">
          <?php if (isset($secondary_links)) : ?>
            <?php print theme('links', $secondary_links, array('class' => 'links secondary-links')) ?>
          <?php endif; ?>
                  <div class="social_links">
                      <div class="twitter_link"><a href="https://twitter.com/registermyinfo" target="_blank"><img alt="twitter" src="<?php print base_path() ?>sites/all/themes/rmi/images/twitter.png" title="twitter" /></a></div>
                      <div class="facebook_link"><a href="https://www.facebook.com/pages/Register-my-info/412264385461530#!/pages/Register-my-info/412264385461530" target="_blank"><img alt="facebook" src="<?php print base_path() ?>sites/all/themes/rmi/images/facebook.png" title="facebook" /></a></div>
                  </div>
              </div>
            
    
          </div> -->
          <div class="body">
            <div id="center"><div id="squeeze"><div class="right-corner"><div class="left-corner">
                    <?php
                    if ($mission): print '<div id="mission">' . $mission . '</div>';
                    endif;
                    ?>
                    <?php // if ($tabs): print '<ul class="tabs primary">'. $tabs .'</ul>'; endif; ?>
<?php //if ($tabs2): print '<ul class="tabs secondary">'. $tabs2 .'</ul>'; endif;    ?>
                    <div class="wrapper">
                      <div class="content">
                        <?php
                        if ($show_messages && $messages): print $messages;
                        endif;
                        ?>
<?php print $content ?>
                      </div>
                    </div>

                  </div></div></div></div>
            <div id="footer" class="footer">
              <div class="left">copyright © Infinitude Inc</div>
              <div class="right"><?php print $footer_message ?></div>
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