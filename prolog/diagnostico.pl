:- dynamic sintomas_paciente/2.

% Síntomas de enfermedades
sintoma(gripe, fiebre).
sintoma(gripe, tos).
sintoma(gripe, dolor_cabeza).
sintoma(gripe, congestion).

sintoma(covid, fiebre).
sintoma(covid, tos).
sintoma(covid, dificultad_respirar).
sintoma(covid, perdida_olfato).

sintoma(alergia, estornudos).
sintoma(alergia, picazon_ojos).
sintoma(alergia, congestion).

tiene(Paciente, Enfermedad) :-
    sintomas_paciente(Paciente, SintomasPaciente),
    sintoma(Enfermedad, _),  % Genera enfermedades posibles (gripe, covid, alergia)
    findall(S, sintoma(Enfermedad, S), SintomasEnfermedad),
    subset(SintomasEnfermedad, SintomasPaciente).  % Verifica que todos estén en el paciente

tiene_parcial(Paciente, Enfermedad, Coinciden) :-
    sintomas_paciente(Paciente, Lista),
    findall(S, (sintoma(Enfermedad, S), member(S, Lista)), Coinciden),
    Coinciden \= [].

% Regla subset/2 (ya la tienes)
subset([], _).
subset([H|T], Lista) :- member(H, Lista), subset(T, Lista).