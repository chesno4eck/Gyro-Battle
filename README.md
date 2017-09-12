# Gyro-Battle
Игра на двоих человек.

У каждого должно быть iOS-устройство.

Устройства соединятются по Bluetooth.

## Геймплей
Перед обоими игроками одновременно появляются два одинаковых изображения, одно из них 
крутится в соответствии с показаниями акселерометра 
(например низ изображения направлен на землю вне зависимости от положения телефона),
второе изображение неподвижно и имеет альфа-канал 0,3.

На первом уровне в качестве изображения подойдет, например, обычная стрелка.
Дальше изображения будут усложняться, так, чтобы сложнее было понять как их соединить.

После того как первый игрок соединил изображения запускается счетчик времени. Как
только второй человек соединяет картинки, появляется короткая перебивка (1 сек),
с результатом на сколько первый обогнал второго. Результат запоминается.

Появляется вторая пара изображений. История повторяется.

После серии из 5-10 картинок объявляется победитель -- тот человек, 
которой затратил сумарно меньше времени.

### Дополнительные особенности:
* После того как первый игрок соединил картинки он должен держать телефон в таком положении
 до конца раунда (пока второй не соединит свои пикчи).
* Как вариант можно не соединять 2 картинки, а достигать "гармоничности" двух
изображений.
* "Неподвижное" изображение может медленно крутиться.

## Идеи для раундов
* Лицо с долларовой купюры
* Круг с вырезанными сегментами
* Моделька iPhone
* Значок Telegram
* Рандомные сгенерированные фигуры
* Логотип Apple
