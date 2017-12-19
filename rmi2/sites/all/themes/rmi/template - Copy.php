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

function phptemplate_webform_form_14($form) {
  global $base_path;
  // NAME FIELD
  //$name_title = $form['submitted']['name']['#title'];
  //$form['submitted']['name']['#title'] = NULL;
  //<label>' . $name_title . '</label> line 328
  $form['submitted']['name']['#default_value'] = "Enter Your Name";
  // Address Field
  $address_title = $form['submitted']['address']['#title'];
  $form['submitted']['address']['#title'] = NULL;
  $form['submitted']['address']['#attributes'] = array('cols' => '62', 'rows' => '93');
  $form['submitted']['address']['#attributes'] = array('class' => 'text-area gradient form-tag');
  // Email Field
  $email_title = $form['submitted']['email_address']['#title'];
  $form['submitted']['email_address']['#title'] = NULL;
  // Telephone Type //
  $telephone_type_title = $form['submitted']['telephone']['info']['type']['#title'];
  $form['submitted']['telephone']['info']['type']['#attributes']['class'] = "default";
  $filedset = $form['submitted']['telephone']['#title'];
  //Telephone Number
  $telephone_number_title = $form['submitted']['telephone']['info']['telephone_number']['#title'];
  $form['submitted']['telephone']['info']['telephone_number']['#title'] = "Telephone Number";
  // Add another button
  $form['submitted']['telephone']['add_fields']['#attributes'] = array('class' => 'submit');
  $form['submitted']['telephone']['add_fields']['#value'] = 'Add Telephone +';
  /* Submit button */
  $form['submitted']['telephone']['info']['type']['#attributes']['title'] = "select type";
  $form['submitted']['telephone']['info']['telephone_number']['#attributes']['value'] = "Telephone Number";

  $output = '<div class="form">
        <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['title']) . '</div>
        </div>
	<div class="form-element">
        <div class="input-field">' . drupal_render($form['submitted']['name']) . '</div>
        </div>
        <div class="form-element">
		<label>' . $address_title . '</label>
		<span>' . drupal_render($form['submitted']['address']) . '</span>
	</div>
	<div class="form-element">
    	<label>' . $email_title . '</label>
        <div class="input-field">
        	' . drupal_render($form['submitted']['email_address']) . '
        </div>
    </div>
	<div class="clear">&nbsp;<br /></div>
    <div class="clear"></div>
    <div class="clear">&nbsp;<br /></div>
    ' . drupal_render($form['submitted']['telephone']) . '
    <div class="form-element all-submit">
      ' . drupal_render($form['actions']['submit']) . '
    </div>
</div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_2($form) {
  global $base_path;
  $dob_title = $form['submitted']['dob']['#title'];
  $form['submitted']['dob']['#title'] = NULL;
  $form['submitted']['dob']['month']['#attributes']['class'] = "default";
  $form['submitted']['dob']['month']['#attributes']['title'] = "select month";
  $form['submitted']['dob']['day']['#attributes']['class'] = "default";
  $form['submitted']['dob']['day']['#attributes']['title'] = "select day";
  $form['submitted']['dob']['year']['#attributes']['class'] = "default";
  $form['submitted']['dob']['year']['#attributes']['title'] = "select year";
  $ssn_title = $form['submitted']['ssn']['#title'];
  $form['submitted']['ssn']['ssn3']['#prefix'] = '<div class="small_input_prefix"></div>';
  $form['submitted']['ssn']['ssn3']['#suffix'] = '<div class="small_input_suffix"></div>';
  $form['submitted']['ssn']['ssn3']['#attributes']['style'] = "width:24px;text-align: center;";
  $form['submitted']['ssn']['ssn2']['#attributes']['style'] = "width:20px;text-align: center;";
  $form['submitted']['ssn']['ssn4']['#attributes']['style'] = "width:32px;";
  $form['actions']['submit']['#attributes'] = array('class' => 'submit');

  $output = '<div class="form">
        <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['personal_data_title']) . '</div>
        </div>
	<div class="form-element">
    	<label>' . $dob_title . '</label>
        <div class="group-fields">
		<div class="sel-drops">
        ' . drupal_render($form['submitted']['dob']['month']) . '
        </div>
        <div class="sel-drops">
         ' . drupal_render($form['submitted']['dob']['day']) . '
        </div>
        <div class="sel-drops">
         ' . drupal_render($form['submitted']['dob']['year']) . '
        </div>
        </div>
        </div>
	<div class="form-element">
		<label>' . $ssn_title . '</label>
        	<div class="group-fields">
              <div class="input-field">
              	' . drupal_render($form['submitted']['ssn']['ssn3']) . '
              </div>
        	  <span style="float:left; display:block; line-height:38px; padding:0px 6px 0px 10px;">-</span>
              <div class="input-field">
              	' . drupal_render($form['submitted']['ssn']['ssn2']) . '
              </div>
        	  <span style="float:left; display:block; line-height:38px; padding:0px 6px 0px 10px;">-</span>
              <div class="input-field">' . drupal_render($form['submitted']['ssn']['ssn4']) . '</div>
        	</div>
	</div>
	<div class="clear"></div>
    <div style="width:86px; margin:0px auto; padding-top:20px;">
    	' . drupal_render($form['actions']['submit']) . '
    </div>
