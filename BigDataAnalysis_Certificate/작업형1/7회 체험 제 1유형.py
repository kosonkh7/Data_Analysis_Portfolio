# 출력을 원할 경우 print() 함수 활용
# 예시) print(df.head())

# getcwd(), chdir() 등 작업 폴더 설정 불필요
# 파일 경로 상 내부 드라이브 경로(C: 등) 접근 불가

import pandas as pd
from sklearn.preprocessing import MinMaxScaler

data = pd.read_csv("data/mtcars.csv")

max = data.qsec.max()
min = data.qsec.min()

data['qsec_scale'] = (data['qsec']-min) / (max-min)

# print(data['qsec_scale'].describe())

print(data[data['qsec_scale']>0.5]['qsec_scale'].size)

# 9



# 사용자 코딩

# 해당 화면에서는 제출하지 않으며, 문제 풀이 후 답안제출에서 결괏값 제출
