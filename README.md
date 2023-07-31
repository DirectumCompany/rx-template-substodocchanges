# rx-template-substodocchanges
Репозиторий с типовой разработкой «Подписка на изменение статуса документа».

## Описание
Решение позволяет настроить рассылку уведомлений о различных событиях по документам.

В рамках шаблона реализована возможность подписки на следующие типы документов: входящее и исходящие письма, договор, доп. соглашение, служебная записка, приказ и распоряжение.
![substodocchanges](https://github.com/DirectumCompany/rx-template-substodocchanges/assets/71367764/1c5b4eb7-b2d4-42de-9376-613ce1ea3bd9)

Состав объектов разработки:
* cправочник "Настройки уведомлений";
* фоновый процесс "Отправка уведомлений по документам".

Поскольку шаблон разработки не содержит перекрытий объектов коробочного решения, конфликты при публикации не возникнут. Это позволяет использовать функциональность, как при старте нового проекта, так и в ходе сопровождения существующих инсталляций системы.

## Варианты расширения функциональности на проектах
1.	Выдача прав всем сотрудникам на создание личных настроек.
2.	Добавление флажков "Неотключаемое" для каждого события. Если флажок установлен, то это уведомление нельзя отключить при настройке уведомлений для конкретного сотрудника. Поле доступно для редактирования только сотрудникам из роли "Администраторы".
3.	Вынесение списка настроек на обложку модуля "Документооборот".
4.	Добавление новых полей в группу «Изменение полей», в том числе для других типов документов. Запись в историю дополнительной информации при изменении этих полей.
5.	Расширение списка событий в ФП и справочнике, которые можно отследить по таблице dbo.Sungero_Content_DocHistory. В том числе добавление новых действий в историю работы с сущностями.

## Порядок установки
Для работы требуется установленный Directum RX версии 3.4 и выше. 

### Установка для ознакомления
1. Склонировать репозиторий rx-template-substodocchanges в папку.
2. Указать в _ConfigSettings.xml DDS:
```xml
<block name="REPOSITORIES">
  <repository folderName="Base" solutionType="Base" url="" />
  <repository folderName="RX" solutionType="Base" url="<адрес локального репозитория>" />
  <repository folderName="<Папка из п.1>" solutionType="Work" 
     url="https://github.com/DirectumCompany/rx-template-substodocchanges" />
</block>
```

### Установка для использования на проекте
Возможные варианты:

**A. Fork репозитория**
1. Сделать fork репозитория rx-template-substodocchanges для своей учетной записи.
2. Склонировать созданный в п. 1 репозиторий в папку.
3. Указать в _ConfigSettings.xml DDS:
``` xml
<block name="REPOSITORIES">
  <repository folderName="Base" solutionType="Base" url="" /> 
  <repository folderName="<Папка из п.2>" solutionType="Work" 
     url="<Адрес репозитория gitHub учетной записи пользователя из п. 1>" />
</block>
```

**B. Подключение на базовый слой.**

Вариант не рекомендуется, так как при выходе версии шаблона разработки не гарантируется обратная совместимость.
1. Склонировать репозиторий rx-template-substodocchanges в папку.
2. Указать в _ConfigSettings.xml DDS:
``` xml
<block name="REPOSITORIES">
  <repository folderName="Base" solutionType="Base" url="" /> 
  <repository folderName="<Папка из п.1>" solutionType="Base" 
     url="<Адрес репозитория gitHub>" />
  <repository folderName="<Папка для рабочего слоя>" solutionType="Work" 
     url="https://github.com/DirectumCompany/rx-template-substodocchanges" />
</block>
```

**C. Копирование репозитория в систему контроля версий.**

Рекомендуемый вариант для проектов внедрения.
1. В системе контроля версий с поддержкой git создать новый репозиторий.
2. Склонировать репозиторий rx-template-substodocchanges в папку с ключом `--mirror`.
3. Перейти в папку из п. 2.
4. Импортировать клонированный репозиторий в систему контроля версий командой:

`git push –mirror <Адрес репозитория из п. 1>`

