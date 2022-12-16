# from flask import Flask, render_template, flash, redirect, url_for, request, session, logging
from flask import Flask, render_template, flash, redirect, url_for, request, session, logging
import cx_Oracle
import json
# from js import console

# from flask_mysqldb import MySQL
from wtforms import Form, StringField, TextAreaField, PasswordField, validators, RadioField, SelectField, IntegerField
# from wtforms.fields.html5 import DateField
from passlib.hash import sha256_crypt
# from flask_script import Manager
from functools import wraps
# from datetime import datetime


app = Flask(__name__)
app.secret_key = "super secret key"
app.run(debug=True)
# app.config['TESTING'] = True
# app.run(threaded=True)
# app.logger.disabled = True


try:
    conexion= cx_Oracle.connect(
    user='Estudiante',
    password='123',
    dsn='localhost/orcl')

except  Exception as err:
    print('error en la conexion con la base de datos ',err)
else:
    print('Conectado a Oracle', conexion.version)


def is_logged_in(f):
	@wraps(f)
	def wrap(*args, **kwargs):
		if 'logged_in' in session:
			print('----------------INSESSION------------------------------')
			return f(*args, **kwargs)
		else:
			flash('Usuario no logueado, proceda a loguearse)', 'danger')
			return redirect(url_for('login'))
	return wrap

def is_trainor(f):
	@wraps(f)
	def wrap(*args, **kwargs):
		if session['prof'] == 2:
			return f(*args, **kwargs)
		else:
			flash('No eres entrenador para accesar esta pagina', 'danger')
			return redirect(url_for('login'))
	return wrap

def is_admin(f):
	@wraps(f)
	def wrap(*args, **kwargs):
		if session['prof'] == 3:
			return f(*args, **kwargs)
		else:
			flash('No eres administrador para accesar esta pagina', 'danger')
			return redirect(url_for('login'))
	return wrap



@app.route('/')
def index():
	return render_template('home.html')


