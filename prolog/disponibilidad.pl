servicio(cardiologia, 'https://mimed.do/media/blogs/n9wMqeTQHYFZReCz.jpg').
servicio(dermatologia, 'https://dermatologia-bagazgoitia.com/wp-content/uploads/2022/02/dermatologo-scaled.jpg').
servicio(pediatria, 'https://www.shutterstock.com/image-vector/stethoscope-baby-pediatric-health-services-260nw-2498667177.jpg').

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

