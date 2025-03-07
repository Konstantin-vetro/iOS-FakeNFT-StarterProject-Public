# Мобильное приложение FakeNFT

![3  Onboarding-2](https://github.com/Konstantin-vetro/iOS-FakeNFT-StarterProject-Public/assets/124914005/13660354-5faf-41df-af15-551a869a30fc)
![1  Профиль](https://github.com/Konstantin-vetro/iOS-FakeNFT-StarterProject-Public/assets/124914005/2c65780e-0819-448f-9142-f02f62b3ffa0)
![2](https://github.com/Konstantin-vetro/iOS-FakeNFT-StarterProject-Public/assets/124914005/712c37c5-052a-4b3f-87d8-167411d14cc5)
![3](https://github.com/Konstantin-vetro/iOS-FakeNFT-StarterProject-Public/assets/124914005/2e004ad6-f4f0-42b1-bedc-c423742bb873)
![4](https://github.com/Konstantin-vetro/iOS-FakeNFT-StarterProject-Public/assets/124914005/45bd8a20-88b1-43c7-9b9e-800e60cbefc6)
![5](https://github.com/Konstantin-vetro/iOS-FakeNFT-StarterProject-Public/assets/124914005/194e6aec-f512-453c-a38c-cece6aeb41b6)
![55](https://github.com/Konstantin-vetro/iOS-FakeNFT-StarterProject-Public/assets/124914005/c7ba1771-a8fe-4e0b-ab66-a611979c0b3a)

## Над проектом работали:

**["Skoch33" ](https://github.com/Skoch33)** - экран Профиля

**["AlekseiTinkov"](https://github.com/AlekseiTinkov)** - экран Корзины

**["Timur Taneev"](https://github.com/taneev)** - экран Каталога

Константин Ветров - экран Статистики, Onboarding

# Ссылки

[Дизайн Figma](https://www.figma.com/file/k1LcgXHGTHIeiCv4XuPbND/FakeNFT-(YP)?node-id=96-5542&t=YdNbOI8EcqdYmDeg-0)

# Назначение и цели приложения

Приложение помогает пользователям просматривать и покупать NFT (Non-Fungible Token). Функционал покупки иммитируется с помощью мокового сервера.

Цели приложения:

- просмотр коллекций NFT;
- просмотр и покупка NFT (иммитируется);
- просмотр рейтинга пользователей.

# Краткое описание приложения

- Приложение демонстрирует каталог NFT, структурированных в виде коллекций
- Пользователь может посмотреть информацию о каталоге коллекций, выбранной коллекции и выбранном NFT.
- Пользователь может добавлять понравившиеся NFT в избранное.
- Пользователь может удалять и добавлять товары в корзину, а также оплачивать заказ (покупка иммитируется).
- Пользователь может посмотреть рейтинг пользователей и информацию о пользователях.
- Пользователь может смотреть информацию и своем профиле, включая информацию об избранных и принадлежащих ему NFT.

Дополнительным (необязательным) функционалом являются:
- локализация
- тёмная тема
- статистика на основе Яндекс Метрики
- экран авторизации
- экран онбординга
- алерт с предложением оценить приложение
- сообщение о сетевых ошибках
- кастомный launch screen
- поиск по таблице/коллекции в своём эпике

# Функциональные требования

## Каталог
**Скринкаст**

https://www.loom.com/share/870dd08e1dc34fbba48788acfaa12342

**Экран каталога**

На экране каталога отображается таблица (UITableView), показывающая доступные коллекции NFT. Для каждой коллекции NFT отображается:
- обложка коллекции;
- название коллекции;
- количество NFT в коллекции.

Также на экране есть кнопка сортировки, при нажатии на которую пользователю предлагается выбрать один из доступных способов сортировки. Содержимое таблицы упорядочивается согласно выбранному способу.

Пока данные для показа не загружены, должен отображаться индикатор загрузки.

При нажатии на одну из ячеек таблицы пользователь попадает на экран выбранной коллекции NFT.

**Экран коллекции NFT**

Экран отображает информацию о выбранной коллекции NFT, и содержит:

- обложку коллекции NFT;
- название коллекции NFT;
- текстовое описание коллекции NFT;
- имя автора коллекции (ссылка на его сайт);
- коллекцию (UICollectionView) с информацией о входящий в коллекцию NFT.

При нажатии на имя автора коллекции открывается его сайт в вебвью.

Каждая ячейка коллекции содержит:
- изображение NFT;
- название NFT;
- рейтинг NFT;
- стоимость NFT (в ETH);
- кнопку для добавления в избранное / удаления из избранного (сердечко);
- кнопку добавления NFT в корзину / удаления NFT из корзины.

При нажатии на сердечко производится добавление NFT в избранное / удаление NFT из избранного.

При нажатии на кнопку добавления NFT в корзину / удаления NFT из корзины производится добавление или удаление NFT из заказа (корзины). Изображение кнопки при этом меняется, если NFT добавлено в заказ отображается кнопка с крестиком, если нет - кнопка без крестика.

При нажатии на ячейку открывается экран NFT.

**Экран NFT**

Экран частично реализуется наставником в ходе life coding. Реализация экрана студентами не требуется.

## Корзина
**Скринкаст**

https://www.loom.com/share/31f11a438b104fe6b6b0ac168935c04f?sid=1e54119c-3a96-4f64-b086-b10e3903c2ae

**Экран заказа**

На экране таблицы отображается таблица (UITableView) со списком добавленных в заказ NFT.
Для каждого NFT указаны:
- изображение;
- имя;
- рейтинг;
- цена;
- кнопка удаления из корзины.

При нажатии на кнопку удаления из корзины показывается экран подтверждения удаления, который содержит:
- изображение NFT;
- текст об удалении;
- кнопку подтверждения удаления;
- кнопку отказа от удаления.

Сверху на экране есть кнопка сортировки, при нажатии на которую пользователю предлагается выбрать один из доступных способов сортировки. Содержимое таблицы упорядочивается согласно выбранному способу.    

Внизу экрана расположена панель с количеством NFT в заказе, общей ценой и кнопкой оплаты.
При нажатии на кнопку оплаты происходит переход на экран выбора валюты.

Пока данные для показа не загружены или обновляются, должен отображаться индикатор загрузки.

**Экран выбора валюты**

Экран позволяет выбрать валюту для оплаты заказа.

Сверху экрана находится заголовок и кнопка возврата на предыдущий экран.
Под ним - коллекция UICollectionCell с доступными способами оплаты.
Для каждой валюты указывается:
- логотип;
- полное наименование;
- сокращенное наименование.

Внизу находится текст со ссылкой на пользовательское соглашение (ведет на https://yandex.ru/legal/practicum_termsofuse/ , открывается в вебвью).

Под текстом - кнопка оплаты, при ее нажатии посылается запрос на сервер. Если сервер ответил, что оплата прошла успешно, то показывается экран с информацией об этом и кнопкой возврата в корзину. В случае неуспешной оплаты показывается соответствующий экран с кнопками повтора запроса и возврата в корзину.

## Профиль

**Скринкаст**

https://www.loom.com/share/b78d2329e9864461a5371210c638683a

**Экран профиля**

Экран показывает информацию о пользователе. Он содержит:
- фото пользователя;
- имя пользователя;
- описание пользователя;
- таблицу (UITableView) с ячейками Мои NFT (ведет на экран NFT пользователя), Избранные NFT (ведет на экран с избранными NFT), Сайт пользователя (открывает в вебвью сайт пользователя).

В правом верхнем углу экрана находится кнопка редактирования профиля. Нажав на нее, пользователь видит всплывающий экран, на котором может отредактировать имя пользователя, описание, сайт и ссылку на изображение. Загружать само изображение через приложение не нужно, обновляется только ссылка на изображение.

**Экран Мои NFT**

Представляет собой таблицу (UITableView), каждая ячейка которой содержит:
- иконку NFT;
- название NFT;
- автора NFT;
- цену NFT в ETH.

Сверху на экране есть кнопка сортировки, при нажатии на которую пользователю предлагается выбрать один из доступных способов сортировки. Содержимое таблицы упорядочивается согласно выбранному способу.

В случае отсутствия NFT показывается соответствующая надпись.

**Экран Избранные NFT**

Содержит коллекцию (UICollectionView) c NFT, добавленными в избранное (лайкнутыми). Каждая ячейка содержит информацию об NFT:
- иконка;
- сердечко;
- название;
- рейтинг;
- цена в ETH.

Нажатие на сердечко удаляет NFT из избранного, содержимое коллекции при этом обновляется.

В случае отсутствия избранных NFT показывается соответствующая надпись.

## Статистика

**Скринкаст**
https://www.loom.com/share/69d81a6227864037be50e05800e2724b

**Экран рейтинга**

Экран отображает список пользователей. Он представляет собой таблицу (UITableView). Для каждого пользователя указываются:
- место в рейтинге;
- аватарка;
- имя пользователя;
- количество NFT.

Сверху на экране есть кнопка сортировки, при нажатии на которую пользователю предлагается выбрать один из доступных способов сортировки. Содержимое таблицы упорядочивается согласно выбранному способу.

При нажатии на одну из ячеек происходит переход на экран информации о пользователе.

**Экран информации о пользователе**

Экран отображает информацию о пользователе:

- фото пользователя;
- имя пользователя;
- описание пользователя.

Также он содержит кнопку перехода на сайт пользователя (открывается в вебвью) и возможность перехода на экран Коллекции пользователя.

**Экран коллекции пользователя**

Содержит коллекцию (UICollectionView) c NFT пользователя. Каждая ячейка содержит информацию об NFT:
- иконка;
- сердечко;
- название;
- рейтинг;
- стоимость NFT (в ETH);
- кнопку добавления NFT в корзину / удаления NFT из корзины.

# Сортировка данных

На экранах «Каталог», «Корзина», «Мои NFT», «Статистика» есть настройка сортировки. Выбранный пользователем порядок сортировки должен сохраняться локально на устройстве. После перезапуска приложения восстанавливается предыдущее значение.

**Значение сортировки по умолчанию:**
- экран «Каталог» — по количеству NFT;
- экран «Корзина» — по названию;
- экран «Мои NFT» — по рейтингу;
- экран «Статистика» — по рейтингу.
