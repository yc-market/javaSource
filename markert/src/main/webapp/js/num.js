// JavaScript Document


function addUpdate(jia,price){		
	
	var c = jia.parent().find(".n_ipt").val();
	c=parseInt(c)+1;	
	jia.parent().find(".n_ipt").val(c);
	
}

function jianUpdate(jian){   
	
	var c = jian.parent().find(".n_ipt").val();
	if(c==1){    
		c=1;    
	}else{    
		c=parseInt(c)-1;    
		jian.parent().find(".n_ipt").val(c);
	}
}    




function addUpdate1(jia,price,id){	
	
	
	
	
	var c = jia.parent().find(".car_ipt").val();
	c=parseInt(c)+1;	
	jia.parent().find(".car_ipt").val(c);
	console.log(c);
	var xiaoji=parseFloat(price)*parseFloat(c);
	console.log(xiaoji+"===="+id);
	jQuery("#xiaoji_"+id).html(xiaoji);
	
}

function jianUpdate1(jian,price,id){  
	
	var c = jian.parent().find(".car_ipt").val();
	if(c==1){    
		c=1;    
	}else{    
		c=parseInt(c)-1;    
		jian.parent().find(".car_ipt").val(c);
		var xiaoji=parseFloat(price)*parseFloat(c);
		jQuery("#xiaoji_"+id).html(xiaoji);
	}
	
}    
