/*FusionMS homepage jQuery functions
by: Eric Barber
Future improvements - convert global variables and slider functions to their own namespace and objects. Not really needed, but if the company began 
adding many different plugins and whatnot that would future proof this plugin. Also of note, boxes and screenshots could be seperated, but for now, 
all site JS that has been custom written will be stored here.
*/
$(document).ready(function()
{
	
		/*Global variables needed for slider*/
		maxMargin = 0;
	 	currentMargin = 0;
		totalSlides = 0;
		slideWidth = 0;
		slideIndex = 0; /*Added for responsive design.*/
		totalIndex = 0;
		reverse = 0; 
		reverseOn = 1; /*Setting the reverse function up, if flag is off slider will not navigate 'round-robin'*/
		userScroll = false; /*Test for user hovering over slider.*/
		
		/*Begin slider functions*/
		initSlider(); /*Get total # of slides (divs named as #slide1,#slide2; not slider container or content.*/
		activateSlider(); /*Begin slider*/
		manualSlide(); /*For manual button navigation; remove if unneeded. Really wouldn't run unless there was code in the function, anyhow, 
		but we like optimization.*/
		buttonSlide(); /*For manual button navigation via slide bar on the bottom of slide.*/
		
		/*Checking if user scrolls over slider to deactivate sliding.*/
		$('#slidercontainer').hover(
 		 function () {
   			 userScroll = true; /*On hover.*/
 		 }, 
		 function () {
    		 userScroll = false; /*On hover out.*/
    		 deactivateSlider(); /*Clear the interval*/
    		 activateSlider(); /*Restart slider.*/
  		 }
		);
		
		/*On window resize reset slider.*/		
		$(window).resize(function() {
		maxMargin = 0; /*Sets maximum margin to 0; not needed initially but will be needed as slider is resized and width changes.*/
		totalSlides = 0; /*Sets the total slides to 0 if it is not already.*/
		slideWidth = 0; /*Sets the slide width to 0 for reassignment.*/
		deactivateSlider(); /*Clear the interval.*/
        updateSlider();	
  		});    
  		
		metroBoxes(); /*Windows 8 inspired content boxes; will need future modificatons for content and responsiveness.*/
		portfolioScreenshots(); /*Randomly pick a set of screenshots to display in portfolio content editor on homepage. Already responsive.*/

 });
 
 
function initSlider()
{
	slideWidth = ($('.slide1').width()); /*Since this specific slider uses slides that all have the same width, just grab any slides width. To modify this 
	to support different sized slides you would have to write or modify a .each to correctly add widths for margin calculation. Local variable.*/	
	
			$('div[class^="slide"]').each(function() {
  					totalSlides++; /*For each div that contains 'slide' add one to total counter*/
  				if(($(this).attr('class') == 'slidercontainer') || ($(this).attr('class') == 'slidercontent'))
  					{
  						totalSlides--; /*If this specific div is the container or the content container subtract from total counter since it was 
  						incremented regardless. Workaround since != apparently doesn't work in this situation.*/
  					} 
			});	
				
	maxMargin = -(slideWidth * (totalSlides-1)); /*Compensate the fact the first slide starts at a margin of 0px, 
	for example, 5 slides each at 300 px would have a total width of 1500px however since the first slide begins at 0px we 
	must subtract that width from the total margin to correctly navigate and test to loop the animation. This value is 
	negative because we are moving through the slider content by using the left margin.*/
	totalIndex = Math.abs(maxMargin/slideWidth); /*Figures out how many total slides there are via index for responsive + manual navigation.*/
	$('.navbutton.slide1').addClass('navbuttonselect'); /*First slide is marked as the current slide with button navigation.*/
} 

function updateSlider()
{
		initSlider(); /*Resetup slider*/
		currentMargin = 0;	/*Gets the current margin of the slide index times the new slide width and then animates it correctly.*/
		  $('#slidercontent').animate({
             marginLeft:  currentMargin + "px"
	      });
	    deactivateSlider(); /*Clear the interval.*/
	    if(currentMargin == -(slideWidth*1)){
     		slideIndex = 1;
      		$('.navbutton').removeClass('navbuttonselect');
      		$('.navbutton.slide2').addClass('navbuttonselect');
      		}else if(currentMargin == -(slideWidth*2)){
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 2;
      		$('.navbutton.slide3').addClass('navbuttonselect');
      		}else if(currentMargin == -(slideWidth*3)){
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 3;
      		$('.navbutton.slide4').addClass('navbuttonselect');
      		}else if(currentMargin == -(slideWidth*4)){
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 4;
      		$('.navbutton.slide5').addClass('navbuttonselect');
      		}else{
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 0;
      		$('.navbutton.slide1').addClass('navbuttonselect');
      		}

		activateSlider(); /*Begin anew.*/
		
}

function activateSlider()
{
		scrollTime = setInterval(autoSlide, 3500); /*Begin sliding every 3500 milliseconds.*/
}

function deactivateSlider()
{
        clearInterval(scrollTime); /*Stop the interval sliding.*/
} 	
	
