DESCRIPTION
-----------
A webform component for Social Security Numbers.

The module adds a new component to Webform components list which provides an
option to define SSN (Social Security Number).

The default setting masks the entries, like password fields. It could be
changed in component settings page to have plain text fields instead.

Due to confidentiality of Social Security Numbers, SSN field value is masked
every time it is displayed, including results table and download.
i.e. ***-**-1234

It is highly recommended to install Webform Encrypt and enable it for all the
SSN fields to keep SSN field values encrypted in the database.

It is also recommended to enable "Private" checkbox at the component settings
page and assign only the necessary roles to view the results.



REQUIREMENTS
------------
* Webform 6.x-3.x http://drupal.org/project/webform



RECOMMENDED
-----------
* Webform Encrypt http://drupal.org/project/webform_encrypt



INSTALLATION
------------
* Copy Webform SSN module to your site's module directory and enable it.
* For more help installing modules, see <http://drupal.org/node/70151>.



AUTHOR
------
Osman Gormus <osman@project6.com>
http://drupal.org/user/70527
Project6 Design, Inc.
