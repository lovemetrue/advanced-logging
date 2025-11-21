#!/bin/bash

# Создание тестовых логов разных форматов
mkdir -p /var/log/app

# JSON логи
cat << 'EOF' > /var/log/app/app.log
{"timestamp":"2024-01-15T10:30:00Z","level":"INFO","message":"User login successful","context":{"correlation_id":"123e4567-e89b-12d3-a456-426614174000","user_id":"user123","session_id":"abc123def456ghi789jkl012mno345pqr"}}
{"timestamp":"2024-01-15T10:31:15Z","level":"ERROR","message":"Database connection failed","context":{"correlation_id":"123e4567-e89b-12d3-a456-426614174001","user_id":"user456"},"exception":{"class":"DatabaseException","message":"Connection refused","stacktrace":"..."}}
{"timestamp":"2024-01-15T10:32:00Z","level":"DEBUG","message":"SQL query executed","context":{"correlation_id":"123e4567-e89b-12d3-a456-426614174002"},"sql":{"query":"SELECT * FROM users WHERE id = ?","parameters":["user123"],"duration":45}}

# Текстовые логи сложного формата
cat << 'EOF' >> /var/log/app/app.log
2024-01-15T10:33:00Z INFO [thread-1] [123e4567-e89b-12d3-a456-426614174003] [user789] Processing request started
2024-01-15T10:33:01Z DEBUG [thread-1] SQL: SELECT * FROM orders WHERE user_id = ? [Parameters: [user789]]
2024-01-15T10:33:02Z INFO [thread-1] GET /api/orders 200 234ms
2024-01-15T10:33:05Z ERROR [thread-2] [123e4567-e89b-12d3-a456-426614174004] [user999] Payment processing failed
java.lang.NullPointerException: Cannot invoke "PaymentProcessor.process()" because "this.paymentProcessor" is null
	at com.example.OrderService.processPayment(OrderService.java:123)
	at com.example.OrderController.createOrder(OrderController.java:45)
EOF

echo "Тестовые логи созданы в /var/log/app/app.log"
