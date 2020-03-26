$(document).ready(function(){
	//alert('hi');
	menuevent()
});

function menuevent(){
	//alert('hello');
	$('.first').hover(function(){
		$(this).find('a').css('color','rgb(51, 85, 139)');
		$(this).find('article').css('display','inline');
		$('.submenu').hover(function(){
			$(this).css({'background-color':'rgba(51,85,139,0.5)','color':'white'});
		},function(){
			$(this).css({'background-color':'','color':'rgb(102, 102, 102)'});
		});
	},function(){
		$(this).find('a').css('color','rgb(34, 34, 34)');
		$(this).find('article').css('display','none');
	});
	
	$('.headright .button').hover(function(){
		$(this).css({'background-color':'rgb(51,85,139)','color':'white'});
	},function(){
		$(this).css({'background-color':'rgba(234, 234, 234, 0)','color':'rgb(51, 85, 139)'});
	});
	
	}
