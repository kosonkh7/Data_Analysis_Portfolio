# Google Advanced Data Analytics Professional Certificate Portfolio
## Overview

- 목적: 직원들의 이직률(Turnover Rate)을 감소시킨다. 
- 목표: 직원들의 이직 여부를 예측하는 모델을 구축하고, 이직 원인을 밝혀내어 직원들이 유지(Retention)할 방안을 제안한다.

로지스틱 회귀, 의사결정나무, 랜덤포레스트, XGBoost, (+ RUSBoost) 모델을 활용하여 직원의 이직 여부를 예측하는 분류 모델을 구축하였고,

가장 높은 분류 성능을 보인 <b>XGBoost 모델을 바탕으로 Feature Importance를 확인</b>하였을 때, 

<b>근무 환경 만족도, 재직 기간, 프로젝트 수, 성과 평가, 평균 근무 시간 순으로 이직에 큰 영향</b>을 미치는 것을 확인하였다. 

## Business Understanding
Salifort Motors는 가상의 대체 에너지 자동차 제조 기업이다.

주요 업무는 수소, 전기 및 태양광 기반 차량 연구, 설계, 제작, 검증 및 배포이며,  10만명 이상의 직원을 보유하고 있다.

Salifort Motors는 현재 이직률이 높은 것을 문제로 제기하였다.

이직한 직원을 대체할 신입 사원을 다시 채용하여 교육하고 업무에 적응하는데엔 시간과 비용이 많이 투자되기 때문에. 경제적인 손실을 줄이기 위하여 직원의 이탈율을 줄이는 것이 회사 운영에 도움이 된다.

Salifort Motors의 데이터분석팀은 HR( Human Resources ) 부서로부터 수집한 직무, 부서, 담당 프로젝트 수, 월간 평균 근무 시간 등 데이터를 바탕으로 등을 기반으로 직원들의 이직 여부를 예측하는 모델을 구축하고, 

직원의 이직과 높은 연관성을 보이는 요인을 분석하여 지도부(Leadership Team)와 함께 직원들이 유지할 방안을 논의하고자 한다.


## Data Understanding
데이터셋: https://www.kaggle.com/datasets/mfaisalqureshi/hr-analytics-and-job-prediction

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/23a49b27-c9fc-416a-acea-2933896d6d6e)

이직 여부를 구분하는 타겟 클래스 ‘left’를 포함하는 10개의 feature로 이루어진 15,000개의 직원데이터이다. 

8개의 정수형 데이터 이외에 2개의 문자 데이터(department, salary)는 추후 모델링 과정에서 인코딩 해주었다.

### 재직기간과 이직 관계 시각화

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/978281f5-ac6b-499b-972d-ba2915a4490a)


재직 기간과 이직의 연관성을 시각화 해보았을 때,

7년 차 이상 직원은 이직하지 않았고, 9년차에는 직원이 없는 것도 볼 수 있었다.

### 프로젝트 수와 근무 시간, 프로젝트 수와 이직 수 관계 시각화

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/503b5b5d-c4ff-46bc-8d33-029a5c343a9d)

프로젝트 수가 많아지면 근무시간이 길어지는 것을 볼 수 있고, 이는 쉽게 예상할 수 있는 사실이다.

회사를 떠난 사람들을 두 가지 패턴을 찾아볼 수 있는데,
1. 같은 프로젝트 수 대비 근무 시간이 상대적으로 적은 그룹
2. 같은 프로젝트 수 대비 근무 시간이 상대적으로 많은 그룹

1번 그룹의 경우 실적 저하로 인한 해고당한 것으로 추측해볼 수 있고,

2번 그룹의 경우 프로젝트 6개 이상을 맡고 근무 시간이 상대적으로 길었던 사람들이 사직한 것으로 추측할 수 있다.

프로젝트 수를 3개 맡은 사람들이 떠나는 비율이 가장 낮기 때문에 최적의 프로젝트 수라고 볼 수 있다.

일반적으로 주 52시간 근무에, 연간 2주 휴가가 적절한 근무시간이라고 한다면,

52시간 x (52주-2주) / 12개월 = <b>월 평균 약 217시간 근무가 적절한 시간</b>이라고 볼 수 있다.

이는 떠난 <b>4개 이상의 프로젝트를 맡고, 월간 기대 근무시간을 초과한 사람들이 과로로 인해 떠났다고 추측</b>해볼 수 있다.

### 직원 만족도와 근무 시간 관계 시각화

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/efd147cc-55f3-4a09-8c01-3f14fa85c998)


회사를 떠난 군집 3개가 뚜렷하게 드러난다.

1. 월 240~310시간 초과 근무하면서 만족도가 0에 가까운 군집. 사퇴한 것으로 추측할 수 있다.
2. 월 210~280시간 근무하면서 만족도가 0.7-0.9 사이의 군집. 이직한 것으로 추측할 수 있다.
3. 평균 근무 시간이 낮고 만족도 0.4 부근의 군집. 추측하기 어렵다.

### 재직 기간과 만족도 관계 시각화

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/fac09c9a-45f9-473d-ad71-64e4387a21ae)

떠난 사람들을 두 가지 그룹으로 분류해보면

