$(document).ready(function(){
	
	$('.export_link').click(function(){
		//display social media
		var elem = $(this).attr('href');
		$clicked = $(this);
		$.confirm({
			'title'		: 'File Download',
			'message'	: 'Do you want to download it in CSV format?',
			'buttons'	: {
				'Save'	: {
					'class'	: 'blue',
					'action': function(){
						// Call ajax function
						window.location.href = elem;
					}
				},
				'Cancel'	: {
					'class'	: 'gray',
					'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
				}
			}
		});
		return false;
		
	});

	});
	