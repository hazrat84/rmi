<?php
/**
 * @file
 * Module settings and configuration administration UI.
 */

/**
 * Form definition; admin settings.
 */
function restaurant_management_admin_settings() {
  $form['settings'] = array(
          '#type' => 'fieldset', 
          '#title' => t('Settings'), 
          '#collapsible' => True, 
          '#collapsed' => FALSE,
         );

        $form['settings']['product_id'] = array(
          '#type' => 'textfield',
          '#default_value' => variable_get('product_id',41),
          '#title' => 'Product id',
        );

        $form['settings']['rest_id'] = array(
          '#type' => 'textfield',
          '#default_value' => variable_get('rest_id',33),
          '#title' => 'Restaurant id',
        );

        $form['settings']['implant_id'] = array(
          '#type' => 'textfield',
          '#default_value' => variable_get('implant_id',34),
          '#title' => 'Implant Id',
        );
         $form['settings']['submit'] = array(
          '#type' => 'submit',
          '#value' => t('Save settings'),
        );
        return $form;
  //return system_settings_form($form);
}

function restaurant_management_admin_settings_submit(&$form,$form_state){
  
  $values = $form_state['values'];
  variable_set('rest_id',$values['rest_id']);
  variable_set('implant_id',$values['implant_id']);
  variable_set('product_id',$values['product_id']);


}

function restaurant_management_admin_settings_validate(&$form,$form_state) {
   $values = $form_state['values'];
  if (!is_numeric($values['rest_id'])) {
    form_set_error("rest_id", 'Restaurent Id should be numeric');
  }
  if (!is_numeric($values['implant_id'])) {
    form_set_error("rest_id", 'Restaurent Id should be numeric');
  }
  if (!is_numeric($values['product_id'])) {
    form_set_error("rest_id", 'Restaurent Id should be numeric');
  }
}