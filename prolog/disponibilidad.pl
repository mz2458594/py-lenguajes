servicio(cardiologia).
servicio(dermatologia).
servicio(pediatria).

medico(juan, cardiologia).
medico(lucia, dermatologia).
medico(pedro, pediatria).

horario(juan, '10:00').
horario(juan, '11:00').
horario(lucia, '09:00').
horario(lucia, '10:00').
horario(pedro, '13:00').

reservado(juan, '10:00'). 

:- dynamic reservado/2.
:- dynamic diagnostico/4.



disponible(Medico, Hora) :- 
    horario(Medico, Hora),
    \+ reservado(Medico, Hora).

