#!/bin/bash

echo "🧪 Генерация тестовых событий для проверки алертинга..."

# Создание тестовых логов которые вызовут алерты
cat << 'EOF' >> /var/log/app/app.log
{"timestamp":"2024-01-15T11:00:00Z","level":"ERROR","message":"Authentication failed for user","context":{"correlation_id":"123e4567-e89b-12d3-a456-426614174010","user_id":"user123"},"client_ip":"192.168.1.100","http_status":"401"}
{"timestamp":"2024-01-15T11:00:01Z","level":"ERROR","message":"Database connection timeout","context":{"correlation_id":"123e4567-e89b-12d3-a456-426614174011","user_id":"user456"},"response_time":2500}
{"timestamp":"2024-01-15T11:00:02Z","level":"ERROR","message":"Permission denied","context":{"correlation_id":"123e4567-e89b-12d3-a456-426614174012","user_id":"user789"},"client_ip":"10.0.0.50","http_status":"403"}
{"timestamp":"2024-01-15T11:00:03Z","level":"ERROR","message":"Internal server error","context":{"correlation_id":"123e4567-e89b-12d3-a456-426614174013"},"http_status":"500"}
{"timestamp":"2024-01-15T11:00:04Z","level":"ERROR","message":"Service unavailable","context":{"correlation_id":"123e4567-e89b-12d3-a456-426614174014"},"http_status":"503"}
EOF

echo "✅ Тестовые логи добавлены"
echo "📊 Проверьте алерты в логах ElastAlert:"
echo "   docker logs elastalert --tail 20"
