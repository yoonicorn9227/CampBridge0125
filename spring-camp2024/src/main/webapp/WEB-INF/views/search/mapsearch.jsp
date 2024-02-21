<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>지도 뷰</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="/assets/css/main2.css" rel="stylesheet">
    <link href="/assets/css/header.css" rel="stylesheet">
    <link href="/assets/css/search/mapsearch.css" rel="stylesheet">

    <style>

    </style>
</head>
<body>
<!-- ======= Header ======= -->
<%@include file="../include/header.jsp" %>
<!-- End Header -->
<section class="notice_search">

<!-- 캠핑장 검색 -->
<img src="../assets/img/campsearch/free_icon_map.png">
<h1>지도 검색</h1>
<button id="map_searchBtn"><a href="/search/campsearch">캠핑장검색으로</a></button>

<div class="map_wrap">
<div id="map_search"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div class="keyword_search">
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="" id="keyword" size="15"> 
                    <button id="search_Btn" type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c74f5d01be449a3dcaa336db1cd0d99&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];
var data_test = [];

var mapContainer = document.getElementById('map_search'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();


/* //검색된 캠핑장 정보를 처리하는 함수입니다.
function placesSearchCB(data) {
    // 여기서 검색된 캠핑장 정보를 처리합니다.
    console.log(data); // 검색된 캠핑장 정보를 콘솔에 출력합니다.

    // 검색된 캠핑장 정보를 표시할 HTML 요소를 선택합니다.
    var resultsContainer = document.getElementById('campResults');

    // 검색 결과를 초기화합니다.
    resultsContainer.innerHTML = '';

    // 검색된 각 캠핑장 정보를 처리합니다.
    data.forEach(function(camp) {
        // 각 캠핑장에 대한 정보를 표시할 HTML 요소를 생성합니다.
        var campElement = document.createElement('div');
        campElement.innerHTML = `
            <div>
                <h3 class="campName">${camp.place_name}</h3>
                <p>주소: ${camp.address_name}</p>
                <p>전화번호: ${camp.phone}</p>
            </div>
        `;

        // place_name을 클릭했을 때의 이벤트를 추가합니다.
        var campNameElement = campElement.querySelector('.campName');
        campNameElement.addEventListener('click', function() {
            // 클릭했을 때의 동작을 정의합니다.
            window.location.href = '/search/mapsearch_view'; // 클릭 시 해당 페이지로 이동합니다.
        });

        // 검색 결과를 표시할 컨테이너에 각 캠핑장 정보를 추가합니다.
        resultsContainer.appendChild(campElement);
    });
}
 */

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.trim()) {
        alert('키워드를 입력해주세요!');
        document.getElementById('keyword').focus(); // 검색창에 focus를 줍니다.
        return false;
    }

    data_test = [
         {
          "place_name": "(주)아웃오브파크",
          "place_url": "http://outofpark.com/main/",
          "address_name": "강원도 춘천시 남면 가옹개길 52-9",
          "id": "10",
          "phone": "1522-1861",
          "x": "127.5112565",
          "y": "37.7278127"
        },
        {
	      "place_name": "파크킹",
	      "place_url": "https://www.instagram.com/amazingpark6211/",
	      "address_name": "경북 김천시 어모면 은림로 62-11",
	      "id": "100000",
	      "phone": "054-434-6677",
	      "x": "128.1270051",
	      "y": "36.1795215",
	    },
	    {
	      "place_name": "봉즈살롱",
	      "place_url": "https://www.instagram.com/salon.de.bonj/",
	      "address_name": "강원 횡성군 서원면 서원서로102번길 3-18",
	      "id": "100001",
	      "phone": "033-345-3336",
	      "x": "127.8240705696189",
	      "y": "37.48049694689978",
	    },
	    {
	      "place_name": "힐링피아 카라반 글램핑 풀 야영장",
	      "place_url": "http://healingpia.co.kr",
	      "address_name": "경기 가평군 설악면 유명산길 61-75",
	      "id": "100002",
	      "phone": "010-3148-9970",
	      "x": "127.4947241",
	      "y": "37.5978864",
	    },
	    {
	      "place_name": "우니메이카 태안점",
	      "address_name": "충남 태안군 소원면 산간이길 158-24",
	      "id": "100003",
	      "phone": "043-1668-3972",
	      "x": "126.1890914",
	      "y": "36.7796484",
	    },
	    {
	      "place_name": "뇌운계곡글램핑 야영장",
	      "place_url": "https://pcglamping.modoo.at/",
	      "address_name": "강원 평창군 평창읍 뇌운계곡로 659-6",
	      "id": "100004",
	      "phone": "033-332-0009",
	      "x": "128.3820960",
	      "y": "37.4156933",
	    },
	    {
	      "place_name": "충주 비내캠프 체험학습장",
	      "place_url": "http://www.binaecamping.co.kr",
	      "address_name": "충북 충주시 앙성면 학교말2길 50",
	      "id": "100005",
	      "phone": "010-9999-4848",
	      "x": "127.7519787",
	      "y": "37.1629594",
	    },
	    {
	      "place_name": "솔비치야영장",
	      "place_url": "https://solbeachcamp.modoo.at/",
	      "address_name": "충남 태안군 남면 몽산포길 63-23",
	      "id": "100006",
	      "phone": "02-347-7878",
	      "x": "126.2896689",
	      "y": "36.6716010",
	    },
	    {
	      "place_name": "가온오토야영장",
	      "place_url": "http://www.gaoncamp.com/",
	      "address_name": "경북 포항시 북구 죽장면 새마을로 3351",
	      "id": "100007",
	      "phone": "010-7845-6245",
	      "x": "129.0777706",
	      "y": "36.1473337",
	    },
	    {
	      "place_name": "림스 글램핑",
	      "place_url": "http://limsglamping.modoo.at",
	      "address_name": "전남 강진군 강진읍 해강로 1038-30",
	      "id": "100008",
	      "phone": "010-7845-6245",
	      "x": "126.7367324",
	      "y": "34.6030215",
	    },
	    {
	      "place_name": "호미곶유니의바다",
	      "place_url": "http://www.xn--2-9r8eycu16b70nwja.com/main.php",
	      "address_name": "경북 포항시 남구 호미곶면 해맞이로46번길 134",
	      "id": "100009",
	      "phone": "010-7845-6245",
	      "x": "129.5751877",
	      "y": "36.0588372",
	    },
	    {
	      "place_name": "예손야영장",
	      "place_url": "http://www.xn--2-9r8eycu16b70nwja.com/main.php",
	      "address_name": "경북 포항시 남구 호미곶면 해맞이로46번길 134",
	      "id": "100010",
	      "phone": "010-7845-6245",
	      "x": "128.2141499",
	      "y": "35.7931527",
	    },
	    {
	      "place_name": "양지뜰야영장",
	      "place_url": "https://booking.naver.com/booking/3/bizes/569133",
	      "address_name": "전북 무주군 설천면 보안길 88",
	      "id": "100019",
	      "phone": "010-7845-6245",
	      "x": "127.7680715",
	      "y": "35.9076467",
	    },
	    {
	      "place_name": "밤벌야영장",
	      "place_url": "Instagram.com/wooridul_camping",
	      "address_name": "경기 가평군 설악면 어비산길 15-23",
	      "id": "100021",
	      "phone": "010-7845-6245",
	      "x": "127.4947099",
	      "y": "37.6012926",
	    },
	    {
	      "place_name": "청춘야영장",
	      "place_url": "Www.toycamp.kr",
	      "address_name": "경기 가평군 가평읍 호반로 1700",
	      "id": "100022",
	      "phone": "010-7845-6245",
	      "x": "127.5124645",
	      "y": "37.7467558",
	    },
	    {
	      "place_name": "다시캠핑장",
	      "place_url": "Www.toycamp.kr",
	      "address_name": "경북 고령군 덕곡면 덕운로 1043-64",
	      "id": "100026",
	      "phone": "010-7845-6245",
	      "x": "128.1962787",
	      "y": "35.7989783",
	    }
   ]; 
    console.log(data_test);
    alert("검색시작");
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    //ps.keywordSearch( keyword, placesSearchCB); 
    placesSearchCB(data_test); //status == 200삭제 
   
}    
 
 
 el.addEventListener('click', function() {
	 
	// hidden input 요소를 생성하고 form에 추가하는 함수입니다.
	 function addHiddenInput(form, name, value) {
	     var input = document.createElement('input');
	     input.setAttribute('type', 'hidden');
	     input.setAttribute('name', name);
	     input.setAttribute('value', value);
	     form.appendChild(input);
	 }
	 
	    // 새로운 form 요소를 생성합니다.
	    var form = document.createElement('form');
	    form.setAttribute('method', 'post'); // 혹은 'get'에 따라 전송 방식을 설정합니다.
	    form.setAttribute('action', '/search/mapsearch_view'); // 해당 form이 전송될 URL을 설정합니다.
	    
	    // hidden input 요소를 생성하고 정보를 추가합니다.
	    addHiddenInput(form, 'id', places.id);
	    addHiddenInput(form, '_firstImageUrl', "https://gocamping.or.kr/upload/camp/10/thumb/thumb_720_1869epdMHtUyrinZWKFHDWty.jpg");
	    addHiddenInput(form, '_facltNm', "(주)아웃오브파크");
	    // 필요한 다른 정보들도 추가할 수 있습니다.

	    // form을 DOM에 추가합니다.
	    document.body.appendChild(form);

	    // form을 자동으로 제출합니다.
	    form.submit();
	});

	// hidden input 요소를 생성하고 form에 추가하는 함수입니다.
	function addHiddenInput(form, name, value) {
	    var input = document.createElement('input');
	    input.setAttribute('type', 'hidden');
	    input.setAttribute('name', name);
	    input.setAttribute('value', value);
	    form.appendChild(input);
	}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data) { //status,pagination 삭제
    console.log("------------------------");
    console.log(data);
    console.log("------------------------");

    //if (status === kakao.maps.services.Status.OK) {
    // 정상적으로 검색이 완료됐으면
    // 검색 목록과 마커를 표출합니다
    displayPlaces(data);
    
    // 페이지 번호를 표출합니다
    //displayPagination(pagination);
    
	//} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		
	    //alert('검색 결과가 존재하지 않습니다.');
	    //return;
	
	//} else if (status === kakao.maps.services.Status.ERROR) {
	
	    //alert('검색 결과 중 오류가 발생했습니다.');
	    //return;
	//}
    
    
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
    console.log("------------------------");
    console.log(places);
    console.log("------------------------");
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {


    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';
    // 변수 id의 값을 id를 추가해줌. 
    el.id = places.id;

    
    // 클릭 이벤트 핸들러 
     el.addEventListener('click', function() {
        // 해당 항목의 id를 이용하여 URL을 생성합니다.
        var placeUrl = "/search/mapsearch_view?id=" + places.id;
        console.log("Clicked on place: " + places.place_name);
        console.log("Navigating to URL: " + placeUrl);
        // 해당 URL로 이동합니다.
        window.location.href = placeUrl;     
    });
    
   /*   // 추가 정보를 input hidden으로 넣어줍니다.
     el.innerHTML += 
        <form action="/search/mapsearch_view" method="get">
            <input type="hidden" name="_firstImageUrl" value="${places._firstImageUrl}">
            <input type="hidden" name="_facltNm" value="${places._facltNm}">
            <input type="hidden" name="_addr1" value="${places._addr1}">
            <input type="hidden" name="_lineIntro " value="${places._lineIntro}">
            <input type="hidden" name="_lctCl " value="${places._lctCl}">
            <input type="hidden" name="_facltDivNm " value="${places._facltDivNm}">
            <input type="hidden" name="_induty " value="${places._induty}">
            <input type="hidden" name="_tourEraCl " value="${places._tourEraCl}">
            <input type="hidden" name="_operDeCl " value="${places._operDeCl}">
            <input type="hidden" name="_homepage " value="${places._homepage}">
            <input type="hidden" name="_sbrsEtc " value="${places._sbrsEtc}">
            <input type="hidden" name="_intro " value="${places._intro}">
            <input type="hidden" name="_posblFcltyCl " value="${places._posblFcltyCl}">
            <input type="hidden" name="_allar " value="${places._allar}">
            <input type="hidden" name="_direction  " value="${places._direction}">
            <input type="hidden" name="_tooltip  " value="${places._tooltip}">
            <input type="hidden" name="_gnrlSiteCo  " value="${places._gnrlSiteCo}">
            <input type="hidden" name="_autoSiteCo   " value="${places._autoSiteCo}">
            <input type="hidden" name="_glampSiteCo  " value="${places._glampSiteCo}">
            <input type="hidden" name="_caravSiteCo  " value="${places._caravSiteCo}">
            <input type="hidden" name="_indvdlCaravSiteCo  " value="${places._indvdlCaravSiteCo}">
            <input type="hidden" name="_sbrsCl  " value="${places._sbrsCl}">
            <input type="hidden" name="_sitedStnc  " value="${places._sitedStnc}">
            <input type="hidden" name="_siteBottomCl1  " value="${places._siteBottomCl1}">
            <input type="hidden" name="_siteBottomCl2  " value="${places._siteBottomCl2}">
            <input type="hidden" name="_siteBottomCl3   " value="${places._siteBottomCl3}">
            <input type="hidden" name="_siteBottomCl4   " value="${places._siteBottomCl4}">
            <input type="hidden" name="_siteBottomCl5   " value="${places._siteBottomCl5}">
            <input type="hidden" name="_siteMg1Width   " value="${places._siteMg1Width}">
            <input type="hidden" name="_siteMg1Vrticl   " value="${places._siteMg1Vrticl}">
            <input type="hidden" name="_siteMg1Co   " value="${places._siteMg1Co}">
            <input type="hidden" name="_eqpmnLendCl   " value="${places._eqpmnLendCl}">
            <input type="hidden" name="_brazierCl   " value="${places._brazierCl}">
            <input type="hidden" name="_extshrCo   " value="${places._extshrCo}">
            <input type="hidden" name="_frprvtWrppCo   " value="${places._frprvtWrppCo}">
            <input type="hidden" name="_fireSensorCo   " value="${places._fireSensorCo}">
        </form>
    ;  */

    return el;
}


// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>

</section>

<!-- ======= Footer ======= -->
<%@include file="../include/footer.jsp" %>
<!-- End Footer -->
</body>
</html>