function autoSlide()
{
	    if (userScroll){
            deactivateSlider(); /*If user is hovering over slider stop the slider. Will have to check if the slider has finished animating to the proper margin.*/
        } else {
            moveSlider(); /*If user is not hovering then slide on.*/
        }
}

function moveSlider()
{
	
	 if(reverseOn == 1){
	 if(!reverse){ /*Check if the reverse flag is set, if it is not slide normally; if it is slide back.If you want the final slide to revert back 
	 to the first slide remove the occurances and tests for reverse.*/
	  currentMargin -= slideWidth;	/*Adds the slide width to the current margin that will be animated to.*/
	 }else{
	 currentMargin +=slideWidth;
	 }
	 if (currentMargin == maxMargin){ /*If you are currently on the last slide. Slide in reverse.*/
     reverse = 1;
     }else if(currentMargin == 0){/*If you are on the first slide you don't want to slide in reverse.*/
     reverse = 0;
     } 
     if (currentMargin > 0){ /*If the next slide is out of bounds previous to slide 1 or is calculated incorrectly set to the negative value to properly 
     traverse (we are navigating through the slides via negative margin values.*/
     currentMargin = -(currentMargin);
     }
     }else{
     	currentMargin -= slideWidth;
     }
	
	 
	  if (currentMargin < maxMargin){ /*If the next slide is out of bounds, reset.*/
            currentMargin = 0; /*If the current incremented margin goes beyond the last slide return to the first slide.*/
            slideIndex = 0; /*Index of first slide.*/
      }
      
	  /*Animates to the new current margin.*/
	  $('#slidercontent').animate({
             marginLeft: currentMargin + "px"
      		
      });
      		/*Following is for button navigation*/
     		if(currentMargin == -(slideWidth*1)){
     		slideIndex = 1;
      		$('.navbutton').removeClass('navbuttonselect');
      		$('.navbutton.slide2').addClass('navbuttonselect');
      		}else if(currentMargin == -(slideWidth*2)){
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 2;
      		$('.navbutton.slide3').addClass('navbuttonselect');
      		}else if(currentMargin == -(slideWidth*3)){
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 3;
      		$('.navbutton.slide4').addClass('navbuttonselect');
      		}else if(currentMargin == -(slideWidth*4)){
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 4;
      		$('.navbutton.slide5').addClass('navbuttonselect');
      		}else{
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 0;
      		$('.navbutton.slide1').addClass('navbuttonselect');
      		}
}

//Manual sliding could be more dynamic using total index and for statements; hardcoded to the slides as of now (usecase: what if you want user to slide 
//through two slides, stop, then only advance through a named arrow? Etc.) Unmodified due to not needing extensive use from this plugin. 
//Another example - if users can slide to any slide from the first slide (1 to 2/3/4, etc). Too many variables to handle dynamically
//As it stands, for any anchors you wish to navigate the slides with their class should be .arrow (this can be further modified if you'd like.)
//To navigate to specific slides use the name attribute in the anchor tag; e.g. name="slide1" navigates to slide 2
//The manual variable is used to calculate the margin, take the slideWidth and times it by the index value of the requested slide you are navigating to.
//For example, if you want to navigate to slide 5 you should set manual to slideWidth * 4 under case 'slide4'.
//Don't want to manually slide? Just remove this and specifically any .arrow anchors you would be using to navigate through the slides.
function manualSlide(){
	$('.arrow').click(function(){
 		var name = $(this).attr('name');
 		 		switch(name){ 				
 				case 'slide1':
 				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide2').addClass('navbuttonselect');
 				manual = slideWidth;
				$('#slidercontent').animate( {marginLeft: -manual});
 				if(!($(this).hasClass('back'))){ /*This block of code is used to caluclate the margin if the navigation is moving forward. We subtract the current margin because that is
 				what would happened if the slider was traversing automatically. When going backwards we do the opposite to 'undo' the traverse operation.*/
				currentMargin -= slideWidth; /*Either adds/subtracts to the current margin to correctly animate to the requested slide.*/
				slideIndex++; /*Keeps track of the index for resizing purposes*/
				}	
				if($(this).hasClass('back')){/*This block of code is used to calculate the difference between margins when navigate backwards. 
				For example, if you were to navigate backwards the cycle would still process and therefore add the next slide's margin to the 
				current margin; when you hover off the slider would scroll to 2 slides away instead of only 1.*/
				currentMargin += slideWidth;
				slideIndex--;
				}
				break;
 				;
 				case 'slide2':
 				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide3').addClass('navbuttonselect');
 				manual = slideWidth*2;
 				$('#slidercontent').animate( {marginLeft: -manual});
 				if(!($(this).hasClass('back'))){
				currentMargin -= slideWidth;
				slideIndex++;
				}	
				if($(this).hasClass('back')){
				currentMargin += slideWidth;
				slideIndex--;
				}
 				break;
 				;
 				case 'slide3':
 				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide4').addClass('navbuttonselect');
 				manual = slideWidth*3;
 				$('#slidercontent').animate( {marginLeft: -manual});
 				if(!($(this).hasClass('back'))){
				currentMargin -= slideWidth;
				slideIndex++;
				}	
				if($(this).hasClass('back')){
				currentMargin += slideWidth;
				slideIndex--;
				}
 				break;
 				;
 				case 'slide4':
 				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide5').addClass('navbuttonselect'); 				
 				manual = slideWidth*4;
				$('#slidercontent').animate( {marginLeft: -manual});
 				if(!($(this).hasClass('back'))){
				currentMargin -= slideWidth;
				slideIndex++;
				}	
 				if($(this).hasClass('back')){
				currentMargin += slideWidth;
				slideIndex--;
				} 	
 				break;
 				;
 				case 'slide5':
 				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide1').addClass('navbuttonselect');
 				manual = 0;
 				$('#slidercontent').animate( {marginLeft: manual});
 				if(!($(this).hasClass('back'))){
				currentMargin -= slideWidth;
				slideIndex++;
				}	
				if($(this).hasClass('back')){
				currentMargin += slideWidth;
				slideIndex--;
				}
 				break;
 				;
 				}
 		});
}

