# Используем официальный образ Node.js
FROM node:18-alpine

# Устанавливаем pnpm
RUN npm install -g pnpm

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Устанавливаем зависимости с помощью pnpm
RUN pnpm install --frozen-lockfile

# Копируем исходный код
COPY . .

# Собираем проект
RUN pnpm build

# Указываем порт, который будет использовать приложение
EXPOSE 8080

# Команда для запуска приложения
CMD ["pnpm", "start"]
