﻿Перем юТест;
Перем СтруктураДанных;

#Область ЮнитТестирование

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	ВсеТесты.Добавить("АктКС2");
	ВсеТесты.Добавить("АктКС2_РегУчет");
	
	Возврат ВсеТесты;
	
КонецФункции

Процедура ПередЗапускомТеста() Экспорт
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	
КонецПроцедуры

Процедура ПередЗапускомНабораТестов() Экспорт
	
	СтруктураДанных = ПолучитьСтруктуруДанных();
	
КонецПроцедуры

Процедура ПослеЗапускаНабораТестов() Экспорт
	
	
КонецПроцедуры

Функция РазрешенСлучайныйПорядокВыполненияТестов() Экспорт
	
	Возврат Ложь;
	
КонецФункции

#КонецОбласти

Функция ДобавитьВСтруктуруДействияПриИзмененииКоличества(СтруктураДействий, Объект)
	
	СтруктураПересчетаСуммы = ОбработкаТабличнойЧастиКлиентСервер.ПолучитьСтруктуруПересчетаСуммыНДСВСтрокеТЧ(Объект);
	СтруктураДействий.Вставить("ПересчитатьСуммуНДС", СтруктураПересчетаСуммы);
	СтруктураДействий.Вставить("ПересчитатьСуммуСНДС", СтруктураПересчетаСуммы);
	СтруктураДействий.Вставить("ПересчитатьСуммуСУчетомРучнойСкидки", Новый Структура("Очищать, ИмяКоличества", Ложь, "Количество"));
	СтруктураДействий.Вставить("ПересчитатьСуммуСУчетомАвтоматическойСкидки", Новый Структура("Очищать", Истина));
	СтруктураДействий.Вставить("ОчиститьСуммуВзаиморасчетов");
	СтруктураДействий.Вставить("ПересчитатьСумму", "Количество");
	
КонецФункции

Процедура АктКС2() Экспорт
	
	ДокументОбъект = СтруктураДанных.Акт.ПолучитьОбъект();
	ДокументОбъект.Записать(РежимЗаписиДокумента.Проведение);
	
КонецПроцедуры

Процедура АктКС2_РегУчет() Экспорт
	
	СтруктураРеквизиты = Новый Структура("Ссылка, Дата, Организация", СтруктураДанных.Акт, Неопределено, Неопределено);
	РеглУчетПроведениеСервер.ОтразитьДокумент(СтруктураРеквизиты, Истина);
	
КонецПроцедуры	
	

Функция ПолучитьСтруктуруДанных()
	
	Структура = юТест.СоздатьДанныеПоМакетам(ЭтотОбъект, "Данные");
	
	Возврат Структура;
	
КонецФункции



