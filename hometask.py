import os
poets = {
    'Пушкин':
        """Духовной жаждою томим,
        В пустыне мрачной я влачился, —
        И шестикрылый серафим
        На перепутье мне явился.""",
    'Пастернак':
        """Гул затих. Я вышел на подмостки.
        Прислонясь к дверному косяку,
        Я ловлю в далеком отголоске,
        Что случится на моем веку.
            """,
    'Тарковский':
        """Был домик в три оконца 
        В такой окрашен цвет, 
        Что даже в спектре солнца 
        Такого цвета нет. 
        Он был ещё спектральней, 
        Зелёный до того, 
        Что я в окошко спальни 
        Молился на него. 
         """,
    'Мандельштам':
        """Я вернулся в мой город, знакомый до слёз,
        До прожилок, до детских припухлых желёз.

        Ты вернулся сюда, так глотай же скорей
        Рыбий жир ленинградских речных фонарей"""
}

def getletter(name):
    l = name[0].lower()
    return l

def main(poets, d): 
    for p in poets.keys(): 
        l = getletter(p) 
        newfol = dirs(d,l) 
        fname = changename(newfol, p) 
        save(poets[p], fname)

def dirs(d, l):
    newfol = d + '/' + l 
    if l not in os.listdir(d):
        os.mkdir(newfol)
    return newfol

def changename(path_to_file, name_of_poet):
    n = path_to_file + '//' + name_of_poet + '.txt'
    return n

def save(text, fname): 
    with open(fname, 'w', encoding = 'utf-8') as auf:
        auf.write(text)
    return "success"

main(poets,'/Users/macbookpro/Downloads/new')