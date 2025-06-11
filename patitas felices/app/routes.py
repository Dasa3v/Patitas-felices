from app import app
from flask import render_template

# Página principal
@app.route('/')
def index():
    return render_template('index.html')

# Secciones principales
@app.route('/perros')
def perros():
    return render_template('perros.html')

@app.route('/gatos')
def gatos():
    return render_template('gatos.html')

@app.route('/aves')
def aves():
    return render_template('aves.html')

# Subpáginas de perros
@app.route('/perros/crianza')
def perros_crianza():
    return render_template('subpaginas/perros/crianza.html')

@app.route('/perros/alimentacion')
def perros_alimentacion():
    return render_template('subpaginas/perros/alimentacion.html')

@app.route('/perros/paseos')
def perros_paseos():
    return render_template('subpaginas/perros/paseos.html')

@app.route('/perros/aseo')
def perros_aseo():
    return render_template('subpaginas/perros/aseo.html')

@app.route('/perros/medicacion')
def perros_medicacion():
    return render_template('subpaginas/perros/medicacion.html')

@app.route('/perros/adultos')
def perros_adultos():
    return render_template('subpaginas/perros/adultos.html')

# Subpáginas de gatos
@app.route('/gatos/crianza')
def gatos_crianza():
    return render_template('subpaginas/gatos/crianza.html')

@app.route('/gatos/alimentacion')
def gatos_alimentacion():
    return render_template('subpaginas/gatos/alimentacion.html')

@app.route('/gatos/paseos')
def gatos_paseos():
    return render_template('subpaginas/gatos/paseos.html')

@app.route('/gatos/aseo')
def gatos_aseo():
    return render_template('subpaginas/gatos/aseo.html')

@app.route('/gatos/medicacion')
def gatos_medicacion():
    return render_template('subpaginas/gatos/medicacion.html')

@app.route('/gatos/adultos')
def gatos_adultos():
    return render_template('subpaginas/gatos/adultos.html')

# Subpáginas de aves
@app.route('/aves/alimentacion')
def aves_alimentacion():
    return render_template('subpaginas/aves/alimentacion.html')

@app.route('/aves/paseos')
def aves_paseos():
    return render_template('subpaginas/aves/paseos.html')

@app.route('/aves/aseo')
def aves_aseo():
    return render_template('subpaginas/aves/aseo.html')

@app.route('/aves/medicacion')
def aves_medicacion():
    return render_template('subpaginas/aves/medicacion.html')

@app.route('/aves/adultos')
def aves_adultos():
    return render_template('subpaginas/aves/adultos.html')
