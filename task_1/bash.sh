#!/bin/bash

# Масив з URL вебсайтів для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу логів
logfile="website_status.log"

# Функція для перевірки доступності вебсайту за допомогою curl
check_website() {
    url=$1
    # Виконання HTTP GET запиту до вебсайту та збереження HTTP статус-коду
    status_code=$(curl -s -o /dev/null -w "%{http_code}" $url)
    if curl -s -L --head --request GET -w "%{http_code}\n" "$url" | grep -q "^200$"; then
        echo "$site is UP" >> "$logfile"
    else
        echo "$site is DOWN" >> "$logfile"
    fi
}

# Цикл для перевірки кожного вебсайту
for site in "${websites[@]}"; do
    check_website "$site"
done

# Виведення повідомлення про запис результатів у файл логів
echo "Результати перевірки записані у файл $logfile"
