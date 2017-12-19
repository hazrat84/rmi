<?php

ini_set("display_errors", "1");

function get_my_data_groups($uid) {
    $my_data_groups = array();
    $result = db_query("SELECT n.nid, n.title FROM `node` n WHERE n.type = 'webform' ORDER BY n.title ASC ");
    while ($row = db_fetch_object($result)) {
        $data['id'] = $row->nid;
        $data['title'] = $row->title;
        $submission = db_result(db_query("SELECT `sid` FROM datagroup_submissions WHERE uid= $uid and nid=$row->nid "));
        if (!empty($submission)) {
            $data['has_data'] = TRUE;
        } else {
            $data['has_data'] = FALSE;
        }
        $my_data_groups['data']['groups'][] = $data;
    }
    if (!empty($my_data_groups)) {
        $my_data_groups['err'] = FALSE;
        $my_data_groups['err_message'] = "";
    } else {
        $my_data_groups['err'] = TRUE;
        $my_data_groups['err_message'] = "User data not added successfully.";
    }
    return $my_data_groups;
}

function get_data_group_detail($uid, $contact_id, $dId, $sid, $direction) {
    global $base_url;
    $datagroup = array();
    $datagroup['err'] = FALSE;
    $datagroup['err_message'] = "";
    if ($direction == '0') {
        $user = $uid;
    } else {
        $user = $contact_id;
    }
    $result = db_query("SELECT wc.`cid`, wc.`name`, wc.`type`, dsd.data  FROM `datagroup_submitted_data` dsd
                        INNER JOIN `webform_component` wc ON wc.cid= dsd.cid
                        WHERE dsd.uid = $user AND wc.nid = $dId and dsd.sid = $sid ORDER BY  `wc`.`cid` ASC ");
    $fields = array();
    while ($row = db_fetch_object($result)) {
        $data = array();
        $data['label'] = $row->name;

        //if (( $data['label'] == 'Annual salary and wages' || $data['label'] == 'Amount') && !empty($row->data)) {
        if (( $data['label'] == 'Amount') && !empty($row->data)) {
            $data['value'] = "$" . number_format($row->data, 2, '.', ',');
        } else if (($row->type == "date") && !empty($row->data)) {
            $data['value'] = date("m-d-Y", strtotime($row->data));
        } else if (($row->type == "file") && !empty($row->data)) {
            $data['value'] = $base_url . "/view/attachments/" . $row->data . "/" . $dId;
        } else if ($row->type != "file" &&!empty ($row->data) &&  preg_match('/\b(?:(?:https?|ftp):)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i', $row->data) ) {
            $data['value'] = "1".$row->data;
        } else if ($row->name == 'Title' || $row->name == 'title') {
            $data['label']= '';
            $data['value'] = '';
        } else {
            $data['value'] = $row->data;
        }
        if( !empty ($data['label']) ) {
            $fields[] = $data;
        }
    }
    $datagroup["data"]["fields"] = $fields;
    $sub_result = db_query("SELECT ssid, cid, title , nid FROM `sub_datagroup_submissions` WHERE uid = $user  AND nid = $dId AND sid = $sid");
    $sub_data_groups = array();
    $instances = array();
    while ($row = db_fetch_object($sub_result)) {
        $sub_data = array();
        $sub_data['name'] = $row->title;
        $rs = db_query("SELECT wc.name,wc.`type`, sub_data.data FROM sub_datagroup_submitted_data sub_data
                        INNER JOIN `webform_component` wc ON wc.cid= sub_data.cid
                        WHERE ssid = $row->ssid and wc.nid = $row->nid ORDER BY  `wc`.`cid` ASC ");
        $sub_data["instances"] = array();
        $fields = array();
        while ($row1 = db_fetch_object($rs)) {
            $data = array();
            $data['title_flag'] = 0 ;
            $data['label'] = $row1->name;
            if (($data['label'] == 'Loan Amount') && !empty($row1->data)) {
                $data['value'] = "$" . number_format($row1->data, 2, '.', ',');
            } else if ($row1->type == "date" && !empty($row1->data)) {
                $data['value'] = date("m-d-Y", strtotime($row1->data));
            } else if ($row1->type == "file" && !empty($row1->data)) {
                $data['value'] = $base_url . "/view/attachments/" . $row1->data . "/" . $dId;
            } else if(strstr($row1->name, 'title') || strstr($row1->name, 'Title')) {
               if(empty ($row1->data) ) {
                   $data['value'] = $row->title;
               } else {
                   $data['value'] = $row1->data;
               }
                $data['title_flag'] = 1 ;
            } else {
                $data['value'] = $row1->data;
            }
            if(!empty ( $data['label'] ) ) {
                $fields[] = $data;
            }
            //$data['value'] = $row1->data;
        }
        $sub_data['instances'][]['fields'] = $fields;
        $instances[$row->cid][] = $sub_data;
    }
    foreach ($instances as $cid => $instance) {
        $name = "";
        $sub_data_groups = array();
        foreach ($instance as $key => $value) {
            $name = $value["name"];
            $sub_data_groups[] = $value["instances"][0];
        }

        $datagroup["data"]["sub_groups"][] = array("name" => $name, "instances" => $sub_data_groups);
    }
    return $datagroup;
}

function user_service_register($fname, $lname, $email, $password) {
    // Load the required includes for saving profile information
    // with drupal_execute().
//    print $password."<br/>";
//    print $email."<br/>";
    $account = array();
    //$account['name'] = $fname . " " . $lname;
    $account['name'] = strtolower($email);
    $account['pass'] = $password;
    $account['mail'] = strtolower($email);
    $account['profile_first_name'] = strtolower($fname);
    $account['profile_last_name'] = strtolower($lname);
    //$account['roles'] =  'authenticated user';
    module_load_include('inc', 'user', 'user.pages');

    $form_state['values'] = $account;
    $form_state['values']['pass'] = array(
        'pass1' => $account['pass'],
        'pass2' => $account['pass'],
    );
    $form_state['values']['op'] = t('Create new account');
    $params['account'] = $account;
    $ret = drupal_execute('user_register', $form_state);
    $uid = db_result(db_query("SELECT `uid` FROM {users} WHERE `mail` = '%s' ", strtolower($email)));
    if ($uid) {
        drupal_mail("datagroup_services", "user_register_service", $email, user_preferred_language($account), $params);
        /* db_query("INSERT INTO {profile_values} VALUES (%d, %d, '%s')", 1, $uid, $fname );
          db_query("INSERT INTO {profile_values} VALUES (%d, %d, '%s')", 2, $uid, $lname ); */
    }
//  print_r($ret); exit;
///drupal_execute('user_profile_form', $form_state);
    $errors = form_get_errors();
    if ($errors = form_get_errors()) {
        if (preg_match('/is not valid/', $errors['mail'])) {
            $response['err'] = TRUE;
            $response['err_message'] = t(strip_tags($errors['mail']));
            $response['data'] = array();
        } else {
            $response['err'] = TRUE;
            $response['err_message'] = 'Email address has already been used.';
            $response['data'] = array();
        }
        // return services_error(implode("\n", $errors), 401);
    } else {
        $response['err'] = FALSE;
        $response['err_message'] = '';
        $response['data']['uid'] = $form_state['user']->uid;
        $response['data']['mail'] = $form_state['user']->mail;
        //return $form_state['user']->uid;
    }
    return $response;
}

function user_service_forgotpassword($user) {
    $name = trim($user);
    ///// Validate ////////////////////
    // Try to load by email.
    $account = user_load(array('mail' => $name, 'status' => 1));
    if (!$account) {
        // No success, try to load by name.
        $account = user_load(array('name' => $name, 'status' => 1));
    }
    if ($account) {
        // Blocked accounts cannot request a new password,
        // check provided username and email against access rules.
        if (drupal_is_denied('user', $account->name) || drupal_is_denied('mail', $account->mail)) {
            form_set_error('name', t('%name is not allowed to request a new password.', array('%name' => $name)));
            //return $name."is not allowed to request a new password."  ;
            $response['err'] = TRUE;
            $response['err_message'] = 'Email address does not exist.';
            $response['data'] = array();
            return $response;
        }
    }
    if (isset($account->uid)) {
        form_set_value(array('#parents' => array('account')), $account, $form_state);
    } else {
        form_set_error('name', t('Sorry, %name is not recognized as an e-mail address.', array('%name' => $name)));
        //return "Sorry, $name is not recognized as an e-mail address.";
        $response['err'] = TRUE;
        $response['err_message'] = 'Email address does not exist.';
        $response['data'] = array();
        return $response;
    }
    /////// Validate End////////////////
    //$account = $form_state['values']['account'];
    // Mail one time login URL and instructions using current language.
    $account->name = $account->profile_first_name . " " . $account->profile_last_name;
    _user_mail_notify('password_reset', $account, $language);
    watchdog('user', 'Password reset instructions mailed to %name at %email.', array('%name' => $account->name, '%email' => $account->mail));
    drupal_set_message(t('Further instructions have been sent to your e-mail address.'));
    //$form_state['redirect'] = 'user';
    //return "Instructions have been sent to your e-mail address.";
    $response['err'] = FALSE;
    $response['err_message'] = '';
    $response['data']['message'] = t('An email has been sent to your email address with further instructions.');
    return $response;
}

function user_service_change_password($uid, $old_password, $new_password) {
    $response = array();
    $result = db_result(db_query("SELECT 1 FROM {users} WHERE `pass` = '%s' AND uid = %d ", md5($old_password), $uid));
    if ($result) {
        db_query("UPDATE {users} SET `pass` = '%s' WHERE uid = %d ", md5($new_password), $uid);
        $response['err'] = FALSE;
        $response['err_message'] = '';
        $response['data']['message'] = 'Password has been changed successfully.';
    } else {
        $response['err'] = TRUE;
        $response['err_message'] = 'Invalid old password.';
        $response['data']['message'] = array();
    }
    return $response;
}

function get_data_group_instances($uid, $gid) {
    $response = array();
    $response['err'] = FALSE;
    $response['err_message'] = '';
    $data_group_name = db_result(db_query("SELECT `title` FROM {node} WHERE nid = %d", $gid));
     if ($data_group_name == 'Contact Info') {
        $data_title = 'Name';
     } else {
        $data_title = 'Title';
     }
    $rs = db_query("SELECT d.sid, n.title FROM datagroup_submissions d
                    INNER JOIN node n ON n.nid = d.nid
                    WHERE d.uid = %d and d.nid = %d ORDER BY d.submitted", $uid, $gid);
    $i = 1;
    while ($rec = db_fetch_object($rs)) {
        $title = db_result(db_query("SELECT dsdata.data FROM `datagroup_submitted_data` dsdata
                                        INNER JOIN webform_component wc on wc.cid = dsdata.cid
                                        WHERE dsdata.sid = %d AND wc.nid = %d and wc.name = '%s'", $rec->sid , $gid, $data_title ));
        $instances['id'] = $rec->sid;
        $instances['title'] = $title;
        $i++;
        $group_instances[] = $instances;
    }
    $response['data']['group_instances'] = $group_instances;
    return $response;
}

/* function get_contact_list($uid) {
  $response = array();
  $response['error'] = FALSE;
  $response['error_message'] = '';
  $rs = db_query("SELECT s.`contact_uid` , u.name, s.`direction` FROM data_group_sharing s
  INNER JOIN users u ON u.uid = s.contact_uid
  WHERE s.uid = %d ORDER BY s.contact_uid", $uid);
  while ($rec = db_fetch_object($rs)) {
  $contact['contact_uid'] = $rec->contact_uid;
  $contact['contact_title'] = $rec->name;
  $contact['shared_direction'] = $rec->direction;
  $contacts[] = $contact;
  }
  $response['data']['contacts'] = $contacts;
  return $response;
  } */

function get_contact_list($uid) {
    $response = array();
    $response['err'] = FALSE;
    $response['err_message'] = '';
    $rs = db_query('SELECT u.name, contact_uid as contact_shared_with, (select "bidirectional" from data_group_sharing where contact_uid = %d  and uid = contact_shared_with LIMIT 0, 1) as contact_shared_by FROM `data_group_sharing`
inner join users u on u.uid = data_group_sharing.contact_uid
WHERE data_group_sharing.uid = %d
union
select u.name as name, null as contact_shared_with,data_group_sharing.uid as contact_shared_by from data_group_sharing
inner join users u on u.uid = data_group_sharing.uid
where data_group_sharing.contact_uid = %d
order by name asc , contact_shared_with desc', $uid, $uid, $uid);
    $arr = array();
    $contacts = array();
    while ($rec = db_fetch_object($rs)) {
        $contact = array();
        if ($rec->contact_shared_with != NULL) {
            if (!in_array($rec->contact_shared_by, $arr)) {
                $contact['contact_title'] = db_result(db_query('SELECT replace(group_concat(v.value ), ",", " ") as name FROM profile_fields f
                                                                    INNER JOIN profile_values v ON f.fid = v.fid WHERE uid = %d group by uid', $rec->contact_shared_with));
                if ($rec->contact_shared_by == 'bidirectional') {
                    $contact['contact_uid'] = $rec->contact_shared_with;
                    //$contact['contact_title'] = $rec->name;
                    $contact['shared_direction'] = '2';
                } else {
                    $contact['contact_uid'] = $rec->contact_shared_with;
                    //$contact['contact_title'] = $rec->name;
                    $contact['shared_direction'] = '0';
                }
                $arr[] = $rec->contact_shared_with;
            } else {
                continue;
            }
        } else if ($rec->contact_shared_with == NULL) {
            if (!in_array($rec->contact_shared_by, $arr)) {
                $contact['contact_title'] = db_result(db_query('SELECT replace(group_concat(v.value ), ",", " ") as name FROM profile_fields f
                                                                    INNER JOIN profile_values v ON f.fid = v.fid WHERE uid = %d group by uid', $rec->contact_shared_by));
                $contact['contact_uid'] = $rec->contact_shared_by;
                //$contact['contact_title'] = $rec->name;
                $contact['shared_direction'] = '1';
                $arr[] = $rec->contact_shared_by;
            } else {
                continue;
            }
        }

        $contacts[] = $contact;
    }
    $response['data']['contacts'] = $contacts;
    return $response;
}

function get_shared_data_groups_list($uid, $cntId) {
    $response = array();
    $response['err'] = FALSE;
    $response['err_message'] = '';
    $rs = db_query('SELECT s.nid, n.title FROM `data_group_sharing` s
                    INNER JOIN node n ON n.nid = s.nid
                    WHERE s.uid = %d and s.contact_uid = %d', $cntId, $uid);
    while ($rec = db_fetch_object($rs)) {
        $share_with['id'] = $rec->nid;
        $share_with['title'] = $rec->title;
        $submission = db_result(db_query("SELECT `sid` FROM datagroup_submissions WHERE uid= $cntId and nid= $rec->nid "));
        if (!empty($submission)) {
            $share_with['has_data'] = TRUE;
        } else {
            $share_with['has_data'] = FALSE;
        }
        $shared_data[] = $share_with;
    }
    $response['data']['shared_with_me'] = $shared_data;
    $my_rs = db_query('SELECT s.nid, n.title FROM `data_group_sharing` s
                    INNER JOIN node n ON n.nid = s.nid
                    WHERE s.uid = %d and s.contact_uid = %d', $uid, $cntId);
    while ($my_rec = db_fetch_object($my_rs)) {
        $my_share['id'] = $my_rec->nid;
        $my_share['title'] = $my_rec->title;
        $submission = db_result(db_query("SELECT `sid` FROM datagroup_submissions WHERE uid= $uid and nid= $my_rec->nid "));
        if (!empty($submission)) {
            $my_share['has_data'] = TRUE;
        } else {
            $my_share['has_data'] = FALSE;
        }
        $my_shared_data[] = $my_share;
    }
    $response['data']['shared_by_me'] = $my_shared_data;
    return $response;
}

function get_shared_data_group_instances($uid, $contact_uid, $data_id, $direction) {
    $response = array();
    $response['err'] = FALSE;
    $response['err_message'] = '';
    $data_group_name = db_result(db_query("SELECT `title` FROM {node} WHERE nid = %d", $data_id));
     if ($data_group_name == 'Contact Info') {
        $data_title = 'Name';
     } else {
        $data_title = 'Title';
     }
    if ($direction == '0') {
        $rs = db_query("SELECT d.sid, n.title FROM datagroup_submissions d
                    INNER JOIN node n ON n.nid = d.nid
                    WHERE d.uid = %d and d.nid = %d ORDER BY d.submitted", $uid, $data_id);
        $i = 1;
        while ($rec = db_fetch_object($rs)) {
            $title = db_result(db_query("SELECT dsdata.data FROM `datagroup_submitted_data` dsdata
                                        INNER JOIN webform_component wc on wc.cid = dsdata.cid
                                        WHERE dsdata.sid = %d AND wc.nid = %d and wc.name = '%s'", $rec->sid , $data_id, $data_title ));
            $instances['id'] = $rec->sid;
            $instances['title'] = $title;
           // $instances['title'] = $rec->title . " " . $i;
            $i++;
            $group_instances[] = $instances;
        }
    } else {
        $rs = db_query("SELECT d.sid, n.title FROM datagroup_submissions d
                    INNER JOIN node n ON n.nid = d.nid
                    WHERE d.uid = %d and d.nid = %d ORDER BY d.submitted", $contact_uid, $data_id);
        $i = 1;
        while ($rec = db_fetch_object($rs)) {
             $title = db_result(db_query("SELECT dsdata.data FROM `datagroup_submitted_data` dsdata
                                        INNER JOIN webform_component wc on wc.cid = dsdata.cid
                                        WHERE dsdata.sid = %d AND wc.nid = %d and wc.name = '%s'", $rec->sid , $data_id, $data_title ));
            $instances['id'] = $rec->sid;
            $instances['title'] = $title;
            $i++;
            $group_instances[] = $instances;
        }
    }
    $response['data']['group_instances'] = $group_instances;
    return $response;
}

function data_group_unshare($uid, $contact_id, $data_id) {
    $response = array();
    $rs = db_query("DELETE FROM `data_group_sharing` WHERE nid = %d AND contact_uid = %d AND uid = %d ", $data_id, $contact_id, $uid);
    if ($rs) {
        $response['err'] = FALSE;
        $response['err_message'] = '';
        $response['data']['message'] = 'Data group has been unshared successfully.';
    } else {
        $response['err'] = TRUE;
        $response['err_message'] = 'Error Occurred.';
        $response['data'] = array();
    }
    return $response;
}

function searchuser($email) {
    $response = array();
    $rs = db_query("SELECT `uid`, `name`  FROM `users` WHERE `mail` = '%s'", $email);
    $rec = db_fetch_object($rs);
    if ($rec) {
        $response['err'] = FALSE;
        $response['err_message'] = '';
        $member['member_id'] = $rec->uid;
        $member['member_name'] = db_result(db_query('SELECT replace(group_concat(v.value ), ",", " ") as name FROM profile_fields f
                                                                    INNER JOIN profile_values v ON f.fid = v.fid WHERE uid = %d group by uid', $rec->uid));
        //$member['member_name'] = $rec->name;
        $data['member'] = $member;
    } else {
        $response['err'] = TRUE;
        $response['err_message'] = 'Email you entered is not registered with Register My Info.';
        $data = array();
    }
    $response['data'] = $data;
    return $response;
}

function share_data_groups($uid, $contact_uid, $data_ids) {
    $response = array();
    $nids = explode(",", $data_ids);
    foreach ($nids as $value) {
        $rec = db_result(db_query("SELECT 1 FROM `data_group_sharing` WHERE uid = %d AND contact_uid = %d AND nid = %d", $uid, $contact_uid, $value));
        if (empty($rec)) {
            db_query("INSERT INTO `data_group_sharing` 
                      (uid, contact_uid, nid ) VALUES ( %d, %d, %d )", $uid, $contact_uid, $value);
        } else {
            continue;
        }
    }
    $response['err'] = FALSE;
    $response['err_message'] = '';
    $response['data']['member'] = "Data Group(s) shared successfully.";
    return $response;
}

/*
Data Group sharing through QR code RMIV2
*/
function share_data_groups_qr($uid, $contact_uid, $nid, $sids, $fields,$download_time,$share_time) {
    $response = array();
    $sid_arr = explode(',', $sids);
   // echo $uid.'==='.$contact_uid.'==='.$nid.'==='.$sids.'==='.$fields.'==='.$download_time.'==='.$share_time; exit;
    foreach($sid_arr as $item) {
        $sidz[$item] = $item;
    }


    $field_arr = explode(',', $fields);

    foreach($field_arr as $field) {
        $fieldz[$field] = $field;
    }

    // Find Cids
    $rs = db_query("SELECT sid FROM {datagroup_submissions} s
                    INNER JOIN {users} u ON u.uid = s.uid
                    INNER JOIN {node} n ON n.nid = s.nid
                    WHERE s.uid = %d AND s.nid = %d", $contact_uid, $nid);

    if (db_affected_rows()) {
        $cids = array();
    // For already selected data, which will show as selected when the reloads fot the first time
        $que = db_query("SELECT DISTINCT di.sid
                      FROM data_group_shared_instance di 
                      INNER JOIN data_group_sharing ds ON di.shared_id = ds.share_id
                      WHERE ds.uid = %d AND ds.contact_uid = %d AND di.nid = %d", $uid, $contact_uid, $nid);
        while ($sel = db_fetch_array($que)) {
          $selected[] = $sel['sid'];
        }

        while ($row = db_fetch_array($rs)) {
          $sql = db_query("SELECT dsdata.data,dsdata.cid,wc.name as field_name FROM {datagroup_submitted_data} dsdata
                            INNER JOIN webform_component wc on wc.cid = dsdata.cid
                            WHERE dsdata.sid = %d AND wc.nid = %d ", $row['sid'], $nid);

          while ($sub_data = db_fetch_array($sql)) {
            $cids[$row['sid']][] = $sub_data['cid'];
            if ($sub_data['field_name'] === $data_title) {
              $title = $sub_data['data'];
            }
         }
     }
   }

    $insert = db_result(db_query(" SELECT COUNT(share_id) FROM {data_group_sharing} WHERE uid = %d AND contact_uid = %d AND nid = %d AND status = %d ", $uid, $contact_uid, $nid, 1));
    
    if (!$insert) {
    db_query("INSERT INTO {data_group_sharing} (uid, contact_uid, nid, status, shared_fields, download_time, share_time) VALUES (%d, %d, %d, %d, '%s', %d, %d)", $uid, $contact_uid, $nid, 1, serialize($fieldz), $download_time, $share_time);
    $id = db_last_insert_id('data_group_sharing', 'share_id');

    // selected instances in $temp variable
    foreach ($sidz as $index) {
      $exists = db_result(db_query(" SELECT COUNT(id) FROM {data_group_shared_instance} WHERE shared_id = %d AND nid = %d AND sid = %d ", $id, $nid, $index));
      // $cids contains the array of all the instances
      if (!$exists) {
        $c = $cids[$index];
        foreach ($c as $val) {
          db_query("INSERT INTO {data_group_shared_instance} (shared_id, nid, sid, cid) VALUES (%d, %d, %d, %d)", $id, $nid, $index, $val);
          $init = TRUE;
        }
      } else {
        $response['err'] = TRUE;
        $response['err_message'] = 'Warning! already exists';
        $response['data']['member'] = "";
      }
    }
    if ($init) {
      $response['err'] = FALSE;
      $response['err_message'] = '';
      $response['data']['member'] = "Data Group(s) shared successfully.";
    }
  } else {
    $id = db_result(db_query(" SELECT share_id FROM {data_group_sharing} WHERE uid = %d AND contact_uid = %d AND nid = %d AND status = %d ", $uid, $contact_uid, $nid, 1));
    db_query(" UPDATE data_group_sharing SET shared_fields = '%s', download_time = %d, share_time = %d WHERE share_id = %d ", serialize($fieldz), $download_time, $share_time, $id);
    // selected instances in $temp variable
    foreach ($sidz as $index) {
      $exists = db_result(db_query(" SELECT COUNT(id) FROM {data_group_shared_instance} WHERE shared_id = %d AND nid = %d AND sid = %d ", $id, $nid, $index));
      // $cids contains the array of all the instances
      if (!$exists) {
        $c = $cids[$index];
        foreach ($c as $val) {
          db_query("INSERT INTO {data_group_shared_instance} (shared_id, nid, sid, cid) VALUES (%d, %d, %d, %d)", $id, $nid, $index, $val);
          $init = TRUE;
        }
      } else {
        $response['err'] = TRUE;
        $response['err_message'] = 'Warning! already exists';
        $response['data']['member'] = "";
      }
    }
    if ($init) {
      $response['err'] = FALSE;
      $response['err_message'] = '';
      $response['data']['member'] = "Data Group(s) shared successfully.";
    }
  }

    
    
    return $response;
    
}


function custom_user_login($email, $password) {
    $response = array();
    $result = db_query("SELECT uid, mail  FROM {users} WHERE `pass` = '%s' AND mail = '%s' ", md5($password), strtolower($email));
    $row = db_fetch_object($result);
    if (!empty($row)) {
        $response['err'] = FALSE;
        $response['err_message'] = '';
        $response['data']['uid'] = $row->uid;
        $response['data']['mail'] = $row->mail;
    } else {
        $response['err'] = TRUE;
        $response['err_message'] = 'Invalid username or password.';
        $response['data']['uid'] = "";
        $response['data']['mail'] = "";
        //$response['data'] = array();
    }
    return $response;
}

function data_group_share_list($uid, $contact_id) {
    $response = array();
    $result = db_query("SELECT n.nid, n.title FROM `node` n WHERE n.type = 'webform' ORDER BY n.title ASC ");
    while ($row = db_fetch_object($result)) {
        $data['id'] = $row->nid;
        $data['title'] = $row->title;
        $submission = db_result(db_query("SELECT 1 FROM data_group_sharing WHERE uid = $uid AND contact_uid = $contact_id AND nid = $row->nid "));
        if (!empty($submission)) {
            $data['share'] = TRUE;
        } else {
            $data['share'] = FALSE;
        }
        $response['data']['groups'][] = $data;
    }
    if (!empty($response)) {
        $response['err'] = FALSE;
        $response['err_message'] = "";
    } else {
        $response['err'] = TRUE;
        $response['err_message'] = "User data not added successfully.";
    }
    return $response;
}

function datagroup_services_mail($key, &$message, $params) {
    $language = $message['language'];
    $variables = user_mail_tokens($params['account'], $language);
    $variables['!username'] = $params['account']['profile_first_name'] . " " . $params['account']['profile_last_name'];
    switch ($key) {
        case 'user_register_service':
            $message['subject'] = t('Notification from !site', $variables, $language->language);
            $message['body'][] = t("Dear !username\n\nThank you for registering at !site.", $variables, $language->language);
            break;
    }
}

function datagroup_services_mail_alter(&$message) {
    switch ($message['id']) {
        case "datagroup_services_user_register_service":
            $message['headers']['From'] = $message['from'] = 'Register My Info <' . $message['from'] . '>';
            break;
        case "user_password_reset":
            $message['subject'] = "Register My Info - Reset Password";
            $message['headers']['From'] = $message['from'] = 'Register My Info Support <' . $message['from'] . '>';
            break;
    }
}

function register_data_groups_qr($nid,$sid,$owner_uid,$registered_id,$details) {
    print_r($details); exit;
    $sql = "INSERT into {registration} (nid,sid,owner_uid,registered_uid,registration_date,details)
            VALUES (%d,%d,%d,%d,%d,'%s')";
    $result = db_query($sql,$nid,$sid,$owner_uid,$user->uid,time(),serialize($details));
    if(db_affected_rows()){
        $response['err'] = False;
        $response['err_message'] = '';
        $response['data']['member'] = "Registerd Successfully";
    } else{
        $response['err'] = TRUE;
        $response['err_message'] = 'Warning! There is an error while saving the data';
        $response['data']['member'] = "";
    }

    return $response;
}

