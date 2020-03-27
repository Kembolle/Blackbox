#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#       redimensiona.py
#       
#       Copyright 2011 Lorenzo Carbonell <atareao@atareao.es>
#       http://www.atareao.es
#       
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 2 of the License, or
#       (at your option) any later version.
#       
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#       
#       You should have received a copy of the GNU General Public License
#       along with this program; if not, write to the Free Software
#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#       MA 02110-1301, USA.


import gtk
import shlex
import subprocess
import os

def ejecuta(comando):
	args = shlex.split(comando)
	p = subprocess.Popen(args, bufsize=10000,stderr=subprocess.STDOUT, stdout=subprocess.PIPE)
	valor = p.communicate()[0]
	return valor

def ejecuta2(comando):
	p1 = subprocess.Popen(['echo', '\n' ],stdout=subprocess.PIPE)
	args = shlex.split(comando)
	p = subprocess.Popen(args, bufsize=10000,stderr=subprocess.STDOUT,stdout=subprocess.PIPE)#, stdin=p1.stdout)
	valor = p.communicate()[0]
	return valor

def get_value(text,tag):
	inicio = text.find(tag)
	inicio = text.find('=',inicio)+1
	fin = text.find('\n',inicio)
	return text[inicio:fin]
	
	

class MiVentana(gtk.Dialog):
	def __init__(self):
		gtk.Dialog.__init__(self,'Video 2 Gif',None,gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT,(gtk.STOCK_CANCEL, gtk.RESPONSE_REJECT,gtk.STOCK_OK, gtk.RESPONSE_ACCEPT))
		self.set_title('Video 2 Gif')
		vbox = gtk.VBox(spacing = 5)
		vbox.set_border_width(5)
		self.get_content_area().add(vbox)
		frame = gtk.Frame()
		vbox.add(frame)
		table = gtk.Table(5,4)
		frame.add(table)
		label11 = gtk.Label('Video:')
		label11.set_alignment(0.0,0.5)
		table.attach(label11,0,1,0,1,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		self.entry12 = gtk.Entry()
		self.entry12.set_editable(False)
		self.entry12.set_width_chars(40)
		table.attach(self.entry12,1,3,0,1,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		button13 =gtk.Button('Selecciona')
		table.attach(button13,3,4,0,1,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		button13.connect('clicked',self.on_button13_clicked)
		################################################################
		label21 = gtk.Label('Inicio:')
		label21.set_alignment(0.0,0.5)
		table.attach(label21,0,1,1,2,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		self.hscale22 = gtk.HScale(gtk.Adjustment(value=0, lower=0, upper=50, step_incr=1, page_incr=10, page_size=1))
		self.hscale22.connect('value-changed',self.on_value_changed_in_hscale22)
		table.attach(self.hscale22,1,4,1,2,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		label31 = gtk.Label('Fin:')
		label31.set_alignment(0.0,0.5)
		table.attach(label31,0,1,2,3,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		self.hscale32 = gtk.HScale(gtk.Adjustment(value=0, lower=0, upper=50, step_incr=1, page_incr=10, page_size=1))
		table.attach(self.hscale32,1,4,2,3,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		label41 = gtk.Label('Dimensiones:')
		label41.set_alignment(0.0,0.5)
		table.attach(label41,0,1,3,4,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		self.entry42 = gtk.Entry()
		table.attach(self.entry42,1,2,3,4,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		label43 = gtk.Label('x')
		label43.set_alignment(0.5,0.5)
		table.attach(label43,2,3,3,4,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		self.entry44 = gtk.Entry()
		table.attach(self.entry44,3,4,3,4,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		label51 = gtk.Label('Imágenes por segundo:')
		label51.set_alignment(0.0,0.5)
		table.attach(label51,0,2,4,5,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		self.spinbutton52 = gtk.SpinButton()
		self.spinbutton52.set_digits(0)
		self.spinbutton52.set_range(1,30)
		self.spinbutton52.set_adjustment(gtk.Adjustment(value=1, lower=1, upper=30, step_incr=1, page_incr=1, page_size=0))
		table.attach(self.spinbutton52,3,4,4,5,xoptions=gtk.EXPAND|gtk.FILL, yoptions=gtk.EXPAND|gtk.FILL, xpadding=5, ypadding=5)
		#
		self.show_all()
	
	def on_button13_clicked(self,widget):
		dialog = gtk.FileChooserDialog("Seleccionar video...",
                               None,
                               gtk.FILE_CHOOSER_ACTION_OPEN,
                               (gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL,
                                gtk.STOCK_OPEN, gtk.RESPONSE_OK))
		dialog.set_default_response(gtk.RESPONSE_OK)

		filter = gtk.FileFilter()
		filter.set_name('Video')
		filter.add_pattern('*.asf')
		filter.add_pattern('*.avi')
		filter.add_pattern('*.bfi')
		filter.add_pattern('*.caf')
		filter.add_pattern('*.flv')
		filter.add_pattern('*.mkv')
		filter.add_pattern('*.webm')
		filter.add_pattern('*.mpeg')
		filter.add_pattern('*.mpg')
		filter.add_pattern('*.ogg')
		dialog.add_filter(filter)

		response = dialog.run()
		if response == gtk.RESPONSE_OK:
			file_to_convert = dialog.get_filename()
			self.entry12.set_text(file_to_convert)
		dialog.destroy()
		command ='mplayer "%s" -ao null -vo null -frames 1 -identify'%file_to_convert
		print command
		valores = ejecuta(command)
		print valores
		self.ancho = str(int(get_value(valores,'ID_VIDEO_WIDTH')))
		self.alto = str(int(get_value(valores,'ID_VIDEO_HEIGHT')))
		self.entry42.set_text(self.ancho)
		self.entry44.set_text(self.alto)
		self.length = float(get_value(valores,'ID_LENGTH'))+1.0
		self.length = int(self.length)
		self.spinbutton52.get_adjustment().set_upper(float(get_value(valores,'ID_VIDEO_FPS')))
		self.hscale22.get_adjustment().set_upper(self.length)
		self.hscale32.get_adjustment().set_upper(self.length)
		self.hscale22.set_value(0.0)
		self.hscale32.set_value(self.length)
		if self.spinbutton52.get_value() > self.spinbutton52.get_adjustment().get_upper():
			self.spinbutton52.set_value(self.spinbutton52.get_adjustment().get_upper())
		if self.hscale22.get_value() > self.hscale22.get_adjustment().get_upper():
			self.hscale22.set_value(self.hscale22.get_adjustment().get_upper())
		if self.hscale32.get_value() > self.hscale32.get_adjustment().get_upper():
			self.hscale32.set_value(self.hscale32.get_adjustment().get_upper())
		if self.hscale22.get_value() < self.hscale22.get_adjustment().get_lower():
			self.hscale22.set_value(self.hscale22.get_adjustment().get_lower())
		if self.hscale32.get_value() < self.hscale32.get_adjustment().get_lower():
			self.hscale32.set_value(self.hscale32.get_adjustment().get_lower())
		

	def on_value_changed_in_hscale22(self,widget):
		adjus = self.hscale32.get_adjustment()
		adjus.set_lower(self.hscale22.get_value())
		self.hscale32.set_adjustment(adjus)
		if self.hscale32.get_value() < self.hscale32.get_adjustment().get_lower():
			self.hscale32.set_value(self.hscale32.get_adjustment().get_lower())
		
	def salir_callback(self,widget):
		exit(0)
		
	def aceptar_callback(self, args):
		self.hide()

if __name__ == '__main__':
	window = MiVentana()
	if window.run() == gtk.RESPONSE_ACCEPT:
		filename = window.entry12.get_text()
		inicio = str(int(window.hscale22.get_value()))
		fin = str(int(window.hscale32.get_value()))
		ancho = window.entry42.get_text()
		alto = window.entry44.get_text()
		fps = str(int(window.spinbutton52.get_value()))
		commando = 'mplayer "%s" -really-quiet'%filename
		fileoutput = os.path.splitext(filename)[0]+'.gif'
		if inicio != '0':
			commando += ' -ss %s'%inicio
		if fin != str(int(window.length)-1):
			commando += ' -endpos %s'%fin
		commando += ' -ao null -vo gif89a:fps=%s:output=%s -nosound'%(fps,fileoutput)
		ejecuta(commando)
	exit(0)