/*Work in Progress*/
function buttonSlide(){
	$('.navbutton').click(function(){
 		var name = $(this).attr('name');
 		 		switch(name){ 				
 				case 'slide2':
 				manual = slideWidth;
				$('#slidercontent').animate( {marginLeft: -manual});
				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide2').addClass('navbuttonselect');
				currentMargin = -manual;
				slideIndex = 1;
				reverse = 0;
				deactivateSlider();
				break;
 				;
 				case 'slide3':
 				manual = slideWidth*2;
 				$('#slidercontent').animate( {marginLeft: -manual});
 				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide3').addClass('navbuttonselect');
				currentMargin = -manual;
				slideIndex = 2;
				reverse = 0;
				deactivateSlider();				
 				break;
 				;
 				case 'slide4':
 				manual = slideWidth*3;
 				$('#slidercontent').animate( {marginLeft: -manual});
				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide4').addClass('navbuttonselect');
				currentMargin = -manual;
				slideIndex = 3;
  				reverse = 0;
				deactivateSlider();		
 				break;
 				;
 				case 'slide5':
 				manual = slideWidth*4;
				$('#slidercontent').animate( {marginLeft: -manual});
				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide5').addClass('navbuttonselect');
				currentMargin = -manual;
				slideIndex = 4;
				reverse = 1;
				deactivateSlider();		
 				break;
 				;
 				case 'slide1':
 				manual = 0;
 				$('#slidercontent').animate( {marginLeft: manual});
				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide1').addClass('navbuttonselect');
				currentMargin = -manual;
				slideIndex = 0;
 				reverse = 0;
				deactivateSlider();		
 				break;
 				;
 				}
 		activateSlider();
 		});
 }

function portfolioScreenshots()
{
	var random = Math.floor(Math.random()*'4'); /*Generate a random number from 0 to 3.*/	
		/*Should be optimized as a switch possibly. Future content will dictate what happens in this function.*/
		 if(random==0){
		 $(".portfoliocontent").html('<a href="#" class="work1" id="work1"></a>');
		 }
		 if(random==1){
		 $(".portfoliocontent").html('<a href="#" class="work2" id="work2"></a>');
		 }
		 if(random==2){
		 $(".portfoliocontent").html('<a href="#" class="work1" id="work1"></a>');
		 }
		 if(random==3){
		 $(".portfoliocontent").html('<a href="#" class="work2" id="work2"></a>');
		 }
}

function metroBoxes()
{
 	$(".box").hover(	  
			function () {
	 		 	var slide = $(this).parent().parent().parent().attr('id'); /*Depends on the slide how each box will behave because each slide has a different layout. 
	 		 	Future content will dictate. Comments will be added as content is finalized.*/
	 		 
	 		 		/*Switch should take advantage of totalSlides variable from slider since it is a global variable.*/
	 		 		switch(slide){
						case 'slide1':
						$(this).children('.hover').animate({marginTop:'0%'}); 	
						$(this).click(function() {
    					window.location = "#";
    					});
    					$(this).css('cursor','pointer');
						break;
						;
						
					    case 'slide2':
						$(this).click(function() {
    					window.location = "#";
    					});
    					$(this).css('cursor','pointer');
						break;
						;
		
						case 'slide3':
						$(this).children('.hover').delay(250).animate({marginTop:'0%'}); 	
						break;
						;
						
						case 'slide4':
						$(this).children('.hover').animate({marginTop:'75%'}); 	
						$(this).click(function() {
    					window.location = "#";
    					});
    					$(this).css('cursor','pointer');
						break;
						;
		
						case 'slide5':
						$(this).children('.hover').delay(250).animate({marginTop:'0%'}); 	
						break;
						;
				 }	
       }, 
	  function () {
	  var slide = $(this).parent().parent().parent().attr('id'); /*Depends on the slide how each box will behave because each slide has a different layout.*/
	 		 	
	  switch(slide){
						case 'slide1':
						$(this).children('.hover').animate({marginTop:'-100%'});
						break;
						;
						case 'slide4':
						$(this).children('.hover').animate({marginTop:'100%'});
						break;
						;
	  }
	   
		 }
	);			 
}