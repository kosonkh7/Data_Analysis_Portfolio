# Google Advanced Data Analytics Professional Certificate Portfolio
## Overview:

- 목표: 틱톡 동영상 리포트로부터 수집된 데이터에서 부적절한 정보가 담겼는지 예측하여 찾아내는 것
- 목적: opinion(개인적인 의견)과 claim(근거나 출처를 확인할 수 없는 내용을 주장)을 분류하는 모델을 구축한다.

랜덤포레스트와 XGBoost 기반 분류 모델을 구축 후 성능 비교하여,  <br>

Recall 기준 더 우수한 성능을 보인 랜덤포레스트 기반 모델을 최종 예측 모델로 선정하여 모델 평가를 진행하였다. <br>

## Business Understanding
틱톡 사용자는 동영상과 덧글에 대한 컴플레인을 제기할 수 있다. <br>

이런 컴플레인은 관리자가 내용을 일일이 검토해야 하는데, 적시에 검토하기에는 데이터의 양이 방대하다. <br>

틱톡은 관리자의 효율적인 작업을 위하여, <br>

동영상이 개인적인 의견을 포함하는지, 근거 없는 부적절한 내용을 전달하는지 구분하는 예측 모델을 개발하고자 한다. <br>


## Data Understanding:

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/baa80d85-494b-4387-a098-5c550c4b2fbb)

 <br>
 
동영상이 개인적인 의견(opinion)을 담았는지, 근거나 출처를 확인할 수 없는 내용을 주장(claim)하는지 구분하는 타겟 클래스 'claim_status'를 포함하는
12개의 feature로 이루어진 19084개의 데이터이다.
 <br>
 
여기서 텍스트 데이터를 트리 기반 분류 모델에 효과적으로 활용하기 위해 'video_transcription_text'에서 텍스트 길이와 카운트 기반 벡터를 추출하였다. <br>
 <br>
 
아래 히스토그램은 텍스트 길이에 따른 타겟 클래스 분포를 보인다. <br>

 <br>
 
![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/e0bec66e-beb3-4eab-8210-806692e16725)
 <br>
 
CountVectorizer 기법은 텍스트에 등장한 단어 수를 기반으로 문서 분류, 키워드 추출 등에 활용할 때 사용한다. <br>
 <br>
트레이닝셋, 검증셋, 테스트셋에서 각각 추출한 카운트 벡터 객체를 기반으로 생성한 count_vec 데이터프레임을 concatenate하였다. <br>

 <br>
 
![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/a2324aab-0c91-4d8c-9bad-fd9ed09aa3af)
 <br>
 
## Modeling and Evaluation:

분류 모델로 '랜덤 포레스트' 기반 모델과 'XGBoost' 기반 모델을 적용한 뒤 성능을 비교하였다.
 <br>
 
각 모델은 최적의 파라미터를 찾기 위해 적절한 Grid Search 기법을 적용하였다. <br>
 <br>
아래 그림은 검증셋을 기반으로 한 Confusion Matrix이다. <br>
 <br>
 
![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/09bbf937-c778-4fb1-809b-b3fe21ed4166)
 <br>
비교해보았을 때 랜덤포레스트가 XGBoost 보다 False Negative(opinion이라 예측했지만 실제로 claim인)를 더 잘 분류하였기에 검증 Recall 값이 더 높기 때문에 <br>
 <br>
<b>랜덤포레스트</b>를 최종 예측 모델로 사용하기로 했다. <br>

 <br>
아래는 적합시킨 랜덤포레스트 모델로 테스트셋을 예측한 Confusion Matrix이다. <br>

 <br>
 
![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/e691d33c-f8ef-46bf-a2ea-6ce5d9f91bc0)
 
 <br>
테스트셋을 예측했을 때 아주 좋은 성능을 보이는 것을 한 눈에 알 수 있다. <br>
 <br>
아래 그림은 예측 모델의 feature importance이다. <br>

 <br>
 
![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/ac86a088-b992-41e7-be0a-9521076ea314)
 <br>
 
영상 조회수와 영상 좋아요 수가 분류에 비교적 큰 영향을 미친 것을 확인할 수 있다.



