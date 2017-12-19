<?php

/**
 * Sets the body-tag class attribute.
 *
 * Adds 'sidebar-left', 'sidebar-right' or 'sidebars' classes as needed.
 */
function phptemplate_body_class($left, $right) {
  if ($left != '' && $right != '') {
    $class = 'sidebars';
  } else {
    if ($left != '') {
      $class = 'sidebar-left';
    }
    if ($right != '') {
      $class = 'sidebar-right';
    }
  }

  if (isset($class)) {
    print ' class="' . $class . '"';
  }
}

/**
 * Return a themed breadcrumb trail.
 *
 * @param $breadcrumb
 *   An array containing the breadcrumb links.
 * @return a string containing the breadcrumb output.
 */
function phptemplate_breadcrumb($breadcrumb) {
  if (!empty($breadcrumb)) {
    return '<div class="breadcrumb">' . implode(' ÃƒÂ¢Ã¢â€šÂ¬Ã‚Âº ', $breadcrumb) . '</div>';
  }
}

/**
 * Override or insert PHPTemplate variables into the templates.
 */
function phptemplate_preprocess(&$vars) {
//  drupal_add_js(drupal_get_path('theme', 'rmi') . '/js/select-box.js');
  drupal_add_js(drupal_get_path('theme', 'rmi') . '/js/jquery.dd.js');
}

/**
 * Override or insert PHPTemplate variables into the templates.
 */
function phptemplate_preprocess_page(&$vars) {
  $vars['tabs2'] = menu_secondary_local_tasks();

  // Hook into color.module
  if (module_exists('color')) {
    _color_page_alter($vars);
  }
}

/**
 * Add a "Comments" heading above comments except on forum pages.
 */
function garland_preprocess_comment_wrapper(&$vars) {
  if ($vars['content'] && $vars['node']->type != 'forum') {
    $vars['content'] = '<h2 class="comments">' . t('Comments') . '</h2>' . $vars['content'];
  }
}

/**
 * Returns the rendered local tasks. The default implementation renders
 * them as tabs. Overridden to split the secondary tasks.
 *
 * @ingroup themeable
 */
function phptemplate_menu_local_tasks() {
  return menu_primary_local_tasks();
}

/**
 * Returns the themed submitted-by string for the comment.
 */
function phptemplate_comment_submitted($comment) {
  return t('!datetime ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬ï¿½ !username', array(
      '!username' => theme('username', $comment),
      '!datetime' => format_date($comment->timestamp)
  ));
}

/**
 * Returns the themed submitted-by string for the node.
 */
function phptemplate_node_submitted($node) {
  return t('!datetime !username', array(
      '!username' => theme('username', $node),
      '!datetime' => format_date($node->created),
  ));
}

/**
 * Generates IE CSS links for LTR and RTL languages.
 */
function phptemplate_get_ie_styles() {
  global $language;

  $iecss = '<link type="text/css" rel="stylesheet" media="all" href="' . base_path() . path_to_theme() . '/fix-ie.css" />';
  if ($language->direction == LANGUAGE_RTL) {
    $iecss .= '<style type="text/css" media="all">@import "' . base_path() . path_to_theme() . '/fix-ie-rtl.css";</style>';
  }

  return $iecss;
}

function rmi_theme(&$existing, $type, $theme, $path) {
  $themes = array(
      'user_login' => array(
          'template' => 'user-login',
          'arguments' => array('form' => NULL),
      ),
      'user_register' => array(
          'arguments' => array('form'),
          'function' => 'rmi_user_register',
      ),
      'user_pass' => array(
          'arguments' => array('form'),
          'function' => 'rmi_user_forgot_password',
      ),
      'user_profile_form' => array(
          'arguments' => array('form'),
          'function' => 'rmi_user_change_password',
      ),
  );
  return $themes;
}

