# 📊Data_Analysis_Portfolio
데이터 분석 / 머신러닝 / AI 기반 사이드 프로젝트 모음입니다.

각 프로젝트는 상세 설명과 코드(노트북 파일 포함), 데이터 출처 등을 포함하고 있으며, 

주로 **Overview** -> **Business Understanding** -> **Data Understanding** -> **Modeling and Evaluation** -> **Conclusion** 순으로 작성하였습니다.

**프로젝트 '제목'을 클릭하면 상세 설명**(폴더 경로의 리드미 파일)**로 연결** 됩니다.

## 🎧[RVC 음성 변환 프레임워크를 활용한 AI 커버곡 생성](https://github.com/kosonkh7/RVC_Voice_Conversion)
주요 스택: [RVC 프레임워크](https://github.com/RVC-Project/Retrieval-based-Voice-Conversion-WebUI), [UVR](https://github.com/Anjok07/ultimatevocalremovergui)
<br> 정리: <br>
- VITS 기반 음성 변환 프레임워크 RVC를 활용하여 듣기 좋은 AI 커버곡을 생성이 목적
- [음성 변환 결과물(AI 커버곡) 모음 링크(6개월 간 유튜브 채널 운영)](https://www.youtube.com/@ky-melody)

## 📊[COVID-19 현황 대시보드](https://github.com/kosonkh7/Data_Analysis_Portfolio/tree/main/COVID19-Stats-Dashboard)
주요 스택: SQL, Tableau 
<br> 정리: <br>
- SQL을 활용하여 전 세계 COVID-19 데이터를 분석하여 국가 별 감염 현황, 방역 체계 등에 대한 인사이트 도출
- Tableau에 연결하여 대시보드 형태로 시각화

## 🚍[서울시 생활정보 기반 버스 노선 확대 수요 분석](https://github.com/kosonkh7/Data_Analysis_Portfolio/tree/main/Public-Transportation-Route-Demand)
주요 스택: Python (Pandas, Numpy, Matplotlib, Seaborn)
<br> 정리: <br>
- 데이터 분석을 통해 서울시 버스 노선 확충이 필요한 자치구(또는 지역)에 대한 인사이트 도출이 목적
- 서울시 유동인구 데이터, 버스 운행 노선 및 승하차 데이터 등, 공공 데이터를 전처리 및 그룹핑
- 노년층에게 병원이 포함된 노선을 고려한 공익적인 관점
- 그리고 버스 승객 수와 정류장, 노선 수를 고려한 혼잡도(자체 설계 지표) 관점에서 시각화 및 결론 도출

## 📈[K마트 상품 데이터 기반 판매량 예측 및 관리](https://github.com/kosonkh7/Data_Analysis_Portfolio/tree/main/Kmart-Product-Sales-Forecasting)
주요 스택: Python(Matplotlib, Statsmodels 등), Tensorflow(LSTM, GRU), Sklearn
<br> 정리: <br>
- 방문자 수, 계절성, 유가, 날씨 데이터 등과 타겟 데이터(판매량) 사이의 상관관계 분석 및 시각화
- LSTM, GRU 기반 판매량 예측 모델링, 성능 평가
- 예측 모델 기준 재고회전율 / 기회손실 분석

## 🙎‍♂️[Yolo 기반 내 얼굴 객체 탐지 모델링](https://github.com/kosonkh7/Data_Analysis_Portfolio/tree/main/Face-Recognition)

## 📈[HR 데이터 기반 직원 이직 여부 예측 모델링](https://github.com/kosonkh7/Data_Analysis_Portfolio/tree/main/HR-Analytics)
주요 스택: Python, Sklearn(XGBoost, Random Forest, RUSBoost 등)
<br> 정리: <br>
- 직원들의 이직 여부 예측하는 모델을 구축하고,
- 이직 원인을 밝혀내어 직원들이 유지(Retention)할 방안을 제안 (데이터 분석 및 시각화까지)
- 4가지 분류 모델의 성능 비교, 가장 높은 성능 보인 XGBoost 모델을 바탕으로 Feature Importance를 확인
- 근무 환경 만족도, 재직 기간, 프로젝트 수, 성과 평가, 평균 근무 시간 순으로 이직에 큰 영향을 미치는 것을 확인

## ⚡[1D-CNN 기반 심근경색 진단 모델링](https://github.com/kosonkh7/ECG-Myocardial-Infarction-Detection)
주요 스택: Tensorflow, Sklearn
<br> 정리: <br>
- PTB-XL Dataset(심전도 데이터) 시각화 및 분류 데이터셋 구축
- 1D-CNN 모델링 및 분류 성능 분석

## 🥇[빅데이터 분석기사 실습 파일](https://github.com/kosonkh7/Data_Analysis_Portfolio/tree/main/BigDataAnalysis_Certificate)
정리: <br>
- 작업형 1: Pandas, Numpy 활용한 데이터 처리
- 작업형 2: Sklearn 기반 예측, 분류 모델링 + 성능 고도화를 위한 피처 엔지니어링
- 작업형 3: scipy.stats 이용한 통계 검정 활용 능력 (통계 개념 정리 포함)
