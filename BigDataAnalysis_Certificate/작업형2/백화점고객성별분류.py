# 출력을 원하실 경우 print() 함수 활용
# 예시) print(df.head())

# getcwd(), chdir() 등 작업 폴더 설정 불필요
# 파일 경로 상 내부 드라이브 경로(C: 등) 접근 불가

# 데이터 파일 읽기 예제
import pandas as pd
import numpy as np

from sklearn.model_selection import train_test_split
from sklearn.metrics import roc_auc_score
from sklearn.preprocessing import RobustScaler

from sklearn.ensemble import RandomForestClassifier

pd.set_option('display.max_columns', None)

train = pd.read_csv("data/customer_train.csv")
test = pd.read_csv("data/customer_test.csv")

# 결측치 확인  - 환불금액에 결측치 다수 -> 0으로 변환
# print(test.isnull().sum())

train.환불금액 = train.환불금액.copy().fillna(0)
test.환불금액 = test.환불금액.copy().fillna(0)


# 상관관계 확인 - 총구매액과 최대구매액 사이 상관관계가 지나치게 높다. 둘 중 하나 제거
print(train.corr())


# 카테고리 컬럼 인코딩 - 우선 값 동일하게 만듦 -> 원핫인코딩
print(set(train.주구매상품.unique()) - set(test.주구매상품.unique()))
# print(train[train.주구매상품.str.contains("소형가전")])
train = train.loc[~train.주구매상품.str.contains("소형가전")]
# print(set(train.주구매상품.unique()) - set(test.주구매상품.unique()))

train = pd.get_dummies(train, drop_first=True)
test = pd.get_dummies(test, drop_first=True)
# print(help(pd.get_dummies))
# print(train.columns)


# 데이터 불균형 확인 - 여자가 남자보다 두 배 가까이 많다
# print(train.성별.value_counts())

# 모델링
x = train.drop(['회원ID', '성별', '총구매액'], axis=1)
y = train.성별
x_train, x_val, y_train, y_val = train_test_split(x, y, test_size=0.3, random_state=42, stratify=y)

rfc = RandomForestClassifier(random_state=42,  n_estimators=100)
rfc.fit(x_train, y_train)
predict = rfc.predict(x_val)
print(roc_auc_score(predict, y_val))

# 예측
rfc_final = RandomForestClassifier(random_state=42, n_estimators=100)
rfc_final.fit(x, y)
predict_final = rfc_final.predict(test.drop(['회원ID', '총구매액'], axis=1))
print(predict_final)

result = pd.DataFrame()
result['pred'] = predict_final
print(result['pred'].value_counts())

result.to_csv("result.csv", index=False)
print(result)

# 답안 제출 참고
# 아래 코드 예측변수 등은 개인별로 변경하여 활용
# pd.DataFrame변수.to_csv('result.csv', index=False)
