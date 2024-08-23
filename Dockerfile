# Sử dụng image chính thức của n8n
FROM n8nio/n8n

# Cài đặt các dependencies cần thiết cho Playwright
RUN apt-get update && apt-get install -y \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libxkbcommon0 \
    libgbm1 \
    && apt-get clean

# Cài đặt Playwright
RUN npm install -g playwright

# Thiết lập biến môi trường cho n8n (tuỳ chọn)
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=tientv
ENV N8N_BASIC_AUTH_PASSWORD=030292

# Copy toàn bộ source code vào container (nếu cần)
# COPY . .

# Chạy n8n
CMD ["n8n"]