</div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_3($form) {
  global $base_path;
  $form['submitted']['bank_account']['add_fields']['#value'] = "Add Bank Account +";
  $form['submitted']['credit___debit_cards']['add_fields']['#value'] = "Add Credit / Debit Cards +";
  $form['submitted']['credit_score']['add_fields']['#value'] = "Add Credit Score +";
  $form['submitted']['loans']['add_fields']['#value'] = "Add Loans +";
  $output = '<div class="form">
        <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['financial_title']) . '</div>
        </div>
        <div class="clear"></div>
	<div class="field-set">
		<div class="top"><div></div></div>
		<div>
			<div class="body-in">
                ' . drupal_render($form['submitted']['bank_account']) . '
			</div>
		</div>
		<div class="btm"><div></div></div>
	</div>
	<div class="clear"></div>
    <div class="field-set">
		<div class="top"><div></div></div>
		<div>
			<div class="body-in">
				' . drupal_render($form['submitted']['credit___debit_cards']) . '
			</div>
		</div>
		<div class="btm"><div></div></div>
	</div>
	<div class="clear"></div>
<div class="field-set">
		<div class="top"><div></div></div>
		<div>
			<div class="body-in">
                        ' . drupal_render($form['submitted']['credit_score']) . '
                    <div class="clear"></div>
				</div>
			</div>
		<div class="btm"><div></div></div>
	</div>
	<div class="clear"></div>
<div class="field-set">
		<div class="top"><div></div></div>
		<div>
			<div class="body-in">
                        ' . drupal_render($form['submitted']['loans']) . '
                    <div class="clear"></div>
					</div>
				</div>
		<div class="btm"><div></div></div>
	</div>
	<div class="clear"></div>
