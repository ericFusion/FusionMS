var id = [];
var url = [];
var title = [];
var category = [];
var skills = [];
var screenshot = [];
var description = [];
var link = [];
var total = null;

$(document).ready(function(){
	
	$('<img src="/Style Library/Concept/i/titleline.png" alt="Border" style="display:block;"/>').insertAfter('#WebPartctl00_ctl27_g_40c0c319_cc8a_4e66_9b91_064d910820b3 h2');
    	$("#row2").html('<div class="loading"><img src="http://poc.mwc.ms/Style%20Library/Concept/i/ajax-loader.gif" alt="Loading..."/></div>');
    		$.ajax({
    			type: "GET",
    			url: "http://poc.mwc.ms/Style Library/Concept/pages/info1.xml",
    			dataType: "xml",
    			cache: false,
    				beforeSend:function(){
						$("#row2").html('<div class="loading"><img src="http://poc.mwc.ms/Style%20Library/Concept/i/ajax-loader.gif" alt="Loading..."/></div>');
					},
						success: homeXML,
							error:function()
							{
								$("#row2").html('<p class="error"><strong>Opps!</strong><br/> Try again in a little while.</p>');	
							}
			});
});			

function homeXML(xml)
{	
	$("#row2").empty();
	
	//get buttons
	$(xml).find("link").each(function(index)
	{
		id[index] = $(this).find('id').text();
		url[index] = $(this).find('button').text();
		title[index] = $(this).find('title').text();
		category[index] = $(this).find('category').text();
		skills[index] = $(this).find('skills').text();
		screenshot[index] = $(this).find('screenshot').text();
		description[index] = $(this).find('description').text();
		link[index] = $(this).find('more').text();
		total = total +1;
		
		$("#row2").hide().append('<div class="link"><a href="#" id="'+id[index]+'" class="getinfo"><img src="'+url[index]+'"></a></div>').fadeIn("slow");
	});
}

	//get info click
	$('.getinfo').live("click",function(){
		var buttonid=$(this).attr("id");
     	for(i=0;i<total;i++){		
			if(buttonid == id[i]){		
				$("#row2").hide().html('<div class="lcol"><h4>'+title[i]+'</h4><img src="/Style%20Library/Concept/i/titleline.png"/><br/><span>'+category[i]+'</span><span>'+skills[i]+'</span><br/><p>'+description[i]+'</p><a href="'+link[i]+'"class="visit">Visit</a><a href="#" class="back">Back</a></div><div class="rcol"><img src="'+screenshot[i]+'"/></div>').fadeIn("slow");
				$("#row1").fadeOut("slow").addClass("hide").hide();	
			}
		}	
	});
	
	//back button	
	$('.back').live("click",function(){
		$("#row1").fadeIn("slow").removeClass("hide");
		$("#row2").empty();
			for(i=0;i<total;i++){
				$("#row2").hide().append('<div class="link"><a href="#" id="'+id[i]+'" class="getinfo"><img src="'+url[i]+'"></a></div>').fadeIn("slow");

			}		
	});

	
	