function rmi_user_login($form) {
//  drupal_set_title("Login");
//  $form['name']['#description'] = "";
//  $form['name']['#title'] = "Email Address";
//  $form['pass']['#description'] = "";
//  $output = "<div id='user_login_form'>";
//  $output = drupal_render($form);
//  $output .= l(t('Forgot Password'), "user/password");
//  $output .= '</div>';
//  return $output;
}

/**
 * Pre Process Function for Login Form
 * @param $variables
 */
function rmi_preprocess_user_login(&$variables) {
//  print_r($variables);exit;
  $variables['intro_text'] = t('Login');
  $variables['rendered'] = drupal_render($variables['form']);
  $variables['username'] = drupal_render($variables['form']['name']);
  $variables['password'] = drupal_render($variables['form']['pass']);
}

function rmi_user_register($form) {
  drupal_set_title("Sign Up");
  $form['account']['name']['#description'] = "";
  $form['account']['mail']['#description'] = "";
  $form['account']['pass']['#description'] = "";
  $form['account']['#title'] = "";
  $form['Personal information']['#title'] = "";
  $form['account']['#type'] = "";
  $form['Personal information']['#type'] = "";
  $form['submit']['#value'] = "Sign Up";
  $output = "<div id='user_register_form'>";
  $output .= drupal_render($form['Personal information']['profile_first_name']);
  $output .= drupal_render($form['Personal information']['profile_last_name']);
  $output .= drupal_render($form['account']['name']);
  $output .= drupal_render($form['account']['mail']);
  $output .= drupal_render($form['account']['pass']);
  $output .= "<div class='user_register_form_submit_button'>" . drupal_render($form['submit']);
  $output .= drupal_render($form);
  $output .= l(t('Forgot Password'), "user/password") . "</div>";
  $output .= '</div>';
  return $output;
}

function rmi_user_forgot_password($form) {
  drupal_set_title("Forgot Password");
  $form['name']['#title'] = "Email Address";
  $form['submit']['#value'] = "Retrieve Password";
  $output = "<div id='user_forgot_password_form'>";
  $output = drupal_render($form);
  $output .= '</div>';
  return $output;
}

function rmi_user_change_password($form) {
  $form['account']['#type'] = "";
  $form['account']['pass']['#description'] = "";
  $output = "<div id='user_change_password_form'>";
  $output = drupal_render($form);
  $output .= '</div>';
  return $output;
}

/**
 * Output breadcrumb as an unorderd list with unique and first/last classes
 */