</div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_4($form) {
  global $base_path;
  $start_date_title = $form['submitted']['start_date']['#title'];
  $form['submitted']['start_date']['#title'] = null;
  $end_date_title = $form['submitted']['end_date']['#title'];
  $form['submitted']['end_date']['#title'] = null;

  $form['submitted']['start_date']['month']['#attributes']['class'] = "default";
  $form['submitted']['start_date']['month']['#attributes']['title'] = "select month";
  $form['submitted']['start_date']['day']['#attributes']['class'] = "default";
  $form['submitted']['start_date']['day']['#attributes']['title'] = "select month";
  $form['submitted']['start_date']['year']['#attributes']['class'] = "default";
  $form['submitted']['start_date']['year']['#attributes']['title'] = "select month";

  $form['submitted']['annual_salary_and_wages']['#attributes'] = array('cols' => '62', 'rows' => '93');
  $form['submitted']['annual_salary_and_wages']['#attributes'] = array('class' => 'text-area gradient form-tag');
  $form['submitted']['letters_of_recommendation']['add_fields']['#value'] = "Add Letters of recommendation +";
  $form['listing']['#weight'] = 10000;

  $output = '<div class="form">
      <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['employment_title']) . '</div>
        </div>
 <div class="form-element">
         ' . drupal_render($form['submitted']['employer']) . '
        </div>
 <div class="form-element">
  <label>' . $start_date_title . '</label>
         <div class="group-fields">
  <div class="sel-drops">
        ' . drupal_render($form['submitted']['start_date']['month']) . '
        </div>
        <div class="sel-drops">
         ' . drupal_render($form['submitted']['start_date']['day']) . '
        </div>
        <div class="sel-drops">
         ' . drupal_render($form['submitted']['start_date']['year']) . '
        </div>
        </div>
 </div>
 <div class="clear"></div>
    <div class="form-element">
  <label>' . $end_date_title . '</label>
         <div class="group-fields">
  <div class="sel-drops">
        ' . drupal_render($form['submitted']['end_date']['month']) . '
        </div>
        <div class="sel-drops">
         ' . drupal_render($form['submitted']['end_date']['day']) . '
        </div>
        <div class="sel-drops">
         ' . drupal_render($form['submitted']['end_date']['year']) . '
        </div>
        </div>
 </div>
 <div class="clear"></div>
    <div class="form-element">
         ' . drupal_render($form['submitted']['employer_contact_information']) . '
    </div>
    <div class="form-element">
  ' . drupal_render($form['submitted']['annual_salary_and_wages']) . '
 </div>
     <div class="form-element">

        <div class="file">' . drupal_render($form['submitted']['cv']) . '</div>
 </div>
    <div class="form-element">
  ' . drupal_render($form['submitted']['add_btn']) . '
    </div>
    <div class="clear"></div>
  <div class="top"><div></div></div>
  <div style="display:none;">
   <div class="body-in">
                    ' . drupal_render($form['submitted']['letters_of_recommendation']) . '
   </div>
  </div>
  <div class="btm"><div></div></div>
    <div class="clear"></div>
 </div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_5($form) {
  global $base_path;
  $allergies_title = $form['submitted']['allergies']['#title'];
  $form['submitted']['allergies']['#title'] = null;
  $medications_title = $form['submitted']['medications']['#title'];
  $form['submitted']['medications']['#title'] = null;
  $salary_wages_title = $form['submitted']['annual_salary_and_wages']['#title'];
  $form['submitted']['family_history']['#attributes'] = array('cols' => '62', 'rows' => '93');
  $form['submitted']['family_history']['#attributes'] = array('class' => 'text-area gradient form-tag');
  $family_history_title = $form['submitted']['family_history']['#title'];
  $form['submitted']['family_history']['#title'] = null;
  $alcohol_title = $form['submitted']['alcohol']['#title'];
  $form['submitted']['alcohol']['#title'] = null;
  $form['submitted']['surgeries']['add_fields']['#value'] = "Add Surgeries +";
  $form['submitted']['implants']['add_fields']['#value'] = "Add Implants +";

  $output = '<div class="form">
        <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['medical_history_title']) . '</div>
        </div>
	<div class="form-element">
    	<label>' . $allergies_title . '</label>
        <div class="input-field">
        	' . drupal_render($form['submitted']['allergies']) . '
        </div>
        </div>
	<div class="form-element">
    	<label>' . $medications_title . '</label>
        <div class="input-field">
        	' . drupal_render($form['submitted']['medications']) . '
        </div>
        </div>
	<div class="clear"></div>
    <div class="form-element">
		<label>' . $family_history_title . '</label>
		' . drupal_render($form['submitted']['family_history']) . '
	</div>
    <div class="form-element">
		' . drupal_render($form['submitted']['smoker___no_smoker']) . '
	</div>
    <div class="form-element">
      <label>' . $alcohol_title . '</label>
      <div class="group-fields">
		<div>
        ' . drupal_render($form['submitted']['alcohol']) . '
        </div>
        </div>
        </div>
    <div class="clear">&nbsp;<br /></div>
    <div class="field-set">
		<div class="top"><div></div></div>
			<div class="body-in">
                        
				' . drupal_render($form['submitted']['surgeries']) . '

			</div>
		<div class="btm"><div></div></div>
	</div>
    <div class="clear"></div>
     <div class="clear">&nbsp;<br /></div>
    <div class="field-set">
		<div class="top"><div></div></div>
			<div class="body-in">
				' . drupal_render($form['submitted']['implants']) . '
			</div>
		<div class="btm"><div></div></div>
	</div>
    <div class="form-element all-submit">
        ' . drupal_render($form['actions']['submit']) . '
    </div>
