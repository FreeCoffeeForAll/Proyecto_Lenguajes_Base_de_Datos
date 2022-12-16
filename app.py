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


# import logging
# log = logging.getLogger('werkzeug')
# log.setLevel(logging.ERROR)
# log.disabled = True



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

# app.config['MYSQL_HOST'] = 'localhost'
# app.config['MYSQL_USER'] = 'root'
# app.config['MYSQL_PASSWORD'] = 'eswar@259522'
# app.config['MYSQL_DB'] = 'Gym'
# app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

# mysql = MySQL(app)

def is_logged_in(f):
	@wraps(f)
	def wrap(*args, **kwargs):
		if 'logged_in' in session:
			print('----------------INSESSION------------------------------')
			return f(*args, **kwargs)
		else:
			flash('Nice try, Tricks don\'t work, bud!! Please Login :)', 'danger')
			return redirect(url_for('login'))
	return wrap

# def is_trainor(f):
# 	@wraps(f)
# 	def wrap(*args, **kwargs):
# 		if session['prof'] == 3:
# 			return f(*args, **kwargs)
# 		else:
# 			flash('You are probably not a trainor!!, Are you?', 'danger')
# 			return redirect(url_for('login'))
# 	return wrap

# def is_admin(f):
# 	@wraps(f)
# 	def wrap(*args, **kwargs):
# 		if session['prof'] == 1:
# 			return f(*args, **kwargs)
# 		else:
# 			flash('You are probably not an admin!!, Are you?', 'danger')
# 			return redirect(url_for('login'))
# 	return wrap

# def is_recep_level(f):
# 	@wraps(f)
# 	def wrap(*args, **kwargs):
# 		if session['prof'] <= 2:
# 			return f(*args, **kwargs)
# 		else:
# 			flash('You are probably not an authorised to view that page!!', 'danger')
# 			return redirect(url_for('login'))
# 	return wrap


@app.route('/')
def index():
	# print('Conectado a Oracle', conexion.version)

	# cur = conexion.cursor()

	# cur.close()

	return render_template('home.html')


@app.route('/clientes', methods = ['GET', 'POST','DELETE','PUT'])
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
			return render_template('clientes.html', data=data,error=error)

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
			return render_template('entrenadores.html', data=data,error=error)

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
def view_administradores():

	data=None

	if request.method == 'GET':

		try:
			cursor_view_users = conexion.cursor()
			users=cursor_view_users.execute('SELECT * FROM ADMINISTRADORES')
			data = users.fetchall()
			print(data)
			error=None
			cursor_view_users.close()
			return render_template('administradores.html', data=data,error=error)

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
			session['username'] = usuario_form
			session['prof'] = 0
			print('login success')
			flash('You are logged in', 'success')
			if session['prof'] == 1:
				return redirect(url_for('adminDash'))
			if session['prof'] == 3:
				return redirect(url_for('trainorDash'))

			return render_template('memberDash.html', user = usuario_form)
		else:
			error = 'Contrasena Incorrecta'
			return render_template('login.html', error = error)

	return render_template('login.html')


@app.route('/memberDash/<username>')
@is_logged_in
def memberDash(username):

	return render_template('memberDash.html',user = username)
	# return render_template('memberDash.html',user = username, plan = plan, scheme = scheme, progress = progress, good = good, poor = poor, average = average)


# class ChangePasswordForm(Form):
# 	old_password = PasswordField('Existing Password')
# 	new_password = PasswordField('Password', [
# 		validators.DataRequired(),
# 		validators.EqualTo('confirm', message = 'Passwords aren\'t matching pal!, check \'em')
# 	])
# 	confirm = PasswordField('Confirm Password')


# @app.route('/update_password/<string:username>', methods = ['GET', 'POST'])
# def update_password(username):
# 	form = ChangePasswordForm(request.form)
# 	if request.method == 'POST' and form.validate():
# 		new = form.new_password.data
# 		entered = form.old_password.data
# 		cur = mysql.connection.cursor()
# 		cur.execute("SELECT password FROM info WHERE username = %s", [username])
# 		old = (cur.fetchone())['password']
# 		if sha256_crypt.verify(entered, old):
# 			cur.execute("UPDATE info SET password = %s WHERE username = %s", (sha256_crypt.encrypt(new), username))
# 			mysql.connection.commit()
# 			cur.close()
# 			flash('New password will be in effect from next login!!', 'info')
# 			return redirect(url_for('memberDash', username = session['username']))
# 		cur.close()
# 		flash('Old password you entered is wrong!!, try again', 'warning')
# 	return render_template('updatePassword.html', form = form)

