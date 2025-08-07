# OpenCLIP 빠른 시작 가이드

OpenCLIP을 Docker 환경에서 빠르게 시작하는 방법을 설명합니다.

## 프로젝트 구조
```
open_clip/
├── Dockerfile          # NVIDIA PyTorch 기반 이미지
├── Dockerfile.ubuntu   # Ubuntu 기반 이미지
├── example.py          # 예제 코드
└── README.md          # 이 문서
```

## Docker 이미지 빌드

### 옵션 1: NVIDIA PyTorch 이미지 사용 (권장)
```bash
docker build -t open-clip:nvidia -f Dockerfile .
```

### 옵션 2: Ubuntu 이미지 사용 (예비 및 트러블슈팅용으로 제공)
```bash
docker build -t open-clip:ubuntu -f Dockerfile.ubuntu .
```

## 예제 실행

### 1. NVIDIA 이미지로 실행
```bash
docker run --gpus all open-clip:nvidia python /usr/src/example.py
```

### 2. Ubuntu 이미지로 실행
```bash
docker run --gpus all open-clip:ubuntu python /usr/src/example.py
```

## 예제 코드 설명

`example.py`는 다음 작업을 수행합니다:
1. ViT-B-32 모델 로드
2. 이미지와 텍스트 인코딩
3. 이미지-텍스트 유사도 계산
4. 결과 출력

### 출력 예시 및 결과
![](docs/CLIP.png)
```
Load ViT-B-32 (laion2b_s34b_b79k) model from OpenCLIP
Label probs: tensor([[9.9950e-01, 4.1207e-04, 8.5317e-05]])
```
이미지가 "a diagram"으로 99.95% 확률로 분류됨
별도 저장되는 파일 없이, stdout에서 결과를 확인할 수 있습니다.