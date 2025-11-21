#!/bin/bash

echo "🚀 Настройка ElastAlert для мониторинга логов..."

# Создание директорий
mkdir -p elastalert/{rules,logs}

# Копирование конфигурационных файлов
cp elastalert-config.yaml elastalert/config.yaml

# Создание тестовых правил
cp elastalert-rules/*.yaml elastalert/rules/

echo "📋 Запуск ElastAlert..."
docker-compose -f docker-compose.elastalert.yml up -d

echo "⏳ Ожидание запуска ElastAlert..."
sleep 30

# Проверка статуса
echo "🔍 Проверка статуса ElastAlert..."
docker logs elastalert --tail 10

echo "✅ ElastAlert настроен и запущен"
echo "📊 Правила алертинга:"
echo "   - error-spike.yaml - обнаружение всплесков ошибок"
echo "   - slow-performance.yaml - мониторинг производительности"
echo "   - security-alerts.yaml - события безопасности"
echo "   - telegram-notifications.yaml - уведомления в Telegram"
