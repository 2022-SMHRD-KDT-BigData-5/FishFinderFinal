window.onload = function() { document.body.classList.remove('is-preload'); }
window.ontouchmove = function() { return false; }
window.onorientationchange = function() { document.body.scrollTop = 0; }


// 갤러리 선택
var fileInput = document.getElementById("images");

images.addEventListener('change',function(e){ // 값이 변경될때 호출 되는 이벤트 리스너
    // 가져온거 확인(콘솔창)
    console.log(e.target.files[0])
    // URL.createObjectURL()을 사용해서 위에서 받은 file정보를 넣어줌
    const file = URL.createObjectURL(e.target.files[0]);
    document.querySelector("#show-picture").src = file;
    // src에 파일 정보가 들어가면 메인 이미지와 로고가 숨겨지고 우측상단에 작은 로고와 미리보기 이미지가 띄워짐
    if(src = file){
        document.querySelector('.mainLogo').style.display = 'none';
        // document.querySelector('.mainTitle').style.display = 'none';
        document.querySelector('.smallLogo').style.display = 'block';
        document.querySelector('.preview_container').style.display = 'block';
    }
})

// 카메라 선택
var takePicture = document.getElementById("inputFile");

inputFile.addEventListener('change', function(e){
    const camera = URL.createObjectURL(e.target.files[0]);
    document.querySelector('#show-picture').src = camera;
    // show/hide
    if(src = camera){
        document.querySelector('.mainLogo').style.display = 'none';
        // document.querySelector('.mainTitle').style.display = 'none';
        document.querySelector('.smallLogo').style.display = 'block';
        document.querySelector('.preview_container').style.display = 'block';
    }
})