# @app.route('/adminDash')
# @is_logged_in
# @is_admin
# def adminDash():
# 	return render_template('adminDash.html')

# values = []
# choices = []

# class AddTrainorForm(Form):
# 	name = StringField('Name', [validators.Length(min = 1, max = 100)])
# 	username = StringField('Username', [validators.InputRequired(), validators.NoneOf(values = values, message = "Username already taken, Please try another")])
# 	password = PasswordField('Password', [
# 		validators.DataRequired(),
# 		validators.EqualTo('confirm', message = 'Passwords aren\'t matching pal!, check \'em')
# 	])
# 	confirm = PasswordField('Confirm Password')
# 	street = StringField('Street', [validators.Length(min = 1, max = 100)])
# 	city = StringField('City', [validators.Length(min = 1, max = 100)])
# 	prof = 3
# 	phone = StringField('Phone', [validators.Length(min = 1, max = 100)])


@app.route('/addTrainor', methods = ['GET', 'POST'])
# @is_logged_in
# @is_admin
def addTrainor():
# 	values.clear()
# 	cur = mysql.connection.cursor()
# 	q = cur.execute("SELECT username FROM info")
# 	b = cur.fetchall()
# 	for i in range(q):
# 		values.append(b[i]['username'])
# 	#app.logger.info(b[0]['username'])
# 	#res = values.fetchall()
# 	#app.logger.info(res)
# 	cur.close()
# 	form = AddTrainorForm(request.form)
# 	if request.method == 'POST' and form.validate():
# 		#app.logger.info("setzdgxfhcgjvkhbjlkn")
# 		name = form.name.data
# 		username = form.username.data
# 		password = sha256_crypt.encrypt(str(form.password.data))
# 		street = form.street.data
# 		city = form.city.data
# 		prof = 2
# 		phone = form.phone.data

# 		cur = mysql.connection.cursor()

# 		cur.execute("INSERT INTO info(name, username, password, street, city, prof, phone) VALUES(%s, %s, %s, %s, %s, %s, %s)", (name, username, password, street, city, 3,phone))
# 		cur.execute("INSERT INTO trainors(username) VALUES(%s)", [username])
# 		mysql.connection.commit()
# 		cur.close()
# 		flash('You recruited a new Trainor!!', 'success')
# 		return redirect(url_for('adminDash'))
	return render_template('addTrainor.html')



# class DeleteRecepForm(Form):
# 	username = SelectField(u'Choose which one you wanted to delete', choices=choices)



# @app.route('/deleteTrainor', methods = ['GET', 'POST'])
# @is_logged_in
# @is_admin
# def deleteTrainor():
# 	choices.clear()
# 	cur = mysql.connection.cursor()
# 	q = cur.execute("SELECT username FROM trainors")
# 	b = cur.fetchall()
# 	for i in range(q):
# 		tup = (b[i]['username'],b[i]['username'])
# 		choices.append(tup)
# 	form = DeleteRecepForm(request.form)
# 	if len(choices)==1:
# 		flash('You cannot remove your only Trainor!!', 'danger')
# 		return redirect(url_for('adminDash'))
# 	if request.method == 'POST':
# 		#app.logger.info(form.username.data)
# 		username = form.username.data
# 		q = cur.execute("SELECT username FROM trainors WHERE username != %s", [username])
# 		b = cur.fetchall()
# 		new = b[0]['username']
# 		cur.execute("UPDATE members SET trainor = %s WHERE trainor = %s", (new, username))
# 		cur.execute("DELETE FROM trainors WHERE username = %s", [username])
# 		cur.execute("DELETE FROM info WHERE username = %s", [username])
# 		mysql.connection.commit()
# 		cur.close()
# 		choices.clear()
# 		flash('You removed your Trainor!!', 'success')
# 		return redirect(url_for('adminDash'))
# 	return render_template('deleteRecep.html', form = form)


# @app.route('/addRecep', methods = ['GET', 'POST'])
# @is_logged_in
# @is_admin
# def addRecep():
# 	values.clear()
# 	cur = mysql.connection.cursor()
# 	q = cur.execute("SELECT username FROM info")
# 	b = cur.fetchall()
# 	for i in range(q):
# 		values.append(b[i]['username'])
# 	#app.logger.info(b[0]['username'])
# 	#res = values.fetchall()
# 	#app.logger.info(res)
# 	cur.close()
# 	form = AddTrainorForm(request.form)
# 	if request.method == 'POST' and form.validate():
# 		#app.logger.info("setzdgxfhcgjvkhbjlkn")
# 		name = form.name.data
# 		username = form.username.data
# 		password = sha256_crypt.encrypt(str(form.password.data))
# 		street = form.street.data
# 		city = form.city.data
# 		phone = form.phone.data

