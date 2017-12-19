Change password module
============================

Drupal Project Page : http://drupal.org/project/chgpwdt

This simple module move the change password functionality to a new tab of account edit page.

Hooks
============================

chgpwd_element_excludes_alter(&$elements);
	where $elements is the array
	
	use this hooks in your module if you want to leave any elements of 
	user_profile_form in change password page or to hide any elements from account edit page.

for example, 

1. you have a element named "my_field_pass" in user_profile_form 
which needs to be displayed along with change password page and hide from account edit page.

<?php

example_chgpwd_element_excludes_alter(&$elements) {
	$elements['chgpwd'] = 'my_field_pass';
	$elements['account'] = 'my_field_pass';
}


?>

Sponsored by
============================
	Vinoth Kanyakumari <vinoth.3v@gmail.com>
	Tamil Nanbargal http://tamilnanbargal.com

	
