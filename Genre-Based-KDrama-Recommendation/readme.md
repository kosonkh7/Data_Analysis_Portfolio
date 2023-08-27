
# 2023년 MyDramaList 평점 기반 원하는 장르의 드라마 큐레이팅
<br>

## Overview: 
이용자에게 희망하는 장르 기반으로 새로 볼만한 드라마를 추천한다.<br>
2023년 8월 기준 MyDramaList 평점 상위 100개의 국내 드라마를 데이터로 구성하여,<br>
희망하는 장르의 드라마를 선정하여 줄거리, 주인공 등의 주요 정보를 한 눈에 볼 수 있게 시각적으로 큐레이팅하는 것이 목적이다.<br>
<br>

## Skill Set:<br>
  Python Packages: BeautifulSoup, PIL, textwrap, random, pandas, matplotlib<br>
<br>
## Business Understanding:<br>
'넷플릭스 보러 갈래?'라는 말이 생길 정도로 멀티미디어 컨텐츠와 OTT 플랫폼이 우리의 일상에 지배적으로 자리잡고 있다.<br>
무수하게 쏟아지는 컨텐츠를 오롯이 받아드리는 것이 아니라, 기왕이면 재밌고 개인 취향에 들어 맞는 컨텐츠를 찾고자 하는 수요도 증가하고 있다.<br>
MyDramaList는 해외 아시아 드라마 & 영화 평점 플랫폼 사이트이다.<br>
일반 회원들이 직접 참여하여 드라마와 영화들을 10점 만점으로 평가하여 평점 순위와 별도로 인기 순위를 매기고 있다.<br>
시청자 누적 평점 상위권의 드라마 중에서 선호하는 장르를 필터링하여 추천 받을 수 있으면 가치있는 발견을 할 수 있을 거라 기대하여 프로젝트를 진행하였다.<br>

<br>
## Dataset:<br>
2023년 8월 기준 MyDramaList에서 웹스크랩핑한 데이터이다.  <br>
https://www.kaggle.com/datasets/chanoncharuchinda/top-100-korean-drama-mydramalist <br>
<br>

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/83374144-a610-44d3-a50e-a8af2653097e) <br>
 <br>
평점 상위 100개의 한국 드라마 데이터이며, 14개의 컬럼으로 이루어져 있다. <br>
![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/7ed8f22a-6fd6-4de8-b89b-97f7e6b3a74e)

<br>

각 드라마는 1개 이상의 장르를 포함하고, 24종류의 장르로 카테고리화 되어있다. <br>

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/a0409f02-edf7-4018-830e-dda019b3ca87)
 <br>
장르 목록에서 특정 장르를 선택하면 해당 장르를 포함하는 드라마 중 하나를 랜덤으로 반환하게끔 코드를 전개하였다. <br>
 <br>
## Conclusion:
<br>
드라마 추천에 시각적인 요소를 더하기 위하여 100개의 드라마에 해당하는 메인 포스터를 웹에서 크롤링하는 코드를 작성하여 저장하였다. <br>
 <br>
추가로 보다 높은 화질의 이미지를 활용하기 위하여 크롤링한 이미지를 업스케일링하는 코드를 적용하였다. <br>

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/11148e32-e2fc-417e-b6ce-7479a9aedca5)
 <br>
데이터에서 드라마 추천에 필수적인 정보 (줄거리, 등장인물 등)를 추출하여 시각화 하였다. <br>
 <br>
![다운로드](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/9c5a4db5-1d2d-480b-93ef-7a70c3dfa85e)