function rmi_breadcrumb($variables) {
  $breadcrumb = $variables['breadcrumb'];
  if (arg(0) == 'user' && arg(1) == 'contact' && arg(2) == 'data' && is_numeric(arg(3))) {
    $user_id = arg(3);
    $nid = arg(4);
  } else {
    $user_id = arg(4);
    $nid = arg(5);
  }
  $contact = user_load($user_id);
  profile_load_profile($contact);
  $node_name = db_result(db_query("SELECT `title` FROM {node} WHERE nid = %d", $nid));
  if (arg(0) == 'user' && arg(1) == 'contact' && arg(2) == 'data' && is_numeric(arg(3)) && is_numeric(arg(4))) {
    $breadcrumb = array(
        l(t('My Account'), 'user/account'),
        l(t('Contact'), 'user/contacts'),
        l($contact->profile_first_name . " " . $contact->profile_last_name, 'user/contacts/' . $user_id),
        $node_name
    );
  } else if (arg(0) == 'user' && arg(1) == 'contact' && arg(2) == 'datagroup' && arg(3) == 'detail' && is_numeric(arg(4)) && is_numeric(arg(5))) {
    $title = db_result(db_query("SELECT dsdata.data FROM `datagroup_submitted_data` dsdata
                                        INNER JOIN webform_component wc on wc.cid = dsdata.cid
                                        WHERE dsdata.sid = %d AND wc.nid = %d and wc.name = 'Title'", arg(6), arg(5)));
    $breadcrumb = array(
        l(t('My Account'), 'user/account'),
        l(t('Contact'), 'user/contacts'),
        l($contact->profile_first_name . " " . $contact->profile_last_name, 'user/contacts/' . $user_id),
        l($node_name, 'user/contact/data/' . arg(4) . '/' . arg(5)),
        $title
    );
  } else if (arg(0) == 'user' && arg(1) == 'contact' && arg(2) == 'subdatagroup' && arg(3) == 'detail' && is_numeric(arg(4)) && is_numeric(arg(5))) {
    $title = db_result(db_query("SELECT dsdata.data FROM `datagroup_submitted_data` dsdata
                                        INNER JOIN webform_component wc on wc.cid = dsdata.cid
                                        WHERE dsdata.sid = %d AND wc.nid = %d and wc.name = 'Title'", arg(6), arg(5)));
    $sub_title = db_result(db_query("SELECT sub_data.data FROM sub_datagroup_submitted_data sub_data
                                             INNER JOIN `webform_component` wc ON wc.cid = sub_data.cid
                                             WHERE ssid = %d AND wc.nid = %d AND wc.`form_key` LIKE '%_title%' AND wc.`pid` <> 0", arg(7), arg(5)));
    if (empty($sub_title)) {
      $sub_title = db_result(db_query("SELECT `title`  FROM `sub_datagroup_submissions` WHERE `ssid` = %d", arg(7)));
    }
    //$sub_title = db_result(db_query("SELECT `title`  FROM `sub_datagroup_submissions` WHERE `ssid` = %d", arg(7)));
    $breadcrumb = array(
        l(t('My Account'), 'user/account'),
        l(t('Contact'), 'user/contacts'),
        l($contact->profile_first_name . " " . $contact->profile_last_name, 'user/contacts/' . $user_id),
        l($node_name, 'user/contact/data/' . arg(4) . '/' . arg(5)),
        l($title, 'user/contact/datagroup/detail/' . arg(4) . '/' . arg(5) . '/' . arg(6) . '/' . arg(8)),
        $sub_title
    );
  }
  if (!empty($breadcrumb) && arg(1) == 'contact') {
    // Provide a navigational heading to give context for breadcrumb links to
    // screen-reader users. Make the heading invisible with .element-invisible.
    $crumbs = '<ul>';
    $array_size = count($breadcrumb);
    $i = 0;
    while ($i < $array_size) {
      $crumbs .= '<li class="breadcrumb-' . $i;
      if ($i == 0) {
        $crumbs .= ' first';
      }
      if ($i + 1 == $array_size) {
        $crumbs .= ' last';
      }
      $crumbs .= '">' . $breadcrumb[$i] . '</li>';
      $i++;
    }
    $crumbs .= '</ul>';
    return $crumbs;
  }
}

function rmi_form_element($element, $value) {
  // This is also used in the installer, pre-database setup.
  $t = get_t();

  $output = '<div class="form-item"';
  if (!empty($element['#id'])) {
    $output .= ' id="' . $element['#id'] . '-wrapper"';
  }
  $output .= ">\n";
  $required = !empty($element['#required']) ? '<span class="form-required" title="' . $t('This field is required.') . '">*</span>' : '';

  if (!empty($element['#title'])) {
    $title = $element['#title'];
    if (!empty($element['#id'])) {
      $output .= ' <label for="' . $element['#id'] . '">' . $t('!title !required', array('!title' => filter_xss_admin($title), '!required' => $required)) . "</label>\n";
    } else {
      $output .= ' <label>' . $t('!title !required', array('!title' => filter_xss_admin($title), '!required' => $required)) . "</label>\n";
    }
  }

  $output .= " $value\n";

  if (!empty($element['#description'])) {
    $output .= ' <div class="description">' . $element['#description'] . "</div>\n";
  }

  $output .= "</div>\n";

  return $output;
}
