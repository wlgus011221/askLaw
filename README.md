# 법령 문서 질의응답 시스템

AI 기반 법률 상담 서비스를 제공하는 웹 애플리케이션입니다. 전자정부프레임워크를 기반으로 한 프론트엔드와 커스터마이징된 LLM 모델을 활용한 법률 상담 시스템입니다.

## 📋 프로젝트 개요

이 프로젝트는 일반 사용자가 법률 관련 질문을 AI 챗봇을 통해 쉽게 상담받을 수 있도록 하는 시스템입니다. 전문적인 법률 지식을 기반으로 24시간 언제든지 법률 상담을 받을 수 있습니다.

### 주요 기능
- 🤖 AI 기반 법률 상담 챗봇
- 🌐 직관적인 웹 인터페이스
- 📱 반응형 디자인
- 🔒 개인정보 보호

## 🏗️ 프로젝트 구조

```
01. 개발환경 및 최종소스/
├── 01. LLM 모델/                    # LLM 모델 관련 코드
│   ├── 01.LLM_DataCollect.ipynb     # 데이터 수집 노트북
│   └── 02.GGUF.ipynb                # GGUF 변환 노트북  
├── 02. 전자정부프레임워크/           # 웹 애플리케이션 소스
│   ├── src/main/java/               # Java 소스 코드
│   ├── src/main/webapp/             # 웹 리소스 (JSP, CSS, JS)
│   └── pom.xml                      # Maven 설정 파일
```

## 🛠️ 기술 스택

### 프론트엔드
- **전자정부프레임워크 4.3.1**
- **Spring MVC 5.3.37**
- **JSP/JSTL**
- **Bootstrap & Font Awesome**
- **jQuery**

### 백엔드
- **Java 17**
- **Spring Framework 5.3.37**
- **Maven 3.x**

### AI/LLM
- **A.X-4.0-Light 모델** (GGUF 포맷)
- **Ollama** (모델 서빙)
- **Dify** (챗봇 프레임워크 - 로컬 설치)
- **Jupyter Notebook** (데이터 처리)

### 인프라
- **Docker** (Dify 컨테이너 실행)
- **Docker Compose** (멀티 컨테이너 관리)

## 🚀 설치 및 실행

### 0. WSL 2 환경 준비 (Windows 사용자)

#### 1. Windows 기능 활성화

1. **Windows 기능 켜기/끄기** 실행
   - 시작 메뉴 → "Windows 기능 켜기/끄기" 검색
2. **필수 기능 체크**:
   - ✅ **Hyper-V**
   - ✅ **Linux용 Windows 하위 시스템**
   - ✅ **가상 머신 플랫폼**
3. **다시 시작** 필요

#### 2. 가상머신 플랫폼 활성화

```cmd
# 관리자 권한으로 명령 프롬프트 실행 후 다음 명령어 실행

# Linux용 Windows 하위 시스템 활성화
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# 가상 머신 플랫폼 활성화
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

#### 3. WSL 2 설치
```cmd
# wsl 업데이트
wsl --update

# wsl 설치
wsl --install

# Ubuntu 설치 확인
wsl -l -v

# wsl 진입
wsl

# wsl 종료
exit
```

#### 4. WSL 환경에서 Docker 설치
```bash
# WSL Ubuntu 환경에서 실행
# 1. Docker 설치 (이미 되어 있다면 생략)
sudo apt update
sudo apt install -y docker.io docker-compose

# 2. Docker Compose v2 설치 (CLI 플러그인 방식)
mkdir-p ~/.docker/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

# 3. 버전 확인
docker compose version
```

### 1. 전자정부프레임워크 웹 애플리케이션

#### 필요 조건
- Java 17
- Maven 3.6 이상
- Tomcat 9.0 이상
- **WSL 2** (Windows Subsystem for Linux)
- Docker 및 Docker Compose (WSL 환경에서 Dify 실행용)
- 최소 8GB RAM 권장 (LLM 모델 + Dify)

#### 설치 과정
```bash
# 프로젝트 클론
git clone [repository-url]
cd "02. 전자정부프레임워크"

# 의존성 설치 및 빌드
mvn clean install

# 애플리케이션 실행 (Tomcat 서버 필요)
mvn tomcat7:run
```

### 2. LLM 모델 설정

#### Ollama 설치 및 모델 설정 (WSL 환경)
```bash
# ollama 폴더 생성
mkdir ollama
cd ollama

# WSL Ubuntu 환경에서 Ollama 설치
curl -fsSL https://ollama.ai/install.sh | sh

# 모델 디렉토리 생성
mkdir ax-4.0
cd ax-4.0

# A.X-4.0-Light 모델 다운로드
wget https://huggingface.co/limjh12/A.X-4.0-Light-GGUF/resolve/main/A.X-4.0-Light.gguf -O ax-4.0.gguf

