window.onload = function (){
    $(".item-icon59").click(function(){
        console.log("hhhh");
        $(".search").animate({right:265},1000);
    })
    
	$(".link93").click(function(){
		window.location.href="user_login.jsp";
	})
	
	$(".div423").click(function(){
		window.location.href="catMain.jsp";
	})

	
}

document.addEventListener('DOMContentLoaded', function(){
	const search = document.getElementById("search");
	
	//검색
	function searchEnter(){
		const query = search.value;
		if(query){
			window.location.href = `user_login.jsp?q=${encodeURIComponent(query)}`;
		}
	}
	
	//enterkey
	search.addEventListener('keydown', function(e){
		if(e.key === 'Enter'){
			e.preventDefault();
			searchEnter();
		}
	})
})
