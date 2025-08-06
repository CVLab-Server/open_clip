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

### 옵션 1: NVIDIA PyTorch 이미지 사용 (GPU 최적화)
```bash
docker build -t open-clip:nvidia -f Dockerfile .
```

### 옵션 2: Ubuntu 이미지 사용
```bash
docker build -t open-clip:ubuntu -f Dockerfile.ubuntu .
```

## 예제 실행

### 1. NVIDIA 이미지로 실행 (GPU 사용 시)
```bash
docker run --gpus all -it open-clip:nvidia python /usr/src/example.py
```

### 2. Ubuntu 이미지로 실행 (GPU 사용 시)
```bash
docker run --gpus all -it open-clip:ubuntu python /usr/src/example.py
```

## 예제 코드 설명

`example.py`는 다음 작업을 수행합니다:
1. ViT-B-32 모델 로드
2. 이미지와 텍스트 인코딩
3. 이미지-텍스트 유사도 계산
4. 결과 출력

### 출력 예시
![](docs/CLIP.png)
```
Label probs: tensor([[9.9950e-01, 4.1207e-04, 8.5317e-05]])
```
이미지가 "a diagram"으로 99.95% 확률로 분류됨

## 참고 사항

- GPU 사용 시 NVIDIA Docker runtime이 필요합니다
- 더 자세한 문서는 `_README.md`를 참조하세요