1. 재직기간이 상대적으로 짧고, 만족도가 상대적으로 낮은 그룹
2. 5~6년 차에 만족도가 상대적으로 긴 그룹

4년차에 이례적으로 낮은 만족도에 회사를 떠난 집단은, 예상하기 어렵지만 어떠한 상황이 벌어진 것으로 추측할 수 있다.

가장 오래 근무한 집단은 아무도 떠나지 않을 것을 볼 수 있다.

### 재직 기간과 급여 관계 시각화

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/9d54b5a3-1dc9-4449-9940-25b92581ee5e)

10년차 직원들 중에 높은 급여를 받는 직원 비율이 높은 편이고, 나머지 다른 연차는 시각화만으로 특별한 패턴을 확인하기 어렵다.

### 성과 평과와 직원 만족도 관계 시각화

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/4004c9bf-d6a3-405a-8d4a-f87e85f80d14)

1. 성과가 높은데 만족도가 낮은 그룹
2. 성과는 평균인데 만족도가 0.4 부근인 그룹이 떠난 것으로 볼 수 있다.

### 부서 별 이직 비율 시각화

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/ed9b471e-4609-44fa-b1f8-e976153aef0b)

단순히 부서만 놓고 보았을 때 유의미한 관계를 확인할 수 없었다.

## Modeling and Evaluation

로지스틱 회귀모형, 의사결정나무, 랜덤포레스트., XGBoost 모델을 활용한, left 변수를 타겟 클래스로 하는 4가지 분류 모델을 구축하였다.

각 모델은 Grid Search를 활용하여 파라미터 최적화를 수행하였다. 

### Evaluation metrics (평가 지표)

- <b>Precision</b> 는 분류 결과 타겟 데이터를 양성으로 예측한 것들 중 실제로 타겟 데이터가 양성일 비율을 의미한다.
- <b>Recall</b> 는 타겟 데이터 값이 실제로 양성인 데이터 중에서 분류 결과 양성으로 예측되었을 비율을 의미한다.
- <b>Accuracy</b> 는 전체 데이터 중 분류가 올바르게 된 데이터의 비율을 의미한다.
- <b>F1-score</b> 는 precision 과 recall의 조화평균으로 계산한다.

### 트레이닝 셋을 기반으로 학습한 결과 주요 평가지표 

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/5da72a30-5ba7-4223-ae8f-acb6f6ffb957)

로지스틱 회귀 모델은 좋은 모델이라 볼 수 없는 분류 성능을 보였고,

트리 기반 모형 중에는 XGBoost가 가장 분류 성능을 보였다.

### 테스트 셋을 기반으로 평가한 결과 주요 평가지표 

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/7f14fe24-7102-4c7b-9b50-f20f5d701e85)

학습된 모델로 예측해본 결과 XGBoost 모델의 정밀도가 가장 높았지만, 재현율은 랜덤포레스트와 의사결정나무에 비해 근소하게 낮은 것을 볼 수 있다.

Data leakage를 감소 시키는 방향으로 Feature Engineering을 진행한 뒤 성능 향상을 기대하며 분류 작업도 진행해보았지만, 세 분류 모델 평가지표가 크게 하락하였기에 채택하지 않았다.

정밀도 기준으로 위 XGBoost 모델을 최종적으로 이직 예측 모델로 선정하였다.

### XGBoost 분류 모델 Feature Importances

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/e4eb7570-1d34-402c-a12d-a4fa9cfa7aeb)

satisfaction_level(만족도), tenure(재직기간), number_project(프로젝트 수), last_evaluation(성과 평가), average_monthly_hours(근무 시간)의 순서로 이직에 높은 영향을 미친 것을 확인하였다.

## Conclusion

분류 모델과 Feature Importance로부터 이 회사의 직원들은 과로하고 있다는 것을 확인하였다.

직원들의 이탈을 막기 위해서 분석 결과에 기반한 몇 가지 액션 아이템을 제안해본다.

- 직원이 작업할 수 있는 프로젝트의 수를 제한한다.
- 최소 4년 이상 회사에 근무한 직원의 승진을 고려해보거나, 4년 차 직원들의 애로사항을 면담을 통해 추가로 조사해본다.
- 직원들이 초과 근무한 것에 대해 명확하게 보상 해주거나, 초과 근무 하도록 요구하지 않는다.
- 초과 근무 수당 정책을 보다 명확하게 직원들에게 알리고, 기대 업무량 및 기대 휴가 일 수가 명확하지 않았다면, 그 기준을 명료하게 설정해야한다.
- 월 200시간 이상 초과 근무하는 직원들에게 높은 점수를 주어서는 안 되고, 더 많은 노력을 기울이는 직원들에게 비례적인 척도를 고려한다.

### 추가) RUSBoost - 클래스 불균형을 해결하기 위한 모델

RUSBoost는 Random Under-Sampling and Bagging의 약자로, 타겟 클래스 불균형 데이터 문제를 해결하기 위한 알고리즘이다.

![image](https://github.com/kosonkh7/Data_Analysis_Portfolio/assets/83086978/4fa35c9e-73f2-4f3e-bb5c-cc3f24629f01)

RUSBoost 모델을 활용했을 시 전반적인 분류 평가지표 점수가 더 높은 것을 확인하였다.

