# 		cur = mysql.connection.cursor()

# 		cur.execute("INSERT INTO info(name, username, password, street, city, prof, phone) VALUES(%s, %s, %s, %s, %s, %s, %s)", (name, username, password, street, city, 2,phone))
# 		cur.execute("INSERT INTO receps(username) VALUES(%s)", [username])
# 		mysql.connection.commit()
# 		cur.close()
# 		flash('You recruited a new Receptionist!!', 'success')
# 		return redirect(url_for('adminDash'))
# 	return render_template('addRecep.html', form=form)

# class DeleteRecepForm(Form):
# 	username = SelectField(u'Choose which one you wanted to delete', choices=choices)



# @app.route('/deleteRecep', methods = ['GET', 'POST'])
# @is_logged_in
# @is_admin
# def deleteRecep():
# 	choices.clear()
# 	cur = mysql.connection.cursor()
# 	q = cur.execute("SELECT username FROM receps")
# 	b = cur.fetchall()
# 	for i in range(q):
# 		tup = (b[i]['username'],b[i]['username'])
# 		choices.append(tup)
# 	if len(choices)==1:
# 		flash('You cannot remove your only receptionist!!', 'danger')
# 		return redirect(url_for('adminDash'))
# 	form = DeleteRecepForm(request.form)
# 	if request.method == 'POST':
# 		#app.logger.info(form.username.data)
# 		username = form.username.data
# 		cur.execute("DELETE FROM receps WHERE username = %s", [username])
# 		cur.execute("DELETE FROM info WHERE username = %s", [username])
# 		mysql.connection.commit()
# 		cur.close()
# 		choices.clear()
# 		flash('You removed your receptionist!!', 'success')
# 		return redirect(url_for('adminDash'))
# 	return render_template('deleteRecep.html', form = form)


# class AddEquipForm(Form):
# 	nombre = StringField('Name', [validators.Length(min = 1, max = 100)])
# 	apellido = IntegerField('Count', [validators.NumberRange(min = 1, max = 25)])


# @app.route('/addEquip', methods = ['GET', 'POST'])
# @is_logged_in
# @is_admin
# def addEquip():
# 	form = AddEquipForm(request.form)
# 	if request.method == 'POST' and form.validate():
# 		name = form.name.data
# 		count = form.count.data
# 		cur = mysql.connection.cursor()
# 		q = cur.execute("SELECT name FROM equip")
# 		equips = []
# 		b = cur.fetchall()
# 		for i in range(q):
# 			equips.append(b[i]['name'])
# 		if name in equips:
# 			cur.execute("UPDATE equip SET count = count+%s WHERE name = %s", (count, name))
# 		else:
# 			cur.execute("INSERT INTO equip(name, count) VALUES(%s, %s)", (name, count))
# 		mysql.connection.commit()
# 		cur.close()
# 		flash('You added a new Equipment!!', 'success')
# 		return redirect(url_for('adminDash'))
# 	return render_template('addEquip.html', form = form)

# class RemoveEquipForm(Form):
# 	name = RadioField('Name', choices = choices)
# 	count = IntegerField('Count', [validators.InputRequired()])


# @app.route('/removeEquip', methods = ['GET', 'POST'])
# @is_logged_in
# @is_admin
# def removeEquip():
# 	choices.clear()
# 	cur = mysql.connection.cursor()
# 	q = cur.execute("SELECT name FROM equip")
# 	b = cur.fetchall()
# 	for i in range(q):
# 		tup = (b[i]['name'],b[i]['name'])
# 		choices.append(tup)
# 	form = RemoveEquipForm(request.form)
# 	#num = data['count']
# 	if request.method == 'POST' and form.validate():
# 		cur.execute("SELECT * FROM equip WHERE name = %s", [form.name.data])
# 		data = cur.fetchone()
# 		app.logger.info(data['count'])
# 		num = data['count']
# 		if num >= form.count.data and form.count.data>0:
# 			name = form.name.data
# 			count = form.count.data
# 			cur = mysql.connection.cursor()
# 			cur.execute("UPDATE equip SET count = count-%s WHERE name = %s", (count, name))
# 			mysql.connection.commit()
# 			cur.close()
# 			choices.clear()
# 			flash('You successfully removed some of your equipment!!', 'success')
# 			return redirect(url_for('adminDash'))
# 		else:
# 			flash('you must enter valid number', 'danger')
# 	return render_template('removeEquip.html', form = form)

