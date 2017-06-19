var name; 	// default로 undefined
var email; 	// default로 undefined
var domain; // default로 undefined	
var thumbnail;  // default로 undefined

var href= window.location.href;

var clientId = '631033557691-0bnhoa7gl9cblnumrck1k6b08bsoi9gm.apps.googleusercontent.com';
var redirectUrl = 'http://localhost:8080/tripus/login';


/*if ( href.indexOf('127') !== -1 ){ // 개발서버이다.
	clientId = 'dev (donnot care)';
	redirectUrl = 'http://dev (donnot care)';
} else if ( href.indexOf('mooo.com') !== -1) ) { // freedns에서 설정한 도메인 및 Google api 콘솔에서 등록한 도메인, 당연히 3개의 도메인 일치해야 한다. 
	clientId = '631033557691-0bnhoa7gl9cblnumrck1k6b08bsoi9gm.apps.googleusercontent.com';
	redirectUrl = 'http://localhost:8080/tripus/login';
} else { // 그외
	clientId = 'release';
	redirectUrl = 'http://release';
}
*/
console.log('google client Id   : ' + clientId);
console.log('google redirectUrl : ' + redirectUrl);

hello.init(
		{google: clientId}, 
		{redirect_uri: redirectUrl} 
	);
var accessToken;
function login(){
	hello('google').login({scope: 'email'}).then(function(auth) {
		hello(auth.network).api('/me').then(function(r) {
			console.log(JSON.stringify(auth));
			accessToken = auth.authResponse.access_token;
			console.log(accessToken);
			getGoogleMe();
		});
	});
}
	    
function setDevMode(){
	name 	= 'dev';
	email 	= 'a@a.com';
	domain	= 'a.com';
	thumbnail = 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50';
}

function getGoogleMe(){
	hello('google').api('me').then(
			function(json) {
				console.log(JSON.stringify(json));
				name = json.name;
	    		email = json.email;
	    		domain = json.domain;
	    		thumbnail = json.thumbnail;
				console.log('name   : ' + name);
	    		console.log('email  : ' + email);
	    		console.log('domain : ' + domain);
	    		console.log('thumbnail : ' + thumbnail);
	    		loginComplete();// JSNI에 정의 되어있다.
			}, 
			function(e) {
	    		console.log('me error : ' + e.error.message);
	    	});
}
function logout(){
	hello('google').logout().then(
			function() {
				console.log('logout');
			},
			function(e) {
				console.log('Signed out error: ' + e.error.message);
	    	});
}