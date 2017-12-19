$(document).ready(function(){
	
	$('.register_link').click(function(){
		//display social media
		stLight.options({publisher: "ur-7094761-e3fd-ac3b-3b3b-103bf34582d3", doNotHash: false, doNotCopy: false, hashAddressBar: false});
		var elem = $(this).attr('href');
		$clicked = $(this);
		$.confirm({
			'title'		: 'Registration Confirmation',
			'message'	: 'You are about to register for this restaurant <br />You will receive notification on it. Continue?',
			'buttons'	: {
				'Yes'	: {
					'class'	: 'blue',
					'action': function(){
						// Call ajax function
						$.ajax({
					        url: elem,
					        type: "POST",
					        data: {
					            // data stuff here
					        },
					        success: function (data) {
					            if(data != 1){
					            	 $clicked.hide(500, function () {
                        				$("#"+data).show(500);
                    				});

					            }
					        }
					    });
					}
				},
				'No'	: {
					'class'	: 'gray',
					'action': function(){}	// Nothing to do in this case. You can as well omit the action property.
				}
			}
		});
		return false;
		
	});

	});
	