# choices2 = []

# class AddMemberForm(Form):
#     name = StringField('Name', [validators.Length(min=1, max=50)])
#     username = StringField('Username', [validators.InputRequired(), validators.NoneOf(values = values, message = "Username already taken, Please try another")])
#     password = PasswordField('Password', [
#         validators.DataRequired(),
#         validators.EqualTo('confirm', message='Passwords do not match')
#     ])
#     confirm = PasswordField('Confirm Password')
#     plan  = RadioField('Select Plan', choices = choices)
#     trainor = SelectField('Select Trainor', choices = choices2)
#     street = StringField('Street', [validators.Length(min = 1, max = 100)])
#     city = StringField('City', [validators.Length(min = 1, max = 100)])
#     phone = StringField('Phone', [validators.Length(min = 1, max = 100)])


# @app.route('/addMember', methods = ['GET', 'POST'])
# @is_logged_in
# @is_recep_level
# def addMember():
# 	choices.clear()
# 	choices2.clear()
# 	cur = mysql.connection.cursor()
	
# 	q = cur.execute("SELECT username FROM info")
# 	b = cur.fetchall()
# 	for i in range(q):
# 		values.append(b[i]['username'])
	
# 	q = cur.execute("SELECT DISTINCT name FROM plans")
# 	b = cur.fetchall()
# 	for i in range(q):
# 		tup = (b[i]['name'],b[i]['name'])
# 		choices.append(tup)
	
# 	q = cur.execute("SELECT username FROM trainors")
# 	b = cur.fetchall()
# 	for i in range(q):
# 		tup = (b[i]['username'],b[i]['username'])
# 		choices2.append(tup)
	
# 	cur.close()
	
# 	form = AddMemberForm(request.form)
# 	if request.method == 'POST' and form.validate():
# 		#app.logger.info("setzdgxfhcgjvkhbjlkn")
# 		name = form.name.data
# 		username = form.username.data
# 		password = sha256_crypt.encrypt(str(form.password.data))
# 		street = form.street.data
# 		city = form.city.data
# 		phone = form.phone.data
# 		plan = form.plan.data
# 		trainor = form.trainor.data
# 		cur = mysql.connection.cursor()

# 		cur.execute("INSERT INTO info(name, username, password, street, city, prof, phone) VALUES(%s, %s, %s, %s, %s, %s, %s)", (name, username, password, street, city, 4,phone))
# 		cur.execute("INSERT INTO members(username, plan, trainor) VALUES(%s, %s, %s)", (username, plan, trainor))
# 		mysql.connection.commit()
# 		cur.close()
# 		choices2.clear()
# 		choices.clear()
# 		flash('You added a new member!!', 'success')
# 		if(session['prof']==1):
# 			return redirect(url_for('adminDash'))
# 		return redirect(url_for('recepDash'))
# 	return render_template('addMember.html', form=form)


# @app.route('/deleteMember', methods = ['GET', 'POST'])
# @is_logged_in
# @is_recep_level
# def deleteMember():
# 	choices.clear()
# 	cur = mysql.connection.cursor()
# 	q = cur.execute("SELECT username FROM members")
# 	b = cur.fetchall()
# 	for i in range(q):
# 		tup = (b[i]['username'],b[i]['username'])
# 		choices.append(tup)
# 	form = DeleteRecepForm(request.form)
# 	if request.method == 'POST':
# 		username = form.username.data
# 		cur = mysql.connection.cursor()
# 		cur.execute("DELETE FROM members WHERE username = %s", [username])
# 		cur.execute("DELETE FROM info WHERE username = %s", [username])
# 		mysql.connection.commit()
# 		cur.close()
# 		choices.clear()
# 		flash('You deleted a member from GETSHAPE!!', 'success')
# 		if(session['prof']==1):
# 			return redirect(url_for('adminDash'))
# 		return redirect(url_for('recepDash'))
# 	return render_template('deleteRecep.html', form = form)

# @app.route('/viewDetails')
# def viewDetails():
# 	cur = mysql.connection.cursor()
# 	cur.execute("SELECT username FROM info WHERE username != %s", [session['username']])
# 	result = cur.fetchall()
# 	return render_template('viewDetails.html', result = result)


