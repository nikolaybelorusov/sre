В проекте состоит из двух веб-приложений: одно на Python (Flask), другое на Go
1. файл конфигурации deployment.yaml создает Deployment, который управляет двумя контейнерами приложения, обеспечивая их автоматическое развертывание.
В поде будут запущены два контейнера:
sre-app:
Использует образ belnik/sre-app:latest.
Ожидает, что приложение будет работать на порту 8080.
Определены переменные окружения (ADMIN_USER, ADMIN_PASS).
Настроены проверки готовности (readinessProbe) и живости (livenessProbe) для мониторинга состояния контейнера.
sre-app-py:
Использует образ belnik/sre-app-py:latest.
Ожидает, что приложение будет работать на порту 3000.
Определены переменные окружения (APP_USER, APP_PASSWORD).
Также настроены проверки readinessProbe и livenessProbe

Для установки 
kubectl apply -f deployment.yaml

2. Файл sre-app-service.yaml описывает объект Kubernetes типа Service, который используется для управления доступом к подам (Pods) в кластере

Для установки 
kubectl apply -f sre-app-service.yaml

3. ingress-sre-app.yaml файл конфигурации создает Ingress, который управляет внешним доступом к сервису sre-app-service

Для установки 
kubectl apply -f ingress-sre-app.yaml