</div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_6($form) {
  global $base_path;
  $date_due_title = $form['submitted']['date_due']['#title'];
  $form['submitted']['date_due']['#title'] = null;

  $output = '	<div class="form">
        <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['expenses_title']) . '</div>
        </div>
	<div class="form-element">
          ' . drupal_render($form['submitted']['expense_type']) . '
        </div>
	<div class="form-element">
        ' . drupal_render($form['submitted']['amount']) . '
	</div>
    <div class="form-element">
        <label>' . $date_due_title . '</label>
        <div class="group-fields">
		<div>
        ' . drupal_render($form['submitted']['date_due']['month']) . '
        </div>
        <div>
         ' . drupal_render($form['submitted']['date_due']['day']) . '
        </div>
        <div>
         ' . drupal_render($form['submitted']['date_due']['year']) . '
        </div>
        </div>
        </div>
	<div class="clear"></div>
    <div style="width:86px; margin:0px auto; padding-top:20px;">
    	' . drupal_render($form['actions']['submit']) . '
    </div>
</div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_7($form) {
  global $base_path;
  $date_due_title = $form['submitted']['date']['#title'];
  $form['submitted']['date']['#title'] = null;

  $output = '<div class="form">
      <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['maintenance_title']) . '</div>
        </div>
	<div class="form-element">
  ' . drupal_render($form['submitted']['type']) . '
        </div>
    <div class="form-element">
      <label>' . $date_due_title . '</label>
      <div class="group-fields">
		<div>
        ' . drupal_render($form['submitted']['date']['month']) . '
        </div>
        <div>
         ' . drupal_render($form['submitted']['date']['day']) . '
        </div>
        <div>
         ' . drupal_render($form['submitted']['date']['year']) . '
        </div>
        </div>
        </div>
	<div class="clear"></div>
    <div style="width:86px; margin:0px auto; padding-top:20px;">
    	' . drupal_render($form['actions']['submit']) . '
    </div>
</div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_8($form) {
  global $base_path;
  $date_issued_title = $form['submitted']['date_issued']['#title'];
  $form['submitted']['date_issued']['#title'] = null;
  $expiration_date_title = $form['submitted']['expiration_date']['#title'];
  $form['submitted']['expiration_date']['#title'] = null;

  $output = '<div class="form">
      <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['government_id_title']) . '</div>
        </div>
  <div class="form-element">
          ' . drupal_render($form['submitted']['type']) . '
        </div>
  <div class="form-element">
    <label >' . $date_issued_title . '</label>
    <div class="group-fields">
      <div>
        ' . drupal_render($form['submitted']['date_issued']['month']) . '
      </div>
      <div>
         ' . drupal_render($form['submitted']['date_issued']['day']) . '
      </div>
      <div>
         ' . drupal_render($form['submitted']['date_issued']['year']) . '
      </div>
    </div>
  </div>
  <div class="form-element">
    <label >' . $expiration_date_title . '</label>
    <div class="group-fields">
      <div>
         ' . drupal_render($form['submitted']['expiration_date']['month']) . '
      </div>
      <div>
         ' . drupal_render($form['submitted']['expiration_date']['day']) . '
      </div>
      <div>
         ' . drupal_render($form['submitted']['expiration_date']['year']) . '
      </div>
    </div>
  </div>
  <div class="form-element">
    ' . drupal_render($form['submitted']['photo']) . '
  </div>
  <div class="form-element">
    ' . drupal_render($form['submitted']['digital']) . '
  </div>
  <div class="clear"></div>
  <div style="width:86px; margin:0px auto; padding-top:20px;">
    ' . drupal_render($form['actions']['submit']) . '
  </div>