# @app.route('/recepDash')
# @is_recep_level
# def recepDash():
# 	return render_template('recepDash.html')

# class trainorForm(Form):
# 	name = RadioField('Select Username', choices = choices)
# 	date = DateField('Date', format='%Y-%m-%d')
# 	report = StringField('Report', [validators.InputRequired()])
# 	rate = RadioField('Result', choices = [('good', 'good'),('average', 'average'),('poor', 'poor') ])


# @app.route('/trainorDash', methods = ['GET', 'POST'])
# @is_logged_in
# @is_trainor
# def trainorDash():
# 	choices.clear()
# 	cur = mysql.connection.cursor()
# 	cur.execute("SELECT name, count FROM equip")
# 	equips = cur.fetchall()
# 	#app.logger.info(equips)
# 	cur.execute("SELECT username FROM members WHERE trainor = %s", [session['username']])
# 	members_under = cur.fetchall()
# 	cur.close()
# 	cur = mysql.connection.cursor()

# 	q = cur.execute("SELECT username FROM members WHERE trainor = %s", [session['username']])
# 	b = cur.fetchall()
# 	for i in range(q):
# 		tup = (b[i]['username'],b[i]['username'])
# 		choices.append(tup)
# 	cur.close()

# 	form = trainorForm(request.form)

# 	if request.method == 'POST':
# 		date = form.date.data
# 		username = form.name.data
# 		report = form.report.data
# 		rate = form.rate.data
# 		if rate == 'good':
# 			rate = 1
# 		elif rate == 'average':
# 			rate = 2
# 		else:
# 			rate = 3
# 		#app.logger.info(request.form.input_date)
# 		#app.logger.info(date)
# 		if datetime.now().date()<date:
# 			flash('You cannot predict furture, buoy!!', 'warning')
# 			choices.clear()
# 			return redirect(url_for('trainorDash'))
		

# 		cur = mysql.connection.cursor()
# 		p = cur.execute("SELECT date FROM progress WHERE username = %s", [username])
# 		entered = []
# 		q = cur.fetchall()
# 		for i in range(p):
# 			entered.append(q[i]['date'])
		

# 		if date in entered:
# 			cur.execute("UPDATE progress SET daily_result = %s, rate = %s WHERE username = %s and date = %s", (report,rate, username, date))
# 			mysql.connection.commit()
# 			cur.close()
# 			choices.clear()
# 			flash('Succesfully updated!', 'success')
# 			return redirect(url_for('trainorDash'))
		

# 		cur.execute("INSERT INTO progress(username, date, daily_result, rate) VALUES(%s, %s, %s, %s)", (username, date, report, rate))
# 		mysql.connection.commit()
# 		cur.close()
# 		choices.clear()
# 		flash('Progress updated and Reported', 'info')
# 		return redirect(url_for('trainorDash'))

# 	return render_template('trainorDash.html', equips = equips, form = form, members = members_under)


# class UpdatePlanForm(Form):
#     name = StringField('Plan Name', [validators.Length(min=1, max=50)])
#     exercise = StringField('Exercise', [validators.Length(min = 1, max = 100)])
#     reps = IntegerField('Reps', [validators.NumberRange(min = 1, max = 20)])
#     sets = IntegerField('Sets', [validators.NumberRange(min = 1, max = 20)])


# @app.route('/updatePlans', methods = ['GET', 'POST'])
# @is_trainor
# def updatePlans():
# 	form = UpdatePlanForm(request.form)
# 	if request.method == 'POST' and form.validate():
# 		name = form.name.data
# 		exercise = form.exercise.data
# 		reps = form.reps.data
# 		sets = form.sets.data
# 		cur = mysql.connection.cursor()
# 		cur.execute("SELECT name, exercise FROM plans WHERE name = %s and exercise = %s", (name, exercise))
# 		result = cur.fetchall()
# 		if len(result)>0:
# 			cur.execute("UPDATE plans SET sets=%s, reps= %s WHERE name = %s and exercise = %s", (sets, reps, name, exercise))
# 		else:
# 			cur.execute("INSERT INTO plans(name, exercise, sets, reps) VALUES(%s, %s, %s, %s)", (name, exercise, sets, reps))
# 		mysql.connection.commit()
# 		cur.close()
# 		flash('You have updated the plan schemes', 'success')
# 		return redirect(url_for('trainorDash'))
# 	return render_template('addPlan.html', form = form)



