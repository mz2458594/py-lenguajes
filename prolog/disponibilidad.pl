servicio(cardiologia, 'https://mimed.do/media/blogs/n9wMqeTQHYFZReCz.jpg').
servicio(dermatologia, 'https://dermatologia-bagazgoitia.com/wp-content/uploads/2022/02/dermatologo-scaled.jpg').
servicio(pediatria, 'https://www.shutterstock.com/image-vector/stethoscope-baby-pediatric-health-services-260nw-2498667177.jpg').
servicio(ginecologia, 'https://www.saludsavia.com/contenido/assets/images/2022/02/ginecologia.jpg').
servicio(traumatologia, 'https://www.traumatologiabogota.com.co/wp-content/uploads/2021/07/traumatologia.jpg').
servicio(neurologia, 'https://cdn-3.expansion.mx/dims4/default/3dc6cb6/2147483647/strip/true/crop/1200x800+0+0/resize/1200x800!/quality/90/?url=https%3A%2F%2Fcdn-3.expansion.mx%2Fa0%2Fff%2F9a5ef4024b8592ec65f7e2a8039a%2Fneuro.jpg').

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

