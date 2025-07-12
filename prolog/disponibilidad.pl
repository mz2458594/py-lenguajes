servicio(cardiologia, 'https://mimed.do/media/blogs/n9wMqeTQHYFZReCz.jpg').
servicio(dermatologia, 'https://dermatologia-bagazgoitia.com/wp-content/uploads/2022/02/dermatologo-scaled.jpg').
servicio(pediatria, 'https://www.shutterstock.com/image-vector/stethoscope-baby-pediatric-health-services-260nw-2498667177.jpg').
servicio(ginecologia, 'https://img.freepik.com/vector-gratis/ilustracion-concepto-ginecologia_23-2148653904.jpg').
servicio(traumatologia, 'https://centromedicoabc.com/storage/2024/06/traumatologia-y-ortopedia-que-es.webp').
servicio(neurologia, 'https://mimed.do/media/blogs/sYZYzd35Y1l0nvRr.jpg').

% Médicos y su especialidad
medico(juan, cardiologia).
medico(lucia, dermatologia).
medico(pedro, pediatria).
medico(maria, ginecologia).
medico(ricardo, traumatologia).
medico(silvia, neurologia).
medico(andres, cardiologia).
medico(sofia, pediatria).
medico(camila, ginecologia).

horario(juan, '10:00').
horario(juan, '11:00').
horario(andres, '12:00').
horario(andres, '13:00').

horario(lucia, '09:00').
horario(lucia, '10:00').

horario(pedro, '13:00').
horario(pedro, '14:00').
horario(sofia, '15:00').

horario(maria, '08:00').
horario(maria, '09:00').
horario(camila, '11:00').

horario(ricardo, '10:00').
horario(ricardo, '11:30').

horario(silvia, '16:00').
horario(silvia, '17:00').

% Horarios ya reservados
reservado(juan, '10:00').
reservado(pedro, '13:00').
reservado(maria, '09:00').

:- dynamic reservado/2.
:- dynamic diagnostico/4.



disponible(Medico, Hora) :- 
    horario(Medico, Hora),
    \+ reservado(Medico, Hora).