# Modelfile 생성
cat > Modelfile << EOF
FROM ./ax-4.0.gguf
EOF

# 모델 생성 및 실행
ollama create ax-4.0 -f Modelfile
ollama run ax-4.0
```

### 3. Dify 로컬 설치 및 설정

#### Dify 로컬 설치 (WSL 환경에서 Docker 사용)
```bash
# WSL Ubuntu 환경에서 Dify 저장소 클론
git clone --branch "$(curl -s https://api.github.com/repos/langgenius/dify/releases/latest | jq -r .tag_name)" https://github.com/langgenius/dify.git
cd dify/docker
cp .env.example .env

# Docker Compose를 사용한 실행
docker compose up -d

# Dify 실행중인지 확인
docker compose ps
```

#### Dify 설정
1. **Dify 웹 인터페이스 접속**: `http://localhost/install` (Windows 브라우저에서 접속)
2. **관리자 계정 생성** 및 초기 설정
3. **WSL IP 주소 확인**:
   ```bash
   # WSL 환경에서 IP 주소 확인
   hostname -I
   ```
4. **모델 제공자 설정**:
   - Settings > Model Provider 이동
   - Ollama 추가
   - Base URL: `http://<WSL-IP-주소>:11434` (예: `http://172.28.176.1:11434`)
   - A.X-4.0 모델 선택
5. **챗봇 애플리케이션 생성**:
   - 새 앱 생성 > 채팅 플로우 템플릿 선택
   - A.X-4.0 모델 연결
   - 법률 상담에 맞는 프롬프트 설정
6. **웹 임베드 URL 생성**:
   - 앱 설정 > 웹 앱 > 임베드 코드 복사
   - `chat.jsp` 파일에서 iframe src 주소 업데이트

#### 필요 조건
- WSL 2 환경
- Docker 및 Docker Compose 설치 (WSL 환경)
- 최소 4GB RAM 권장
- Ollama 서버가 WSL 환경에서 실행 중이어야 함

## 🔄 전체 시스템 실행 순서

1. **Windows 기능 활성화** (GUI 또는 명령어 방식)
2. **가상머신 플랫폼 활성화** (명령어 방식)
3. **WSL 2 설치** (Ubuntu 권장)
4. **Docker 설치** (WSL 환경)
5. **Ollama 서버 실행** (WSL 환경, 포트 11434)
6. **Dify 서버 실행** (WSL 환경, 포트 80)
7. **전자정부프레임워크 웹 서버 실행** (Windows 환경, 포트 8080)
8. **Dify에서 챗봇 설정 및 임베드 URL 생성**
9. **`chat.jsp`에 임베드 URL 적용**

## 📱 사용 방법

1. **메인 페이지 접속**: `http://localhost:8080`
2. **상담 시작**: "상담하기" 버튼 클릭
3. **법률 상담**: 채팅창에서 법률 관련 질문 입력
4. **AI 응답**: 전문적인 법률 조언 제공

## 🔧 주요 컴포넌트

### 웹 컨트롤러
- `WebController.java`: 메인 페이지 및 채팅 페이지 라우팅

### 화면 구성
- `main.jsp`: 서비스 소개 및 메인 페이지
- `chat.jsp`: Dify 챗봇이 임베드된 채팅 페이지

### 데이터 처리
- `01.LLM_DataCollect.ipynb`: 법률 데이터 수집 및 전처리
- `02.GGUF.ipynb`: 모델 GGUF 포맷 변환

## ⚠️ 주의사항

- 본 시스템은 **일반적인 법률 정보 제공**을 목적으로 합니다
- 구체적인 법적 조언이 필요한 경우 **전문 변호사와 상담**하시기 바랍니다
- 개인정보 보호를 위해 민감한 개인정보는 입력하지 마십시오
- **WSL 환경**: Ollama와 Dify는 WSL 환경에서 실행되므로 Windows 방화벽 설정을 확인하세요
- **포트 충돌**: WSL과 Windows 간 포트 공유 시 충돌이 발생할 수 있습니다
- **WSL IP 주소**: WSL의 IP 주소는 재시작할 때마다 변경될 수 있으므로 `hostname -I` 명령어로 확인 후 Dify 설정을 업데이트해야 합니다

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 라이센스

이 프로젝트는 Apache License 2.0 하에 배포됩니다.

## 📞 문의사항

프로젝트에 대한 문의사항이나 이슈가 있으시면 GitHub Issues를 통해 연락주세요.

---

**개발환경**: 전자정부프레임워크 4.3.1 + Spring MVC  
**AI 모델**: A.X-4.0-Light (GGUF)  
**챗봇 프레임워크**: Dify  
**개발 도구**: Eclipse, Jupyter Notebook, Maven 
