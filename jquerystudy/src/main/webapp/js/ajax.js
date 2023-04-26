/**
 * /jquerystudy/src/main/webapp/js/ajax.js
 */
//ajax("test.txt",null,getMax,"GET")
function ajax(url,params,callback,method) {
	const xhttp = new XMLHttpRequest() //ajax 객체 생성
	method = method.toUpperCase() //메서드에 들어온 모든 내용을 대문자로 변환
	if(method != "POST") { //POST방식이 아니면
		method = "GET" // 무조건 GET방식으로 전송할거다
	}	
	if(method == "GET") { 
		url = url + "?"+params //GET 방식인 경우 url에 파라미터 붙여서 서버로 전송
	}
	xhttp.open(method,url,true)
	//GET방식이든 POST방식이든처리하고 / 그에 따라 url 바뀌고 /true: 기본값. 비동기방식으로 전송할거다
	//POST 방식 대비하여 파라미터값 헤더 정보 설정
	//GET 방식은 필요없지만 POST 방식은 필요하기 때문
	xhttp.setRequestHeader("Content-type",
		"application/x-www-form-urlencoded;charset=UTF-8")
	xhttp.send(method=='POST'?params:null) 
	//xhttp.send(null)
	xhttp.onreadystatechange=callback
	//콜백 함수 등록(이름이 getMax인 콜백함수)
}