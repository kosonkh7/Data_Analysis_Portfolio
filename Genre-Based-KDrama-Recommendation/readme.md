
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

## Data Understanding:<br>
2023년 8월 기준 MyDramaList에서 웹스크랩핑한 데이터이다.  <br>

평점 상위 100개의 한국 드라마 데이터이며, 14개의 컬럼으로 이루어져 있다. <br>

https://www.kaggle.com/datasets/chanoncharuchinda/top-100-korean-drama-mydramalist <br>
<br>
![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/ad0f9452-113f-447e-9d52-d54b7f8df5c8)<br>
 <br>

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/7ed8f22a-6fd6-4de8-b89b-97f7e6b3a74e)

<br>

각 드라마는 1개 이상의 장르를 포함하고, 24종류의 장르로 카테고리화 되어있다.<br>

총 스물 네 종류의 장르 목록은 아래와 같다.<br>

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/a1484226-9f14-4b7a-b909-edc2608cd02d)

 <br>


## Conclusion:
<br>
추천 프로그램 절차는 다음 순서를 따른다.<br>

1. 스물 네 종류의 장르 목록을 제시한다.<br>

2. 장르 목록에서 포함된 장르를 입력받는다. (목록에 없는 장르를 입력하면 'drama'장르로 대체하여 반환한다.)<br>

3. 입력한 장르의 드라마 중에서 랜덤으로 하나의 드라마를 추천하여 대시보드 형태로 추천하는 것을 프로그래밍하였다. <br>

대시보드에는 데이터셋에 포함된 데이터 중 드라마 소개에 필수적인 정보인 제목, 등장인물, 줄거리와 더불어 평점, 장르, 키워드 정보를 포함하게 구성하였다.


 <br>
또한 드라마 추천에 시각적인 요소를 더하기 위하여 100개의 드라마에 해당하는 메인 포스터를 웹에서 크롤링하는 코드를 작성하였고, <br>
 <br>
추가로 보다 높은 화질의 이미지를 활용하기 위하여 크롤링한 이미지를 업스케일링하는 코드를 적용한 뒤 대시보드에 추가하였다. <br>
<br>

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/11148e32-e2fc-417e-b6ce-7479a9aedca5)
 <br>

예시로 'Thriller' 장르를 선택하였을 때 아래와 같은 결과를 보여준다.
 <br>
![다운로드](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/9c5a4db5-1d2d-480b-93ef-7a70c3dfa85e)

본 프로젝트는 개인적으로 재밌는 드라마를 찾고자 하는 욕구에서 비롯되었다.

더 방대한 데이터를 구성하고, 대시보드의 디자인적인 부분을 개선하여 웹개발로 이어진다면, 재밌는 드라마를 찾고자 하는 시청자들에게 편의를 제공해줄 수 있을 것으로 기대한다. 