</div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_10($form) {
  global $base_path;
  $output = '<div class="form">
      <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['favorites_title']) . '</div>
        </div>
	<div class="form-element">
        ' . drupal_render($form['submitted']['type']) . '
     </div>
        <div class="form-element">
        ' . drupal_render($form['submitted']['name']) . '
		</div>
        <div class="form-element">
        ' . drupal_render($form['submitted']['telephone_number']) . '
		</div>
		<div class="clear"></div>
    	' . drupal_render($form['actions']['submit']) . '
    </div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_11($form) {
  global $base_path;
  $purchase_date_title = $form['submitted']['date_of_purchase']['#title'];
  $form['submitted']['date_of_purchase']['#title'] = null;

  $output = '<div class="form">
      <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['product_warranty_title']) . '</div>
        </div>
    <div class="form-element">
        ' . drupal_render($form['submitted']['product_name']) . '
		</div>
	<div class="form-element">
    	<label style="width:120px;">' . $purchase_date_title . '</label>
  <div class="group-fields">
      <div>
         ' . drupal_render($form['submitted']['date_of_purchase']['month']) . '
      </div>
      <div>
         ' . drupal_render($form['submitted']['date_of_purchase']['day']) . '
      </div>
      <div>
         ' . drupal_render($form['submitted']['date_of_purchase']['year']) . '
      </div>
    </div>
     </div>
    <div class="form-element">
          ' . drupal_render($form['submitted']['warranty']) . '
		</div>
    <div class="form-element">
        ' . drupal_render($form['submitted']['manual_link']) . '
		</div>
		<div class="clear"></div>
    	<div style="width:86px; margin:0px auto; padding-top:20px;">
    	' . drupal_render($form['actions']['submit']) . '
    </div>
</div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_9($form) {
  global $base_path;
  $output = '	<div class="form">
      <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['insurance_registration_title']) . '</div>
        </div>
	<div class="form-element">
        ' . drupal_render($form['submitted']['type']) . '
        </div>
        <div class="form-element">
        ' . drupal_render($form['submitted']['policy']) . '
	</div>
        <div class="form-element">
        ' . drupal_render($form['submitted']['policy_number']) . '
	</div>
        <div class="form-element">
        ' . drupal_render($form['submitted']['notes']) . '
	</div>
	<div class="clear"></div>
    	' . drupal_render($form['actions']['submit']) . '
</div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_12($form) {
  global $base_path;
  $output = '<div class="form">
      <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['home_registry_title']) . '</div>
        </div>
	<div class="form-element">
    ' . drupal_render($form['submitted']['type']) . '
     </div>
        <div class="form-element">
        ' . drupal_render($form['submitted']['photo']) . '
		</div>
		<div class="clear"></div>
    	' . drupal_render($form['actions']['submit']) . '
      </div>';
  $output .= drupal_render($form);
  return $output;
}

function phptemplate_webform_form_13($form) {
  global $base_path;
  $output = '	<div class="form">
      <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['web_site_title']) . '</div>
        </div>
      <div class="form-element">
            <div class="input-field">' . drupal_render($form['submitted']['web_site_title']) . '</div>
        </div>
	<div class="form-element">
          ' . drupal_render($form['submitted']['type']) . '
     </div>
     <div class="form-element">
        <div class="input-field">' . drupal_render($form['submitted']['user_id']) . '</div>
		</div>
       <div class="form-element">
        <div class="input-field">' . drupal_render($form['submitted']['password']) . '</div>
		</div>
		<div class="clear"></div>
    	<div style="width:86px; margin:0px auto; padding-top:20px;">
    	' . drupal_render($form['actions']['submit']) . '
    </div>
</div>';
  $output .= drupal_render($form);
  return $output;
}
