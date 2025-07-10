servicio(cardiologia).
servicio(dermatologia).
servicio(pediatria).

medico(Juan, cardiologia).
medico(Lucia, dermatologia).
medico(Pedro, pediatria).

horario(dr_juan, '10:00').
horario(dr_juan, '11:00').
horario(dra_lucia, '09:00').
horario(dra_lucia, '10:00').
horario(dr_pedro, '13:00').

reservado(dr_juan, '10:00'). 

:- dynamic reservado/2.
:- dynamic diagnostico/4.



disponible(Medico, Hora) :- 
    horario(Medico, Hora),
    \+ reservado(Medico, Hora).

