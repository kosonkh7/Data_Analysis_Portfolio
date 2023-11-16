# 출력을 원하실 경우 print() 함수 활용
# 예시) print(df.head())

# getcwd(), chdir() 등 작업 폴더 설정 불필요
# 파일 경로 상 내부 드라이브 경로(C: 등) 접근 불가

# 데이터 파일 읽기 예제
import pandas as pd
# from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from xgboost import XGBClassifier
from sklearn.metrics import roc_auc_score

train = pd.read_csv("data/customer_train.csv")
test = pd.read_csv("data/customer_test.csv")

# 데이터 3500개
# print(train.info())

# 타겟 불균형 확인 -> 0이 더 많음 (2184, 1316)
# print(train['성별'].value_counts())

def na(x):
	if x == 0:
		return 0
	else:
		return 1

# 환불 금액에 결측치 다수 -> 환불 여부로 변경
# print(train.isnull().sum())
# print(test.isnull().sum())
train.환불금액 = train.환불금액.fillna(0).apply(na)
test.환불금액 = test.환불금액.fillna(0).apply(na)

# 카테고리 컬럼 처리
categorical = ['주구매상품', '주구매지점']
#print(test[categorical[1]].value_counts())

# 주구매지점은 동일, 주구매상품은 train이 하나 더 많음 (제거해줄까)
# print(set(test[categorical[1]]) - set(train[categorical[1]]))
# print(set(train[categorical[1]]) - set(test[categorical[1]]))
# print(set(test[categorical[0]]) - set(train[categorical[0]]))
# print(set(train[categorical[0]]) - set(test[categorical[0]]))


train = pd.get_dummies(train, columns=categorical, drop_first=True)
test = pd.get_dummies(test, columns=categorical, drop_first=True)


# 모델링
x = train.drop(columns=['회원ID', '성별', '주구매상품_소형가전'])
y = train.성별

x_train, x_val, y_train, y_val = train_test_split(x, y, test_size=0.2, random_state=42, stratify=y)

rfc = RandomForestClassifier(random_state=42, max_depth=6)
rfc.fit(x_train, y_train)
predict_rfc = rfc.predict(x_val)
print(roc_auc_score(predict_rfc, y_val))

xgb = XGBClassifier(random_state=42, max_depth=15)
xgb.fit(x_train, y_train)
predict_xgb = xgb.predict(x_val)
print(roc_auc_score(predict_xgb, y_val))

# 예측





# 답안 제출 참고
# 아래 코드 예측변수 등은 개인별로 변경하여 활용
# pd.DataFrame변수.to_csv('result.csv', index=False)