# @app.route('/memberDash/<string:username>')
# # @is_logged_in
# def memberDash(username):
	# if session['prof']==4 and username!=session['username']:
	# 	flash('You aren\'t authorised to view other\'s Dashboards', 'danger')
	# 	return redirect(url_for('memberDash', username = session['username'])) 
	# cur = mysql.connection.cursor()
	# cur.execute("SELECT plan FROM members WHERE username = %s", [username])
	# plan = (cur.fetchone())['plan']
	# cur.execute("SELECT exercise, reps, sets FROM plans WHERE name = %s", [plan])
	# scheme = cur.fetchall()
	# n = cur.execute("SELECT date, daily_result, rate FROM progress WHERE username = %s ORDER BY date DESC", [username])
	# progress = cur.fetchall()
	# result = []
	# for i in range(n):
	# 	result.append(int(progress[i]['rate']))
	# good = result.count(1)
	# poor = result.count(3)
	# average = result.count(2)
	# total = good + poor + average
	# good = round((good/total) * 100, 2)
	# average = round((average/total) * 100, 2)
	# poor = round((poor/total) * 100, 2)
	# cur.close()
	# return render_template('memberDash.html',user = username, plan = plan, scheme = scheme, progress = progress, good = good, poor = poor, average = average)
	# return render_template('memberDash.html',username = username)


# @app.route('/profile/<string:username>')
# @is_logged_in
# def profile(username):
# 	if username == session['username'] or session['prof']==1 or session['prof']==2:
# 		cur = mysql.connection.cursor()
# 		cur.execute("SELECT * FROM info WHERE username = %s", [username])
# 		result = cur.fetchone()
# 		return render_template('profile.html', result = result)
# 	flash('You cannot view other\'s profile', 'warning')
# 	if session['prof']==3:
# 		return redirect(url_for('trainorDash'))
# 	return redirect(url_for('memberDash', username = username))


# class EditForm(Form):
#     name = StringField('Name', [validators.Length(min=1, max=50)])
#     street = StringField('Street', [validators.Length(min = 1, max = 100)])
#     city = StringField('City', [validators.Length(min = 1, max = 100)])
#     phone = StringField('Phone', [validators.Length(min = 1, max = 100)])


# @app.route('/edit_profile/<string:username>', methods = ['GET', 'POST'])
# @is_logged_in
# def edit_profile(username):

# 	if username != session['username']:
# 		flash('You aren\'t authorised to edit other\'s details', 'warning')
# 		if session['prof']==4:
# 			return redirect(url_for('memberDash', username = username))
# 		if session['prof']==1:
# 			return redirect(url_for('adminDash'))
# 		if session['prof']==2:
# 			return redirect(url_for('recepDash', username = username))
# 		if session['prof']==3:
# 			return redirect(url_for('trainorDash', username = username))

# 	cur = mysql.connection.cursor()
# 	cur.execute("SELECT * FROM info WHERE username = %s", [username]);
# 	result = cur.fetchone()

# 	form = EditForm(request.form)
	
# 	form.name.data = result['name']
# 	form.street.data = result['street']
# 	form.city.data = result['city']
# 	form.phone.data = result['phone']

# 	cur.close()

# 	if request.method == 'POST' and form.validate():
# 		#app.logger.info("setzdgxfhcgjvkhbjlkn")
# 		name = request.form['name']
# 		street = request.form['street']
# 		city = request.form['city']
# 		phone = request.form['phone']
# 		app.logger.info(name)
# 		app.logger.info(street)
# 		app.logger.info(city)
# 		cur = mysql.connection.cursor()

# 		q = cur.execute("UPDATE info SET name = %s, street = %s, city = %s, phone = %s WHERE username = %s", (name, street, city, phone, username))
# 		app.logger.info(q)
# 		mysql.connection.commit()
# 		cur.close()
# 		flash('You successfully updated your profile!!', 'success')
# 		if session['prof']==4:
# 			return redirect(url_for('memberDash', username = username))
# 		if session['prof']==1:
# 			return redirect(url_for('adminDash'))
# 		if session['prof']==2:
# 			return redirect(url_for('recepDash', username = username))
# 		if session['prof']==3:
# 			return redirect(url_for('trainorDash', username = username))
# 	return render_template('edit_profile.html', form=form)


@app.route('/logout')
@is_logged_in
def logout():
	session.clear()
	flash('You are now logged out', 'success')
	return redirect(url_for('login'))


# if __name__ == "__main__":
# 	app.secret_key = '528491@JOKER'
# 	app.debug = True
# 	manager = Manager(app)
# 	#manager.secret_key = '528491@siva'
# 	manager.run()
# 	#app.run()