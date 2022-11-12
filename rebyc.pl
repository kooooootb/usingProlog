﻿% Решение числового ребуса
% Пример:
% [D, O, N, A, L, D]
% +
% [G, E, R, A, L, D]
% =
% [R, O, B, E, R, T]
% Все буквы означают одну уникальную цифру

удалить(Элемент, Список, Список) :-
	nonvar(Элемент), !.
удалить(Элемент, [Элемент | Список], Список).
удалить(Элемент, [А | СписокДо], [А | СписокПосле]) :-
	удалить(Элемент, СписокДо, СписокПосле).
	
суммацифр(Ц1, Ц2, С, ПереносДо, ПереносПосле, ЦифрыДо, ЦифрыПосле) :-
	удалить(Ц1, ЦифрыДо, Циф),
	% Выбор доступной цифры для Ц1
	удалить(Ц2, Циф, Циф1),
	% Выбор доступной цифры для Ц2
	удалить(С, Циф1, ЦифрыПосле),
	% Выбор доступной цифры для С
	S is Ц1 + Ц2 + ПереносДо,
	С is S mod 10,
	ПереносПосле is S div 10.

сумма1([], [], [], 0, 0, Цифры, Цифры).
сумма1([Ц1 | Сл1], [Ц2 | Сл2], [С | Сум], ПереносДо, ПереносПосле, ЦифрыДо, ЦифрыПосле) :- 
	сумма1(Сл1, Сл2, Сум, ПереносДо, ПереносВнутри, ЦифрыДо, ЦифрыВнутри),
	суммацифр(Ц1, Ц2, С, ПереносВнутри, ПереносПосле, ЦифрыВнутри, ЦифрыПосле).

сумма(Сл1, Сл2, Сум) :-
	сумма1(Сл1, Сл2, Сум, 0, 0, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], _).

