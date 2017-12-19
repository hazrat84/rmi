
/**
 * JS for select box.
 */
$(document).ready(function(){

		if (!$.browser.opera) {
			// select element styling
			$('select.select').each(function(){
				var title = $(this).attr('title');
				if( $('option:selected', this).val() != ''  ) title = $('option:selected',this).text();
				$(this)
					.css({'z-index':10,'opacity':0,'-khtml-appearance':'none'})
					.after('<span class="select">' + title + '</span>')
					.change(function(){
						val = $('option:selected',this).text();
						$(this).next().text(val);
						})
			});

		};

                                var clearMePrevious = '';

                                // clear input on focus
                                $('.form-text').focus(function()
                                {  
                                        clearMePrevious = $(this).val();
                                        $(this).val('');
                                });

                                // if field is empty afterward, add text again
                                $('.form-text').blur(function()
                                {
                                    if($(this).val()=='')
                                    {
                                        $(this).val(clearMePrevious);
                                    }
                                });

	});