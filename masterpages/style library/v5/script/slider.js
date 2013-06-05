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
		cloned = 0;
		resize = false;
		userScroll = false; /*Test for user hovering over slider.*/
		
		/*Begin slider functions*/
		initSlider(); /*Get total # of slides (divs named as #slide1,#slide2; not slider container or content.*/
		activateSlider(); /*Begin slider*/
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
		resize = true;
		deactivateSlider(); /*Clear the interval.*/
		removeClone();
        updateSlider();	
       
  		});    
  		

 });
 
 
function initSlider()
{
	cloned = 0;
	slideWidth = ($('.slide1').width()); /*Since this specific slider uses slides that all have the same width, just grab any slides width. To modify this 
	to support different sized slides you would have to write or modify a .each to correctly add widths for margin calculation. Local variable.*/	
	
			$('#slidercontainer #slidercontent div[class^="slide"]').each(function() {
  					totalSlides++; /*For each div that contains 'slide' add one to total counter*/
  				if(($(this).attr('class') == 'slide1content') || ($(this).attr('class') == 'slide2content') || ($(this).attr('class') == 'slide3content')|| ($(this).attr('class') == 'slide4content'))
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

function removeClone(){
		if($("#slidercontainer #slidercontent .slide1").eq(1)){
		$("#slidercontainer #slidercontent .slide1").eq(1).remove();  /*Remove the first slides that were ORIGINALLY cloned, e.g. we don't want to keep creating copies and copies with no data collection.*/
		$("#slidercontainer #slidercontent .slide2").eq(1).remove();  /*Not very intuitive currently*/
		$("#slidercontainer #slidercontent .slide3").eq(1).remove();  
		$("#slidercontainer #slidercontent .slide4").eq(1).remove();  
		$("#slidercontent").css('width','400%'); /*Double width of the 4 slides*/
		$('#slidercontainer #slidercontent div[class^="slide"]').each(function() {
		$(this).css('width','25%'); /*Clones each slide, updates correct width*/
		});
		}
}

function updateSlider()
{		
		
		initSlider(); /*Resetup slider*/
	      
	    deactivateSlider(); /*Clear the interval.*/

      		
      		if(slideIndex == 1 && resize == true){
		resize = false;
		currentMargin = -(slideWidth*1);
		console.log("slide 1 resized.");
		}else if(slideIndex == 2 && resize == true){
		resize = false;
		currentMarign = -(slideWidth*2);
		}else if(slideIndex = 3 && resize == true){
		resize = false;
		currentMargin = -(slideWidth*3);
		}else if(slideIndex == 0 && resize == true){
		currentMargin = 0;
		resize = false;
		} 
		

			if(currentMargin == -(slideWidth*1) || currentMargin == -(slideWidth*5)){
			     		if(cloned == 0){
      		cloned = 1;
      		cloneSlider();
      		}

     		slideIndex = 1;
      		$('.navbutton').removeClass('navbuttonselect');
      		$('.navbutton.slide2').addClass('navbuttonselect');
      		}else if(currentMargin == -(slideWidth*2)|| currentMargin == -(slideWidth*6)){
      		if(cloned == 0){
      		cloned = 1;
      		cloneSlider();
      		}

      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 2;
      		$('.navbutton.slide3').addClass('navbuttonselect');
      		}else if(currentMargin == -(slideWidth*3)|| currentMargin == -(slideWidth*7)){
      		if(cloned == 0){
      		cloned = 1;
      		cloneSlider();
      		}
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 3;
      		$('.navbutton.slide4').addClass('navbuttonselect');
         	}else if(currentMargin == -(slideWidth*5)){
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 0;
      		$('.navbutton.slide1').addClass('navbuttonselect');
      		}
      		else{
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 0;
      		$('.navbutton.slide1').addClass('navbuttonselect');
      		}
				
		  $('#slidercontent').animate({
             marginLeft:  currentMargin + "px"
	      });



		activateSlider(); /*Begin anew.*/
		/*if(slideIndex = 3){
		cloneSlider();
		}
		*/
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

function cloneSlider(){
			cloned = 1;
			$("#slidercontent").css('width','800%'); /*Double width of the 4 slides*/
			$('#slidercontainer #slidercontent div[class^="slide"]').each(function() {
      		$(this).css('width','12.5%'); /*Clones each slide, updates correct width*/
            $(this).clone().appendTo("#slidercontent");  	 
	      	 });
}

function moveSlider()
{
	currentMargin -= slideWidth;
	
	  if (currentMargin == maxMargin){ /*If the next slide is out of bounds clone container for carousel.*/
            slideIndex = 0; /*Index of first slide.*/
    		cloneSlider();	 
	      	
	      	 }
	      	 
         
       if(currentMargin < (maxMargin*2)){
			if(($('#slidercontent').is(':animated') == false) && (slideIndex == 3)){
			 $('#slidercontent').css('margin-left',maxMargin);
			 currentMargin = maxMargin;
			 currentMargin -= slideWidth;
			}
  
		$(".slide1").eq(0).remove();  
		$(".slide2").eq(0).remove();  
		$(".slide3").eq(0).remove();  
		$(".slide4").eq(0).remove();   
		$('#slidercontainer #slidercontent div[class^="slide"]').each(function() {
      		$(this).css('width','12.5%');
            $(this).clone().appendTo("#slidercontent");  	 
            cloned = 1;
	      	 });

       }
             
     	  /*Animates to the new current margin.*/
	  $('#slidercontent').animate({
             marginLeft: currentMargin + "px"
      });
         
		/*Following is for button navigation*/
     		if(currentMargin == -(slideWidth*1) || currentMargin == -(slideWidth*5)){
     		slideIndex = 1;
      		$('.navbutton').removeClass('navbuttonselect');
      		$('.navbutton.slide2').addClass('navbuttonselect');
      		}else if(currentMargin == -(slideWidth*2)|| currentMargin == -(slideWidth*6)){
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 2;
      		$('.navbutton.slide3').addClass('navbuttonselect');
      		}else if(currentMargin == -(slideWidth*3)|| currentMargin == -(slideWidth*7)){
      		cloned = 1;
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 3;
      		$('.navbutton.slide4').addClass('navbuttonselect');
         	}else if(currentMargin == -(slideWidth*5)){
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 0;
      		$('.navbutton.slide1').addClass('navbuttonselect');
      		}
      		else{
      		$('.navbutton').removeClass('navbuttonselect');
			slideIndex = 0;
      		$('.navbutton.slide1').addClass('navbuttonselect');
      		}
}

/*Work in Progress*/
function buttonSlide(){
	$('.navbutton').click(function(){
 		var name = $(this).attr('name');
 		 		switch(name){ 
 		 		case 'slide1':
 				manual = 0;
 				manualClone = maxMargin - (slideWidth * 1);
 				if(cloned == 0){
 				$('#slidercontent').animate( {marginLeft: manual});
 				currentMargin = -manual;
 				}else{
 				$('#slidercontent').animate( {marginLeft: manualClone});
 				currentMargin = manualClone;
 				}
				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide1').addClass('navbuttonselect');
				
				slideIndex = 0;
				deactivateSlider();		
 				break;
 				;
 				case 'slide2':
 				manual = slideWidth;
 				manualClone = maxMargin - (slideWidth * 2);
				if(cloned == 0){
 				$('#slidercontent').animate( {marginLeft: -manual});
 				currentMargin = -manual;
 				}else{
 				$('#slidercontent').animate( {marginLeft: manualClone});
 				currentMargin = manualClone;
 				}
				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide2').addClass('navbuttonselect');
				slideIndex = 1;
				deactivateSlider();
				break;
 				;
 				case 'slide3':
 				manual = slideWidth*2;
 				manualClone = maxMargin - (slideWidth * 3);
 				if(cloned == 0){
 				$('#slidercontent').animate( {marginLeft: -manual});
 				currentMargin = -manual;
 				}else{
 				$('#slidercontent').animate( {marginLeft: manualClone});
 				currentMargin = manualClone;
 				}
 				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide3').addClass('navbuttonselect');
				slideIndex = 2;
				deactivateSlider();				
 				break;
 				;
 				case 'slide4':
 				manual = slideWidth*3;
 				manualClone = maxMargin - (slideWidth * 4);
				if(cloned == 0){
 				$('#slidercontent').animate( {marginLeft: -manual});
 				currentMargin = -manual;
 				cloneSlider();
 				}else{
 				$('#slidercontent').animate( {marginLeft: manualClone});
 				currentMargin = manualClone;
 				}
				$('.navbutton').removeClass('navbuttonselect');
      			$('.navbutton.slide4').addClass('navbuttonselect');
				slideIndex = 3;
			//	cloneSlider();
				deactivateSlider();		
 				break;
 				;
 				}
 		activateSlider();
 		});
 }