@app.route('/clientes', methods = ['GET', 'POST','DELETE','PUT'])
@is_logged_in
def view_clientes():

	data=None

	if request.method == 'GET':

		try:
			cursor_view_users = conexion.cursor()
			users=cursor_view_users.execute('SELECT * FROM CLIENTES')
			data = users.fetchall()
			print(data)
			error=None
			cursor_view_users.close()

			cursor_view_membership = conexion.cursor()
			memberships=cursor_view_membership.execute('SELECT Num_membresia,Descripcion  FROM MEMBRESIAS')
			memberships.rowfactory = lambda *args: dict(zip([d[0] for d in memberships.description], args))
			data2 = memberships.fetchall()

	
			print(data2)
			error=None
			cursor_view_membership.close()


			return render_template('clientes.html', data=data, data2=data2,error=error)

		except  Exception as err:
			print('error obteniendo empleados ',err)
			data=('Error en el Query')
			error = 'Error obteniendo empleados ',err
			cursor_view_users.close()	
			flash(error, 'error')
			return redirect('/clientes')

	if request.method == 'POST':
		# name = form.name.data
		# count = form.count.data

		try:
			cursor_cliente = conexion.cursor()
			cursor_cliente.callproc('PK_Global.INSERTA_CLIENTES', [int(request.form.get("cedula")),request.form.get("nombre"),request.form.get("primer_apellido"),request.form.get("segundo_apellido"),int(request.form.get("membresia")),request.form.get("direccion"),request.form.get("correo")])
			conexion.commit()
			error=None
			cursor_cliente.close()
			flash('Cliente Agregado Exitosamente!!', 'success')
			return redirect('/clientes')
			# return render_template('clientes.html')

		except  Exception as err:
			error='Error Inyectando Cliente ',str(err)
			flash(error, 'warning')
			return redirect('/clientes')

	if request.method == 'DELETE':
		variables_from_web= request.get_json()
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('PK_Global.BORRA_CLIENTE', [variables_from_web['cedula']])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("DELETE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('clientes.html')

	if request.method == 'PUT':
		variables_from_web= request.get_json()
		print(variables_from_web)
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('PK_Global.ACTUALIZA_CLIENTES', [int(variables_from_web["cedula"]),variables_from_web["nombre"],variables_from_web["primer_apellido"],variables_from_web["segundo_apellido"],int(variables_from_web["membresia"]),variables_from_web["direccion"],variables_from_web["correo"]])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("UPDATE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('clientes.html')
















@app.route('/entrenadores', methods = ['GET', 'POST','DELETE','PUT'])
@is_logged_in
def view_entrenadores():

	data=None

	if request.method == 'GET':

		try:
			cursor_view_users = conexion.cursor()
			users=cursor_view_users.execute('SELECT * FROM ENTRENADORES')
			data = users.fetchall()
			print(data)
			error=None
			cursor_view_users.close()


			cursor_view_salarios = conexion.cursor()
			salarios=cursor_view_salarios.execute('SELECT * FROM SALARIOS')
			salarios.rowfactory = lambda *args: dict(zip([d[0] for d in salarios.description], args))
			data2 = salarios.fetchall()
			cursor_view_salarios.close()
			print(data2)



			return render_template('entrenadores.html', data=data,data2=data2,error=error)

		except  Exception as err:
			print('error obteniendo empleados ',err)
			data=('Error en el Query')
			error = 'Error obteniendo empleados ',err
			cursor_view_users.close()	
			flash(error, 'error')
			return redirect('/entrenadores')

	if request.method == 'POST':
		# name = form.name.data
		# count = form.count.data

		try:
			cursor_cliente = conexion.cursor()
			cursor_cliente.callproc('PK_Global.INSERTA_ENTRENADORES', [int(request.form.get("cedula")),request.form.get("nombre"),request.form.get("primer_apellido"),request.form.get("segundo_apellido"),int(request.form.get("salario")),request.form.get("direccion"),request.form.get("correo")])
			conexion.commit()
			error=None
			cursor_cliente.close()
			flash('Entrenador Agregado Exitosamente!!', 'success')
			return redirect('/entrenadores')
			# return render_template('entrenadores.html')

		except  Exception as err:
			error='Error Inyectando Entrenador ',str(err)
			flash(error, 'warning')
			return redirect('/entrenadores')

	if request.method == 'DELETE':
		variables_from_web= request.get_json()
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('PK_Global.BORRA_ENTRENADORES', [variables_from_web['cedula']])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("DELETE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('entrenadores.html')

	if request.method == 'PUT':
		variables_from_web= request.get_json()
		print(variables_from_web)
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('PK_Global.ACTUALIZA_ENTRENADORES', [int(variables_from_web["cedula"]),variables_from_web["nombre"],variables_from_web["primer_apellido"],variables_from_web["segundo_apellido"],int(variables_from_web["salario"]),variables_from_web["direccion"],variables_from_web["correo"]])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("UPDATE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('entrenadores.html')







@app.route('/administradores', methods = ['GET', 'POST','DELETE','PUT'])
@is_logged_in
def view_administradores():

	data=None

	if request.method == 'GET':

		try:
			cursor_view_users = conexion.cursor()
			users=cursor_view_users.execute('SELECT * FROM ADMINISTRADORES')
			data = users.fetchall()
			print(data)

			cursor_view_salarios = conexion.cursor()
			salarios=cursor_view_salarios.execute('SELECT * FROM SALARIOS')
			salarios.rowfactory = lambda *args: dict(zip([d[0] for d in salarios.description], args))
			data2 = salarios.fetchall()
			cursor_view_salarios.close()
			print(data2)

			error=None
			cursor_view_users.close()
			return render_template('administradores.html', data=data,data2=data2,error=error)

		except  Exception as err:
			print('error obteniendo empleados ',err)
			data=('Error en el Query')
			error = 'Error obteniendo empleados ',err
			cursor_view_users.close()	
			flash(error, 'error')
			return redirect('/administradores')

	if request.method == 'POST':
		# name = form.name.data
		# count = form.count.data

		try:
			cursor_cliente = conexion.cursor()
			cursor_cliente.callproc('PK_Global.INSERTA_ADMINISTRADORES', [int(request.form.get("cedula")),request.form.get("nombre"),request.form.get("primer_apellido"),request.form.get("segundo_apellido"),int(request.form.get("salario")),request.form.get("direccion"),request.form.get("correo")])
			conexion.commit()
			error=None
			cursor_cliente.close()
			flash('Administrador Agregado Exitosamente!!', 'success')
			return redirect('/administradores')
			# return render_template('administradores.html')

		except  Exception as err:
			error='Error Inyectando Administrador ',str(err)
			flash(error, 'warning')
			return redirect('/administradores')

	if request.method == 'DELETE':
		variables_from_web= request.get_json()
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('PK_Global.BORRA_ADMINISTRADORES', [variables_from_web['cedula']])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("DELETE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('administradores.html')

	if request.method == 'PUT':
		variables_from_web= request.get_json()
		print(variables_from_web)
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('PK_Global.ACTUALIZA_ADMINISTRADORES', [int(variables_from_web["cedula"]),variables_from_web["nombre"],variables_from_web["primer_apellido"],variables_from_web["segundo_apellido"],int(variables_from_web["salario"]),variables_from_web["direccion"],variables_from_web["correo"]])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("UPDATE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('administradores.html')



@app.route('/roles', methods = ['GET', 'POST','DELETE','PUT'])
@is_logged_in
def view_roles():

	data=None

	if request.method == 'GET':

		try:
			cursor_view_users = conexion.cursor()
			users=cursor_view_users.execute('SELECT * FROM ROLES')
			data = users.fetchall()
			print(data)

			error=None
			cursor_view_users.close()
			return render_template('roles.html', data=data,error=error)

		except  Exception as err:
			print('error obteniendo roles ',err)
			data=('Error en el Query')
			error = 'Error obteniendo roles ',err
			cursor_view_users.close()	
			flash(error, 'error')
			return redirect('/roles')

	if request.method == 'POST':
		# name = form.name.data
		# count = form.count.data

		try:
			cursor_cliente = conexion.cursor()
			cursor_cliente.callproc('INSERTA_ROLES', [request.form.get("descripcion")])
			conexion.commit()
			error=None
			cursor_cliente.close()
			flash('Agregado Exitosamente!!', 'success')
			return redirect('/roles')

		except  Exception as err:
			error='Error Inyectando rol ',str(err)
			flash(error, 'warning')
			return redirect('/roles')

	if request.method == 'DELETE':
		variables_from_web= request.get_json()
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('BORRA_ROLES', [variables_from_web['id']])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("DELETE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('roles.html')







@app.route('/rutinas', methods = ['GET', 'POST','DELETE','PUT'])
@is_logged_in
def view_rutinas():

	data=None

	if request.method == 'GET':

		try:
			cursor_view_users = conexion.cursor()
			users=cursor_view_users.execute('SELECT * FROM RUTINAS')
			data = users.fetchall()
			print(data)

			error=None
			cursor_view_users.close()
			return render_template('rutinas.html', data=data,error=error)

		except  Exception as err:
			print('error obteniendo rutinas ',err)
			data=('Error en el Query')
			error = 'Error obteniendo rutinas ',err
			cursor_view_users.close()	
			flash(error, 'error')
			return redirect('/rutinas')

	if request.method == 'POST':
		# name = form.name.data
		# count = form.count.data

		try:
			cursor_cliente = conexion.cursor()
			cursor_cliente.callproc('INSERTA_RUTINAS', [request.form.get("descripcion"),request.form.get("tipo")])
			conexion.commit()
			error=None
			cursor_cliente.close()
			flash('Agregado Exitosamente!!', 'success')
			return redirect('/rutinas')

		except  Exception as err:
			error='Error Inyectando rol ',str(err)
			flash(error, 'warning')
			return redirect('/rutinas')

	if request.method == 'DELETE':
		variables_from_web= request.get_json()
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('BORRA_RUTINAS', [variables_from_web['id']])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("DELETE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('rutinas.html')



@app.route('/salarios', methods = ['GET', 'POST','DELETE','PUT'])
@is_logged_in
def view_salarios():

	data=None

	if request.method == 'GET':

		try:
			cursor_view_users = conexion.cursor()
			users=cursor_view_users.execute('SELECT * FROM SALARIOS')
			data = users.fetchall()
			print(data)

			error=None
			cursor_view_users.close()
			return render_template('salarios.html', data=data,error=error)

		except  Exception as err:
			print('error obteniendo salarios ',err)
			data=('Error en el Query')
			error = 'Error obteniendo salarios ',err
			cursor_view_users.close()	
			flash(error, 'error')
			return redirect('/salarios')

	if request.method == 'POST':
		# name = form.name.data
		# count = form.count.data

		try:
			cursor_cliente = conexion.cursor()
			cursor_cliente.callproc('INSERTA_SALARIOS', [request.form.get("descripcion"),request.form.get("monto")])
			conexion.commit()
			error=None
			cursor_cliente.close()
			flash('Agregado Exitosamente!!', 'success')
			return redirect('/salarios')

		except  Exception as err:
			error='Error Inyectando rol ',str(err)
			flash(error, 'warning')
			return redirect('/salarios')

	if request.method == 'DELETE':
		variables_from_web= request.get_json()
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('BORRA_SALARIOS', [variables_from_web['id']])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("DELETE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('salarios.html')






@app.route('/membresias', methods = ['GET', 'POST','DELETE','PUT'])
@is_logged_in
def view_membresias():

	data=None

	if request.method == 'GET':

		try:
			cursor_view_users = conexion.cursor()
			users=cursor_view_users.execute('SELECT * FROM MEMBRESIAS')
			data = users.fetchall()
			print(data)

			error=None
			cursor_view_users.close()
			return render_template('membresias.html', data=data,error=error)

		except  Exception as err:
			print('error obteniendo membresias ',err)
			data=('Error en el Query')
			error = 'Error obteniendo membresias ',err
			cursor_view_users.close()	
			flash(error, 'error')
			return redirect('/membresias')

	if request.method == 'POST':
		# name = form.name.data
		# count = form.count.data

		try:
			cursor_cliente = conexion.cursor()
			cursor_cliente.callproc('INSERTA_MEMBRESIAS', [request.form.get("descripcion"),request.form.get("costo")])
			conexion.commit()
			error=None
			cursor_cliente.close()
			flash('Agregado Exitosamente!!', 'success')
			return redirect('/membresias')

		except  Exception as err:
			error='Error Inyectando rol ',str(err)
			flash(error, 'warning')
			return redirect('/membresias')

	if request.method == 'DELETE':
		variables_from_web= request.get_json()
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('BORRA_MEMBRESIAS', [variables_from_web['id']])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("DELETE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('membresias.html')







@app.route('/maquinas', methods = ['GET', 'POST','DELETE','PUT'])
@is_logged_in
def view_maquinas():

	data=None

	if request.method == 'GET':

		try:
			cursor_view_users = conexion.cursor()
			users=cursor_view_users.execute('SELECT * FROM MAQUINAS')
			data = users.fetchall()
			print(data)

			error=None
			cursor_view_users.close()
			return render_template('maquinas.html', data=data,error=error)

		except  Exception as err:
			print('error obteniendo maquinas ',err)
			data=('Error en el Query')
			error = 'Error obteniendo maquinas ',err
			cursor_view_users.close()	
			flash(error, 'error')
			return redirect('/maquinas')

	if request.method == 'POST':
		# name = form.name.data
		# count = form.count.data

		try:
			cursor_cliente = conexion.cursor()
			cursor_cliente.callproc('INSERTA_MAQUINAS', [request.form.get("descripcion"),request.form.get("tipo")])
			conexion.commit()
			error=None
			cursor_cliente.close()
			flash('Agregado Exitosamente!!', 'success')
			return redirect('/maquinas')

		except  Exception as err:
			error='Error Inyectando rol ',str(err)
			flash(error, 'warning')
			return redirect('/maquinas')

	if request.method == 'DELETE':
		variables_from_web= request.get_json()
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('BORRA_MAQUINAS', [variables_from_web['id']])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("DELETE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('maquinas.html')




@app.route('/pagos', methods = ['GET', 'POST','DELETE','PUT'])
@is_logged_in
def view_pagos():

	data=None

	if request.method == 'GET':

		try:
			cursor_view_users = conexion.cursor()
			users=cursor_view_users.execute('SELECT * FROM PAGOS')
			data = users.fetchall()
			print(data)

			error=None
			cursor_view_users.close()
			return render_template('pagos.html', data=data,error=error)

		except  Exception as err:
			print('error obteniendo pagos ',err)
			data=('Error en el Query')
			error = 'Error obteniendo pagos ',err
			cursor_view_users.close()	
			flash(error, 'error')
			return redirect('/pagos')

	if request.method == 'POST':
		# name = form.name.data
		# count = form.count.data

		try:
			cursor_cliente = conexion.cursor()
			cursor_cliente.callproc('INSERTA_PAGOS', [request.form.get("descripcion"),request.form.get("tipo")])
			conexion.commit()
			error=None
			cursor_cliente.close()
			flash('Agregado Exitosamente!!', 'success')
			return redirect('/pagos')

		except  Exception as err:
			error='Error Inyectando rol ',str(err)
			flash(error, 'warning')
			return redirect('/pagos')

	if request.method == 'DELETE':
		variables_from_web= request.get_json()
		cursor_cliente = conexion.cursor()
		cursor_cliente.callproc('BORRA_PAGOS', [variables_from_web['id']])
		conexion.commit()
		error=None
		cursor_cliente.close()
		print("DELETE REQUEST COMPLETADO", str(variables_from_web))
		return render_template('pagos.html')


@app.route('/login', methods = ['GET', 'POST'])
def login():

	if request.method == 'POST':
		usuario_form =str(request.form['username'])
		password_candidate = request.form['password']
		cur1 = conexion.cursor()

		try:
			cur1.execute("SELECT * FROM USUARIOS WHERE usuario LIKE :mybv", mybv=usuario_form)
			row = cur1.fetchone()
			print ('ROWWWW = ',row)
			cur1.close()
		except  Exception as err:			
			print ('Failed to select from EMP\n',err)


		if row is None:
			print('No records found')
			error = 'Usuario no encontrado en la BD'
			return render_template('login.html', error = error)

		password = row[2]

		print('passs',password)
		print('passs candidate',password_candidate)
		if password_candidate == password:
			session['logged_in'] = True
			session['username'] = row[1]
			session['prof'] = row[3]
			print('login success')
			print(session)
			flash('Login Completado', 'success')
			if session['prof'] == 3:
				return render_template('administradorDash.html', user = usuario_form)
			if session['prof'] == 2:
				return render_template('entrenadorDash.html', user = usuario_form)


			return render_template('clienteDash.html', user = usuario_form)
		else:
			error = 'Contrasena Incorrecta'
			return render_template('login.html', error = error)

	return render_template('login.html')


@app.route('/administradorDash/<username>')
@is_logged_in
def adminDash(username):

	return render_template('administradorDash.html',username = username)


@app.route('/entrenadorDash/<string:username>', methods = ['GET', 'POST'])
@is_logged_in
def trainorDash(username):
	return render_template('entrenadorDash.html',username = username)




@app.route('/clienteDash/<string:username>')
@is_logged_in
def memberDash(username):

	return render_template('clienteDash.html',username = username)



@app.route('/logout')
@is_logged_in
def logout():
	session.clear()
	flash('You are now logged out', 'success')
	return redirect(url_for('login'))
