# Запускаем тесты и создаем отчет
newman run WMS.postman_collection.json -e myWarehouse.postman_environment.json -r allure --reporter-allure-export allure-results
allure generate allure-results -o allure-report --clean

# Подготавливаем отчет для GitHub Pages
cd allure-report

# Создаем файл .nojekyll (для корректной работы с GitHub Pages)
New-Item -ItemType File -Name ".nojekyll" -Force

# Инициализируем Git в папке с отчетом
git init
git add .
git commit -m "Update Allure report"

# Пушим в ветку gh-pages
git push -f https://github.com/kreotiff/api-test-reports.git master:gh-pages

cd ..