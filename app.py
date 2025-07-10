from pyswip import Prolog
from flask import Flask, render_template, request, redirect


app = Flask(__name__)
prolog = Prolog()
prolog.consult('prolog/disponibilidad.pl')
try:
    prolog.consult('prolog/diagnostico.pl')
    print("✅ Cargado correctamente diagnostico.pl")
except Exception as e:
    print(f"❌ Error al cargar diagnostico.pl: {e}")

@app.route("/")
def index():
    servicios = ["cardiologia", "dermatologia", "pediatria"]
    return render_template("index.html", servicios=servicios)

@app.route("/medicos")
def medicos():
    servicio = request.args.get("servicio")
    medico_seleccionado = request.args.get('medico')
    
    resultados = list(prolog.query(f"medico(M, '{servicio}')"))
    medicos = [r["M"] for r in resultados]
    
    horarios = []
    if medico_seleccionado:
        resultados_horarios = list(prolog.query(f"disponible({medico_seleccionado}, H)"))
        horarios = [h["H"] for h in resultados_horarios]
    
    
    return render_template("medicos.html", 
                        servicio=servicio,
                        medicos=medicos,
                        medico=medico_seleccionado,
                        horarios=horarios)


# Reservar una cita
@app.route("/reservar", methods=["POST"])
def reservar():
    medico = request.form["medico"]
    hora = request.form["hora"]
    prolog.assertz(f"reservado({medico}, '{hora}')")
    return f"<h1>Cita reservada con {medico} a las {hora}</h1>"

@app.route("/citas")
def citas():
    medico = request.args.get("medico")
    
    if not medico:
        return "<h2>Debe proporcionar un medico</h2>"
    
    resultados = list(prolog.query(f"reservado({medico}, H)"))
    horarios_reservados = [r["H"] for r in resultados]
    
    return render_template("citas.html",
                           medico=medico,
                           reservas=horarios_reservados)


@app.route("/historial")
def historial():
    medico = request.args.get("medico")
    resultados = list(prolog.query(f"diagnostico(Paciente, {medico}, Hora, Enfermedad)"))
    return render_template("historial.html", medico=medico, diagnosticos=resultados)



@app.route("/formulario_diagnostico")
def formulario_diagnostico():
    medico = request.args.get("medico")
    hora = request.args.get("hora")
    return render_template("diagnostico.html", medico=medico, hora=hora)


@app.route("/diagnosticar", methods=["POST"])
def diagnosticar():
    nombre = request.form["nombre"]
    sintomas = request.form.getlist("sintomas")
    medico = request.form.get("medico")
    hora = request.form.get("hora")    
    nombre_prolog = nombre.lower().replace(" ", "_")

    # Insertar en Prolog
    sintomas_atomicos = "[" + ",".join(sintomas) + "]"
    prolog.retractall(f"sintomas_paciente({nombre_prolog}, _)")
    prolog.assertz(f"sintomas_paciente({nombre_prolog}, {sintomas_atomicos})")

    # Diagnóstico
    resultado = list(prolog.query(f"tiene({nombre_prolog}, E)"))
    enfermedades = {r["E"] for r in resultado}
    
    if enfermedades:
        for enf in enfermedades:
            prolog.assertz(f"diagnostico({nombre_prolog}, {medico}, '{hora}', {enf})")
    
    prolog.retractall(f"reservado({medico}, '{hora}')")

    return render_template("resultado.html",
                           enfermedades=enfermedades,
                           nombre=nombre,
                           medico=medico,
                           hora=hora)


if __name__ == '__main__':
    app.run(debug=True)