# задача - создать 7 или больше папок по дням, в которых будут текстовые файлы с новостями.
# Названия файлов и папок любые
# По факту нужно код, который написали на занятии, вложить в цикл.
from bs4 import BeautifulSoup
import requests
import os

page = requests.get('http://classic.newsru.com/arch/')

parsed = BeautifulSoup(page.content, 'html.parser')
dayslinks = parsed.find_all('a', class_="arch-item-weekday") # на сайте наводим курсор на интересующую нас ссылку на новость,
# из меню правой кнопки мыши выбираем "просмотреть код", открывается окошко с кодом, и там как раз выделена нужная ссылка, например:
# <a href="/main/27nov2018/" class="arch-item-weekday">. Нам нужно найти все такие ссылки(их там 9).
daylinks_clear = [i['href'] for i in dayslinks] #сделаем список, в котором лежат только нужные ссылки, 9 штук - 9 дней
for link in daylinks_clear: # и с каждой ссылкой делаем следующее:
    main_link = "http://classic.newsru.com" + link # дописываем путь, чтоб ссылка была рабочей
    os.mkdir(link.replace('/', '.')) # создаем папку (в названии - ссылка, т.е. дата)
    page_inner = requests.get(main_link) # и дальше делаем всё то же самое, что делали на занятии (в файле lesson)
    parsed_inner = BeautifulSoup(page_inner.content, 'html.parser')
    pagelinks = parsed_inner.find_all('a', class_='explaincolumn')
    for i in pagelinks:
        print(i['href'])
    pagelinks_clear = [i['href'] for i in pagelinks]
    for i in pagelinks_clear:
            page_i = requests.get('http://classic.newsru.com' +i)
            parsed_i = BeautifulSoup(page_i.content, 'html.parser')
            all_rubbish = parsed_i.find_all('script')
            for m in all_rubbish:
                m.decompose()
            page_text = parsed_i.find('p')
            page_text_clear = page_text.get_text()
            with open("C:\mein\study\high_school\python\lesson9_5dec\\" + link.replace('/', '.') + '\\' + i.replace('/', '.')+".txt", 'w', encoding='utf8') as openfile:
                # записываем текст в файл, прописываем полный путь до файла, чтобы файл попал в папку, которую мы создали
                openfile.write(page_text_clear)
