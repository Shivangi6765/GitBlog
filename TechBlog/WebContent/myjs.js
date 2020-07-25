
  function doLike(pid,uid)
  {
    console.log(pid +","+ uid)	 //jo user h or jo post h dono console pe dikhegi
    const d = {
	   uid:uid,
	   pid:pid,
	   operation:'like'
  }
  
    $.ajax({
	   url:"LikeServlet",
       data:d,
       success:function(data, textStatus, jqXHR){
    	  console.log(data);
    	  if(data.trim()=='true'){
    		  let c = $(".like_counter").html(); //like ki value increase krne ke liye
    		  c++;
    		  $('.like_counter').html(c);
    		  
    	  }
       },
       error:function(jqXHR, textStatus, errorThrown){
    	   console.log(error);
       }
  
  
   })
  
  
  }

