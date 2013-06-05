//declare variables

var id = [];
var url = [];
var title = [];
var category = [];
var skills = [];
var screenshot = [];
var description = [];
var link = [];
var colors = Array("#28B49D","#199DAF","#2986CF","#38A51D","#16BEA3","#B13232");
var colorhover = Array("#33EECF","#1CC4DB","#2DBBD6","#5EE73C","#27DDC0","#E63C3C");
var total = null;


//get data from xml
$(document).ready(function(){
    		$.ajax({
    			type: "GET",
    			url: "http://poc.mwc.ms/Style Library/Concept2/pages/info1.xml",
    			dataType: "xml",
    			cache: false,
						success: homeXML,
				});
				
				
});			

//xml found? then store the data and display
function homeXML(xml)
{	
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
		
		$(".work").hide().append('<a href="#" id="'+id[index]+'" class="getinfo"><div class="link" style="background-color:'+colors[index]+';"><span>'+title[index]+'</span></div></a>').fadeIn("slow");
		
	//generate box hover colors in accordance to the set index above; for actual release would need to randomly generate the colors (should be a function)
		$(".link").each(function(){
			$(this).hover(function(){
				var boxcode;
				boxcode = $(this).parent().attr("id") - 1;
				$(this).css("background-color",colorhover[boxcode]);
			},function(){
				var boxcode;
				boxcode = $(this).parent().attr("id") - 1;
				$(this).css("background-color",colors[boxcode]);
			});
		});		
	});
}

	//get info click
	$('.getinfo').live("click",function(){
	$(this).children().hide("explode", 1000);
		var buttonid=$(this).attr("id");
		var bg = buttonid - 1;
		
     	for(i=0;i<total;i++){		
			if(buttonid == id[i]){
				$("#infocontent").hide().html('<div class="lcol" id="'+bg+'"><h4>'+title[i]+'</h4><img src="/Style%20Library/Concept/i/titleline.png"/><br/><span>'+category[i]+'</span><span>'+skills[i]+'</span><br/><p>'+description[i]+'</p><a href="'+link[i]+'"class="visit">Visit</a></div><div class="rcol"><img src="'+screenshot[i]+'"/></div>').fadeIn("slow");
				$(".work").fadeOut(1000);
				$(".about").fadeOut(1000);
			}
		}
	
	$("#loading").slideDown(3000).delay(2000).slideUp(1500);
	$("#infopage").delay(2000).fadeIn(2000);
	$("#infopage").css("background-color",colors[bg]).css("margin-top","-200px");
	$("#allwrap").scrollTo("#infopage",5000);
});
	
	//back button	
	$('.back').live("click",function(){
		
	$("#infopage").slideUp(1500).delay(2000);
			
		$(".work").delay(2000).fadeIn("slow");
		$(".work").children().children().delay(2000).fadeIn("slow");
		$(".about").delay(2000).fadeIn("slow");

	
	});

	
	