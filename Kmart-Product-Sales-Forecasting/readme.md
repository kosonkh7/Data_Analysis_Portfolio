# 상품 판매 데이터 기반 판매량 예측 
# Overview
**목적**: 미네소타주 세인트폴의 K-mart에서 영위하는 특정 상품의 적정 재고 수준을 파악하여 재고량과 기회 손실을 모두 최소화 하고자 한다. <br>
**목표**: 특정 상품 대상으로, 리드 타임을 고려하여 이틀 뒤의 상품 판매량을 예측하는 LSTM기반 시계열 모델을 구축하고 성능을 고도화 한다.   <br>

# Business Understanding
K-Mart는 미국 전역에 매장을 보유했던 유통회사이다. <br>

![미네소타 kmart 폐업](https://github.com/user-attachments/assets/45d05ccd-55e6-45b9-9ee9-be4aaf287728)

재고를 넉넉하게 보유하면 기회손실을 줄일 수 있으나, 과도한 재고 증가로 자금이 묶이게 되어 회사 현금 흐름에 문제 발생할 수 있다. <br>

기본 비즈니스 절차 <br>
• 매일 저녁 9시에 매장 업무 마감 <br>
• 발주 담당자: 당일 및 최근 판매량과 리드타임(발주 후 입고까지 기간) 정보에 기초하여 발주 <br>
• 발주 후 상품은 각각의 리드타임에 맞게 입고 <br>
• 예를 들어 리드타임이 2일 걸리는 상품은, 5월20일 저녁 10시에 주문하면, 5월22일 새벽(매장 오픈 전)에 입고되어 당일 판매를 할 수 있다. <br>

# Data Understanding
활용 데이터: 2014년 1월 1일 ~ 2017년 3월 31일 기준 <br>
매장 데이터 / 상품 데이터 / 판매 데이터 / 고객 방문 수 데이터 <br>
유가 데이터 / 날씨 데이터 (추가) <br>

![image](https://github.com/user-attachments/assets/2ddc5b31-cfc8-471d-8a7d-f097f9091561)

분석 대상: 가장 매출이 높은 미네소타주 세인트폴 매장을 대상으로,  <br>
3가지 주요 품목{3번: 음료수, 12번: 우유, 42번: 곡물}의 수요를 예측하고자 한다. <br>

![image](https://github.com/user-attachments/assets/64b8152b-1386-41d6-ae1c-fb70b5d16749)

## 1) 대상 상품별 판매량 추이
![image](https://github.com/user-attachments/assets/206ef3ba-0801-483c-a0db-232a44e11691)

3번과 12번 상품의 경우 1월 1일 판매량이 없음. 추후 데이터 처리 필요 <br>

3번과 12번 상품은 전체 데이터로 볼 때는 경향성을 찾기 힘듦. <br>

42번 상품은 등락이 어느정도 보이고, 그 기간이 4~11월로 수확이 잘되는 시기라고 생각이 듦. <br>

## 2) 대상 상품의 동일 카테고리의 상품별 판매량 추이
![image](https://github.com/user-attachments/assets/f28e86f4-d932-4390-8a54-449eda3076a7)

3번과 12번의 경우 동일 카테고리 내 가장 많이 판매되는 상품. <br>
42번의 경우 grocery 카테고리 중 적게 팔리는 상품. <br>
42번이 미네소타(44번 매장)에서만 팔린다는 것을 고려할 때 해당 지역 특산품이지 않을까 추측. <br>

## 3) 휘발유 가격과 상품 판매량 추이 비교
![image](https://github.com/user-attachments/assets/871a62d9-d447-41bc-9c74-cfd37adeb128)

그래프 상 유가와 상품 판매량은 크게 연관이 없어 보임.  <br>
간접적으로 영향을 받는 데이터이고, 유가도 외부요인에 의해 많이 변경이 되기에 비슷하지 않은 것으로 생각됨. <br>
유가의 등락폭과 곡물 판매량의 등락을 알아보기 위해 2일간의 Qty 이동 평균과 유가의 상관계수를 확인해봄. <br>
상관계수가 높은 편은 아니나 3, 12번의 p-value는 0.01 미만으로 의미를 보임. <br>

## 4) 방문 고객수와 상품 판매량 추이 비교
![image](https://github.com/user-attachments/assets/96deeff6-92b5-4e3a-93c6-bbf3065221eb)

12번의 경우 고객수와 그래프가 어느정도 유사해보이며, 다른 두 상품은 크게 연관이 없어보임. <br>
상관계수를 확인한 결과 12번은 어느정도 상관관계를 보이며, 다른 두 상품도 p-value를 고려할 때 관계는 있을 것으로 보임. <br>

## 5) 요일별 상품별 판매량 변화
![image](https://github.com/user-attachments/assets/2d9445d9-99a1-40a5-afd6-fb6a5ab996c9)
예상한 대로 평균 판매량은 주말이 전체적으로 높음. 허나 그만큼 편차도 큰 것으로 보임. <br>
42번의 경우 주말에 가까워질수록 판매량이 증가하는 경향이 있음. <br>

## 6) 월별 상품별 판매량 변화 
![image](https://github.com/user-attachments/assets/6afd4d79-28da-4153-b9c7-ea5184de5b87)
3번 상품은 1월, 그리고 9월부터 12월에 많이 팔리는 것으로 보아 기온이 낮을 때 많이 팔리는 음료로 보임. <br>
12번 상품의 경우 12월에 약간은 많이 팔린 것으로 보이나 평균값과 편차가 생각보다 월별로 차이가 크지 않음. <br>
42번 상품은 앞서 예상한대로 4~11월에 많이 팔리는 편. <br>
12월 고객 수가 증가하는 한 것이랑 관계가 없는 것으로 보아 판매량이 한정되어 있지 않을까 생각이 됨. <br>

## 7) 공휴일 여부에 따른 상품별 판매량 변화 
![image](https://github.com/user-attachments/assets/0d4150fb-0e36-4ec0-ae5f-6eede1a3a10b)

공휴일은 주말 + 미국 연방 공휴일 기준으로 추출. <br>
예상한대로 휴일에 더 많은 판매량을 보임. <br>
42번의 경우에는 그 차이가 생각보다는 크지 않음. <br>

1)상품 3에 대한 전체 분석 결과
월별 변화량을 고려할 때 날씨에 영향을 받는 음료제품이지 않을까 생각이 됨. <br>
휴일에 판매량이 많아지는 것으로 볼 때 휴일을 고려하여 입고를 해야함. <br>

2)상품 12에 대한 전체 분석 결과
12월에 고객수가 많아진다는 것을 고려할 때 월별로 차이가 크지 않은 것으로 보임. <br>
대신 고객수와의 상관관계가 다른 상품보다 큰 것을 고려할 때, 보편적인 상품(일반 우유)로 추정됨. <br>

3)상품 42에 대한 전체 분석 결과
grocery 제품인 것을 고려할 때 수확시기와 맞물려 판매량이 많아짐. 이 시기에 입고량을 고려해야함. <br>
고객수와의 관계가 크게 없어보임. <br>
44번 상점에서만 판매하는 것과 수확과 맞물린다는 것을 고려할 때 미네소타 특산품이지 않을까 추측됨. <br>

# Modeling and Evaluation
[모델 이미지 출처](https://wikidocs.net/60762)

![image](https://github.com/user-attachments/assets/861179f5-b579-4d39-b07d-6090acf7f909)


![image](https://github.com/user-attachments/assets/23bb223c-9a25-4190-aa84-f9b17a5c7f3f)

상품들의 리드 타임을 고려하여, 이틀 뒤의 상품별 판매량을 예측하는 모델을 만드는 것이 목표.  

LSTM과 GRU 기반으로 모델링 하였고, [RNN, LSTM, GRU에 관련한 설명은 개인 블로그에](https://kosonkh7.tistory.com/277) 작성해두었다.

![image](https://github.com/user-attachments/assets/e72fa0a8-4750-4642-b0e9-f48d83b1d46c)

MAE :  0.06606512117893139 <br>
MAPE :  0.1929165376225416 <br>
R2 :  0.6828101381667248 <br>

테스트셋으로 활용한 2017년3월 한 달 간의 데이터로 예측한 결과를 통해 3번 상품의 재고 지표를 계산한 것은 아래와 같다.

일평균 재고량     : 6815.981 <br>
일평균 재고 금액  : 54527.848 <br>
일평균 재고회전율 : 1.333 <br>
기회손실 수량     : -1178.0 <br>

# Conclusion

LSTM과 GRU를 통해 시계열 모델링을 해보는 경험을 하였다. <br>

모델링보다는 해당 데이터를 이해하고, 분석하고, 예측에 영향을 미칠 것으로 예상되는 가설을 세우는 것에 보다 시간을 많이 쏟았는데 <br>

실제로 여러가지 실험을 해보면서 느꼈던 점으로는, <br>

모델 자체를 고도화하는 것보다, 피처 엔지니어링을 통해 기간 별 통계량에 관련한 피처를 추가하거나, 새로운 데이터를 도입하는 것이 예측 성능을 높이는데 더 기여했다고 느꼈다. <br>

물류에 영향을 미칠 것으로 예상되는 유가, 기온, 적설량, 강우량 데이터를 추가하고, <br>

특히 주말이나 공휴일, 연말에 고객 방문 수와 상품 별 판매량이 증가하는 것을 반영하여서 성능을 높이는데 도움을 받았는데,  <br>

분석에 시계열 데이터가 활용된만큼 이동평균, 계절성, 추세, 자기상관성, 노이즈에 관련한 피처를 추출하여 활용하였다면 더 좋은 결과를 이끌 수 있지 않았을까 예측해본다.   <br>







