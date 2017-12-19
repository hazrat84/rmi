<?php
/**
 * @file
 * Webform module SSN component.
 */

/**
 * Implements _webform_defaults_component().
 */
function _webform_defaults_ssn() {
  return array(
    'name' => '',
    'form_key' => NULL,
    'pid' => 0,
    'weight' => 0,
    'value' => '',
    'mandatory' => 0,
    'extra' => array(
      'disabled' => 0,
      'unique' => 0,
      'title_display' => 0,
      'description' => '',
      'attributes' => array(),
      'private' => FALSE,
      'mask' => 1,
      'ssn' => '',
    ),
  );
}

/**
 * Implements _webform_theme_component().
 */
function _webform_theme_ssn() {
  return array(
    'webform_ssn' => array(
      'arguments' => array('element' => NULL),
      'file' => 'components/ssn.inc',
    ),
    'webform_display_ssn' => array(
      'arguments' => array('element' => NULL),
      'file' => 'components/ssn.inc',
    ),
  );
}

/**
 * Implements _webform_edit_component().
 */
function _webform_edit_ssn($component) {
  $form = array();
  $form['extra']['mask'] = array(
    '#type' => 'checkbox',
    '#title' => t('Mask input values for added security'),
    '#description' => t('Changes the type of this field to password to mask the input. Otherwise normal textfield will be used.'),
    '#return_value' => 1,
    '#default_value' => $component['extra']['mask'],
    '#parents' => array('extra', 'mask'),
  );
  $form['display']['disabled'] = array(
    '#type' => 'checkbox',
    '#title' => t('Disabled'),
    '#return_value' => 1,
    '#description' => t('Make this field non-editable. Useful for setting an unchangeable default value.'),
    '#weight' => 11,
    '#default_value' => $component['extra']['disabled'],
    '#parents' => array('extra', 'disabled'),
  );
  $form['validation']['unique'] = array(
    '#type' => 'checkbox',
    '#title' => t('Unique'),
    '#return_value' => 1,
    '#description' => t('Check that all entered values for this field are unique. The same value is not allowed to be used twice.'),
    '#weight' => 1,
    '#default_value' => $component['extra']['unique'],
    '#parents' => array('extra', 'unique'),
  );

  return $form;
}

/**
 * Implements _webform_render_component().
 */
function _webform_render_ssn($component, $value = NULL, $filter = TRUE) {
  $element = array(
    '#type' => 'webform_ssn',
    '#title' => $filter ? _webform_filter_xss($component['name']) : $component['name'],
    '#title_display' => $component['extra']['title_display'] ? $component['extra']['title_display'] : 'before',
    '#default_value' => $filter ? _webform_filter_values($component['value'], NULL, NULL, NULL, FALSE) : $component['value'],
    '#required' => $component['mandatory'],
    '#weight' => $component['weight'],
    '#description' => $filter ? _webform_filter_descriptions($component['extra']['description']) : $component['extra']['description'],
    '#attributes' => $component['extra']['attributes'],
    '#mask' => $component['extra']['mask'],
    '#process' => array('webform_ssn_field_process'),
    '#theme' => 'webform_ssn',
    '#theme_wrappers' => array('webform_element_wrapper'),
    '#pre_render' => array('webform_element_title_display'),
    '#post_render' => array('webform_element_wrapper'),
    '#element_validate' => array('webform_ssn_field_validate'),
    '#webform_component' => $component,
  );

  if ($component['extra']['disabled']) {
    $element['#attributes']['readonly'] = 'readonly';
  }

  // Enforce uniqueness.
  if ($component['extra']['unique']) {
    $element['#element_validate'][] = 'webform_validate_unique';
  }

  // Set the value from Webform if available.
  if (isset($value[0]) && $value[0] !== '') {
    $element['#default_value'] = $value;
  }

  return $element;
}

/**
 * Implements _webform_display_component().
 */
function _webform_display_ssn($component, $value, $format = 'html') {
  return array(
    '#title' => $component['name'],
    '#weight' => $component['weight'],
    '#theme' => 'webform_display_ssn',
    '#theme_wrappers' => $format == 'html' ? array('webform_element', 'webform_element_wrapper') : array('webform_element_text'),
    '#post_render' => array('webform_element_wrapper'),
    '#format' => $format,
    '#value' => isset($value[0]) ? $value[0] : '',
    '#pre_render' => array('webform_element_title_display'),
    '#webform_component' => $component,
  );
}

/**
 * Theme a webform ssn element.
 */
function theme_webform_ssn($element) {
  // Transfer disabled attribute to individual elements.
  if ($element['#attributes']['readonly'] == 'readonly') {
    $element['ssn3']['#attributes']['readonly'] = 'readonly';
    $element['ssn2']['#attributes']['readonly'] = 'readonly';
    $element['ssn4']['#attributes']['readonly'] = 'readonly';
  }

  // Add error classes to all items within the element.
  if (form_get_error($element)) {
    $element['ssn3']['#attributes']['class'] .= ' error';
    $element['ssn2']['#attributes']['class'] .= ' error';
    $element['ssn4']['#attributes']['class'] .= ' error';
  }

  $output = '<div class="webform-container-inline">';
  $output .= drupal_render($element['ssn3']);
  $output .= drupal_render($element['ssn2']);
  $output .= drupal_render($element['ssn4']);
  $output .= '</div>';

  $element['#type'] = 'element';

  return theme('form_element', $element, $output);
}

