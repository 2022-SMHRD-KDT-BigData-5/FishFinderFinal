	function fileUpload(){
		
	    $.ajax({
	    	type: "POST",
	    	enctype: 'multipart/form-data',	// 필수
	    	url: '/fish/upload',
	    	data: new FormData($("form")[0]),		// 필수
	    	processData: false,	// 필수
	    	contentType: false,	// 필수
	    	cache: false,
	    	success: function (result) {
	    		fileName = result[0]
	    		his_seq = result[1]
	    		access_Token = result[2]
	    		console.log(fileName)
	    		
	    		setTimeout(function() {
				  ajaxRequest(fileName, his_seq, access_Token);
				}, 5000);
	    		
	    		
	    	},
	    	error: function () {
	    		alert('사진을 첨부하세요!')
	    	}
	    });
	}
        



        function ajaxRequest(fileName, his_seq, access_Token){
            $.ajax({

                url : 'http://172.30.1.8:5000/fish/Flask',
                type : 'post',
                data : {
                    'Fish_img' : fileName,
                    'his_seq' : his_seq,
                    'access_Token' : access_Token

                },
                success : function(res){
                	console.log(res)
                    location.href = "result"
                    
                },
                error : function(){
                    alert('서버 오류')
                }

            })

        }
        
        
        	function fileUploadtest(){
		
	    $.ajax({
	    	type: "POST",
	    	enctype: 'multipart/form-data',	// 필수
	    	url: 'http://172.30.1.33:9000/fish/Flask',
	    	data: new FormData($("form")[0]),		// 필수
	    	processData: false,	// 필수
	    	contentType: false,	// 필수
	    	cache: false,
	    	success: function (result) {
	    	 //?key=value&key=value
	    		window.location.href = "/fish/result?fish_img="+result
	    			
	    	},
	    	error: function () {
	    		alert('테스트 통신 오류')
	    	}
	    });
	}
