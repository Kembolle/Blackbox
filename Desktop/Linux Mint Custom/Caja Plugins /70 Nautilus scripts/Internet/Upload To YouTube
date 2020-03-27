#!/usr/bin/python
import datetime
import wx
import sys
import os
arg = sys.argv[1:]
t = 1
#def get_link(name2):
#	os_list = os.popen('google youtube list name,url --delimiter \'-->\'')
#	vids = os_list.readlines()
#	for vid in vids:
#	a = vid.index('-->')
#	name = vid[0:a]
#	link = vid[a+3:]
#	if name==name2:
#		
def auth(event): #authorize
		os.system('xterm -e google youtube list')
class MyFrame(wx.Frame):
	gcat_in=0
	cat=['Autos & Vehicles','Comedy','Education','Entertainment','Film & Animation','Gaming','Howto & Style','Music','News & Politics','Nonprofits & Activism','People & Blogs','Pets & Animals','Science & Technology','Sports','Travel & Events']
	gcat=['Autos','Comedy','Education','Entertainment','Film','Games','Howto','Music','News','Nonprofit','People','Animals','Tech','Sports','Travel']
	def __init__(self,aa=0):
		wx.Frame.__init__(self,None,-1,'Youtube Uploader',size=(600,420))
		self.panel = wx.Panel(self)
		"""Display Text on Screen"""
		wx.StaticText(self.panel,-1,'Welcome to the YouTube uploading utility by Rishav Thakker. If this is your first time, you should click the \'authorize\' button. Before you can start uploading, you must fill in some required information such as the category, and some optional information such as the Title, Description, etc.\n\n(NOTE: If you havent used this for a month/more click authorize) Once you are done filling up the information, just press the \'Start Upload\' Button, and soon enough your video will be up on YoutTube :).', size=(580,300),pos=(10,10))
		wx.StaticText(self.panel,-1,'Title :',pos=(10,150))
		wx.StaticText(self.panel,-1,'Description :',pos=(10,200))
		wx.StaticText(self.panel,-1,'Category* :',pos=(10,310))
		wx.StaticText(self.panel,-1,'Tags :',pos=(10,350))
		
		"""Input Text via TxtCtrl"""
		self.title_wx=wx.TextCtrl(self.panel,-1,'Enter Title Here',size=(350,-1),pos=(150,147))
		self.description_wx=wx.TextCtrl(self.panel,-1,'Enter Description Here',size=(350,95),pos=(150,197),style=wx.TE_MULTILINE | wx.OK)
		self.category_wx=wx.TextCtrl(self.panel,-1,'None Chosen',size=(250,-1),pos=(150,307),style=wx.TE_READONLY)
		
		#creating button for choosing category
		button_cat = wx.Button(self.panel,-1,'Choose..',pos=(418,306))
		#binding event of this button with function
		self.Bind(wx.EVT_BUTTON,self.category,button_cat)
		
		self.tags_wx=wx.TextCtrl(self.panel,-1,'\'tag1\',\'tag2\',\'tag3\',etc..', size=(350,-1),pos=(150,347))
		
		#creating buttons
		if (aa == 0):
			b_auth = wx.Button(self.panel,-1,'Authorize',size=(100,35),pos=(320,380))
			self.Bind(wx.EVT_BUTTON,auth,b_auth)
			button = wx.Button(self.panel,-1,'Start Upload',size=(100,35),pos=(220,380))
			self.Bind(wx.EVT_BUTTON,self.start_upload,button)
		else:
			button = wx.Button(self.panel,-1,'Start Upload',size=(200,35),pos=(220,380))
			self.Bind(wx.EVT_BUTTON,self.start_upload,button)
	def category(self,event): #choose category function
		dlg_cat=wx.SingleChoiceDialog(None,'Please choose one of the following categories','Category',self.cat)
		if dlg_cat.ShowModal() == wx.ID_OK:
			self.gcat_in = dlg_cat.GetSelection()
			temp = dlg_cat.GetStringSelection()
			self.category_wx.SetValue(temp)
		dlg_cat.Destroy()
	def start_upload(self,event): #start upload function
		name = ''
		for x in arg:
			name = name + x
		#In progress dialog
		please_wait = wx.ProgressDialog('Processing Request','Please wait while your video is being uploaded',maximum=50)
		please_wait.Update(20)
		
		os.system('google youtube post --category %s --title \'%s\' --summary \'%s\' --tags %s %s' % (self.gcat[self.gcat_in],self.title_wx.GetValue(),self.description_wx.GetValue(),self.tags_wx.GetValue(),name))
		
		please_wait.Update(30)
		links = os.popen('google youtube list --field url \'%s\'' % (self.title_wx.GetValue()))
		please_wait.Update(40)
		link = links.readline()
		
		please_wait.Update(51)
		please_wait.Destroy()
		final_dialog = wx.TextEntryDialog(None,'Here is the link to your video:','Upload Complete!',link,style=wx.TE_READONLY | wx.TE_MULTILINE |wx.OK)
		final_dialog.ShowModal()
		final_dialog.Destroy()
		self.Destroy()
class MyApp(wx.App):
	def OnInit(self):
		return True
	def Start(self,x):
		if x == 2:
			frame = MyFrame()
			frame.Show()
		else:
			frame = MyFrame(1)
			frame.Show()
def mwuha(x = ''):
	app = MyApp(redirect=True)
	#print x
	if (len(x)>0):
		arg = [x]
		app.Start(1)
	else:
		app.Start(2)
	app.MainLoop()
if __name__=='__main__':
	mwuha()