/**
 * Format the output of data for this component.
 */
function theme_webform_display_ssn($element) {
  $output = '';

  if (!empty($element['#value'])) {
    $output = webform_ssn_masked_display($element['#value']);
  }

  return $output;
}

/**
 * Masks SSN field values.
 */
function webform_ssn_masked_display($ssn) {
  $output = t('[Corrupted value]');
  if (preg_match('/\d{3}\-\d{2}\-\d{4}/', $ssn)) {
    $output = preg_replace('/\d{3}\-\d{2}/', '***-**', $ssn);
  }
  return $output;
}

/**
 * Process callback for the ssn element.
 */
function webform_ssn_field_process($element) {
  // Accept a string or array value for #default_value.
  if (!empty($element['#default_value']) && is_array($element['#default_value'])) {
    $default_value = explode('-', $element['#default_value'][0]);
    $element['#default_value'] = array(
      'ssn3' => $default_value[0],
      'ssn2' => $default_value[1],
      'ssn4' => $default_value[2],
    );
  }

  // Set defaults according to existing #default_value (set by Form API).
  if (isset($element['#default_value']['ssn3']) || isset($element['#default_value']['ssn2']) || isset($element['#default_value']['ssn4'])) {
    $default_values = array(
      'ssn3' => $element['#default_value']['ssn3'],
      'ssn2' => $element['#default_value']['ssn2'],
      'ssn4' => $element['#default_value']['ssn4'],
    );
  }
  else {
    $default_values = array(
      'ssn3' => NULL,
      'ssn2' => NULL,
      'ssn4' => NULL,
    );
  }

  $element_type = ($element['#mask'] == 1) ? 'password' : 'textfield';

  $element['#tree'] = TRUE;
  $element['ssn3'] = array(
    '#type' => $element_type,
    '#size' => 3,
    '#maxlength' => 3,
    '#default_value' => $default_values['ssn3'],
  );
  $element['ssn2'] = array(
    '#type' => $element_type,
    '#size' => 2,
    '#maxlength' => 2,
    '#default_value' => $default_values['ssn2'],
    '#prefix' => '<span>-</span>',
    '#suffix' => '<span>-</span>',
  );
  $element['ssn4'] = array(
    '#type' => $element_type,
    '#size' => 4,
    '#maxlength' => 4,
    '#default_value' => $default_values['ssn4'],
  );

  return $element;
}

/**
 * Process field validation.
 */
function webform_ssn_field_validate($element, &$form_state) {
  $lengths = array(
    'ssn3' => 3,
    'ssn2' => 2,
    'ssn4' => 4,
  );

  $invalid = 0;

  foreach ($lengths as $member => $length) {
    $regex = '/^\d{' . $length . '}$/';

    if (empty($element['#value'][$member]) && $element['#required']) {
      form_error($element, t('@member field is required', array('@member' => $element['#title'])));
    }

    if (!empty($element['#value'][$member]) && 0 == preg_match($regex, $element['#value'][$member])) {
      $invalid++;
    }
  }

  if ($invalid > 0) {
    form_error($element, t('@member field is invalid', array('@member' => $element['#title'])));
  }
}

/**
 * Implements _webform_submit_component().
 */
function _webform_submit_ssn($component, $value) {
  $ssn_value = '';

  if ($value['ssn3'] && $value['ssn2'] && $value['ssn4']) {
    $ssn_value = $value['ssn3'] . '-' . $value['ssn2'] . '-' . $value['ssn4'];
  }

  return $ssn_value;
}

/**
 * Implements _webform_analysis_component().
 */
function _webform_analysis_ssn($component, $sids = array()) {
  $placeholders = count($sids) ? array_fill(0, count($sids), "'%s'") : array();
  $sidfilter = count($sids) ? " AND sid in (" . implode(",", $placeholders) . ")" : "";
  $query = 'SELECT data FROM {webform_submitted_data} WHERE nid = %d AND cid = %d ' . $sidfilter;
  $nonblanks = 0;
  $submissions = 0;

  $result = db_query($query, array_merge(array($component['nid'], $component['cid']), $sids));
  while ($data = db_fetch_array($result)) {
    if (drupal_strlen(trim($data['data'])) > 0) {
      $nonblanks++;
    }
    $submissions++;
  }

  $rows[0] = array(t('Left Blank'), ($submissions - $nonblanks));
  $rows[1] = array(t('User entered value'), $nonblanks);
  return $rows;
}

/**
 * Implements _webform_table_component().
 */
function _webform_table_ssn($component, $value) {
  return ($value[0]) ? webform_ssn_masked_display($value[0]) : '';
}

/**
 * Implements _webform_csv_headers_component().
 */
function _webform_csv_headers_ssn($component, $export_options) {
  $header = array();
  $header[0] = '';
  $header[1] = '';
  $header[2] = $component['name'];
  return $header;
}

/**
 * Implements _webform_csv_data_component().
 */
function _webform_csv_data_ssn($component, $export_options, $value) {
  return ($value[0]) ? webform_ssn_masked_display($value[0]) : '';
}
