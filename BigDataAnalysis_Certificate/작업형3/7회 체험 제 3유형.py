# 출력을 원할 경우 print() 함수 활용
# 예시) print(df.head())

# getcwd(), chdir() 등 작업 폴더 설정 불필요
# 파일 경로 상 내부 드라이브 경로(C: 등) 접근 불가

import pandas as pd
import numpy as np

from sklearn.preprocessing import LabelEncoder
from scipy.stats import chi2_contingency

from statsmodels.formula.api import logit

data = pd.read_csv("data/Titanic.csv")

# 사용자 코딩
# 1번 문항
# Gender와 Survived 변수 간의 독립성 검정을 실시하였을 때, 카이제곱 통계량은?(반올림 소수 셋째자리까지 3)
le = LabelEncoder()
data.Gender = le.fit_transform(data.Gender)
# print(data.Gender.value_counts())

crosstab = pd.crosstab(data.Gender, data.Survived)
#print(crosstab)

chi2, pvalue, dof, ef = chi2_contingency(crosstab)
print(round(chi2, 3))

# 2번 문항
# Gender, SibSp, Parch, Fare를 독립변수로 사용하여 로지스틱회귀모형을 실시하였을 때 , Parch변수의 계수값은?

# x = data[['Gender', 'SibSp', 'Parch', 'Fare']]
# y = data.Survived

result = logit('Survived ~ Gender + SibSp + Parch + Fare', data=data).fit().summary()
print(result)
print(-0.201)

# 3번 문항
# 위의 2번 문제에서 추정된 로지스틱 회귀모형에서 SibSp변수가 한 단위 증가할 때 생존할 오즈비(Odds ratio)값은? (반올림하여 소수 셋째3까지 계산)

param = logit('Survived ~ Gender + SibSp + Parch + Fare', data=data).fit().params
print(np.exp(param))
print(0.702)

# 해당 화면에서는 제출하지 않으며, 문제 풀이 후 답안제출에서 결괏값 제출
