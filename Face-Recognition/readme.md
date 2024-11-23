# 내 얼굴을 인식하는 분류 + 영역 탐지 시각지능 모델 구축
# Overview
**목적**: 사내 보안을 위한 얼굴 인식 시스템 구축 <br>
**목표**: 영역과 분류가 라벨링된 얼굴 데이터, 그리고 내 얼굴 데이터를 활용하여 사전 학습된 영역 검출 분류 모델 Fine-Tuning <br>

# Business Understanding


# Data Understanding
활용 데이터:  <br>

# Modeling and Evaluation

# Conclusion

여러분은 노트북에서 얼굴 인식 파일을 실행시키기 위해 사전 학습 모델을 만들어야 합니다.

그 전에 가지고 있는 데이터셋을 학습에 적합한 형태로 만들어야 합니다.

1) 데이터셋을 불러옵니다.
데이터셋은 2가지입니다. 본인의 얼굴 이미지 파일, 다른 사람의 얼굴 이미지 파일.
2) 데이터셋을 전처리합니다.
Keras에는 실제로 존재하는 이미지 데이터를 처리해주는 함수가 있습니다.

데이터셋을 학습에 적합한 형태로 만들었다면, FaceNet 모델로 Transfer Learning을 수행합니다.

1) FaceNet 모델 구조를 생성.
FaceNet 논문 링크 https://arxiv.org/abs/1503.03832
FaceNet의 Input은 (160, 160) 사이즈의 이미지.
2) FaceNet 모델 구조 + 구조 추가
FaceNet의 Output은 128차원의 벡터. 이 과정을 Transfer Learning.

학습된 모델로 추론하여 성능 지표를 확인하고 모델을 개선시키세요.

그 후, 모델의 구조와 가중치를 반드시 저장하여 여러분의 노트북에 옮기세요.

1) 다양한 모델을 사용해보세요.
모델에 정해진 정답은 없습니다.
성능 지표에서 무엇이 중요한지 깊게 생각하세요.
사전 학습된 FaceNet 모델을 사용하셔도 좋고, 아예 독창적으로 여러분만의 모델을 만드셔도 좋습니다!
2) 모델을 반드시 저장하세요.
.keras 형태로 우선 Colab에 저장하세요.
Colab에 생성된 .keras 파일을 로컬에 다운로드 합니다.


데이터셋
https://www.kaggle.com/datasets/jessicali9530/lfw-dataset
lfw-deepfunneled.zip : Labeled Faces in the Wild 데이터셋
내 얼굴 데이터

UltraLytics YOLO-cls
이미지 분류 데이터 세트 개요 https://docs.ultralytics.com/ko/datasets/classify/
이미지 분류 https://docs.ultralytics.com/ko/tasks/classify/    
세부 모델로 n, s, m, l, x가 있다. n이 가장 빠르고, x가 가장 연산량이 많다.
모델 학습 설정 https://docs.ultralytics.com/ko/modes/train/#train-settings
추론 파라미터 https://docs.ultralytics.com/ko/modes/predict/#inference-sources



