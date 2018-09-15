# -*- coding: utf-8 -*-
"""
/***************************************************************************
 TampereSYKEPlugin
                                 A QGIS plugin
 Lisäosalla saa tuotua SYKE:n pohjavesiaineiston kaavoituksen tietokantaan
 Generated by Plugin Builder: http://g-sherman.github.io/Qgis-Plugin-Builder/
                              -------------------
        begin                : 2018-09-14
        git sha              : $Format:%H$
        copyright            : (C) 2018 by Gispo Oy
        email                : erno@gispo.fi
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""
from PyQt5.QtCore import QSettings, QTranslator, qVersion, QCoreApplication
from PyQt5.QtGui import QIcon
from PyQt5.QtWidgets import QAction, QDialogButtonBox

from qgis.core import (QgsMessageLog,
    Qgis,
    QgsVectorLayer,
    QgsTask,
    QgsApplication,
    QgsTaskManager)

from qgis.gui import QgsBusyIndicatorDialog

# Initialize Qt resources from file resources.py
from .resources import *
# Import the code for the dialog
from .syke_tampere_plugin_dialog import TampereSYKEPluginDialog
import os.path

from urllib import request
import xml.etree.ElementTree as etree
from datetime import datetime
import zipfile


class TampereSYKEPlugin:
    """QGIS Plugin Implementation."""

    def __init__(self, iface):
        """Constructor.

        :param iface: An interface instance that will be passed to this class
            which provides the hook by which you can manipulate the QGIS
            application at run time.
        :type iface: QgsInterface
        """
        # Save reference to the QGIS interface
        self.iface = iface
        # initialize plugin directory
        self.plugin_dir = os.path.dirname(__file__)
        # initialize locale
        locale = QSettings().value('locale/userLocale')[0:2]
        locale_path = os.path.join(
            self.plugin_dir,
            'i18n',
            'TampereSYKEPlugin_{}.qm'.format(locale))

        if os.path.exists(locale_path):
            self.translator = QTranslator()
            self.translator.load(locale_path)

            if qVersion() > '4.3.3':
                QCoreApplication.installTranslator(self.translator)

        # Create the dialog (after translation) and keep reference
        self.dlg = TampereSYKEPluginDialog()

        # Declare instance attributes
        self.actions = []
        self.menu = self.tr(u'&SYKE-pohjavesialueiden tuonti')
        # TODO: We are going to let the user set this up in a future iteration
        self.toolbar = self.iface.addToolBar(u'TampereSYKEPlugin')
        self.toolbar.setObjectName(u'TampereSYKEPlugin')

        self.shouldAddToKDYKDatabase = False
        self.zip_url = None
        self.updated = None
        self.updated_text = ''

        self.path = os.path.dirname(__file__)
        self.data_download_dir = os.path.join(self.path, "SYKE")

        self.busy_indicator_dialog = None

    # noinspection PyMethodMayBeStatic
    def tr(self, message):
        """Get the translation for a string using Qt translation API.

        We implement this ourselves since we do not inherit QObject.

        :param message: String for translation.
        :type message: str, QString

        :returns: Translated version of message.
        :rtype: QString
        """
        # noinspection PyTypeChecker,PyArgumentList,PyCallByClass
        return QCoreApplication.translate('TampereSYKEPlugin', message)


    def add_action(
        self,
        icon_path,
        text,
        callback,
        enabled_flag=True,
        add_to_menu=True,
        add_to_toolbar=True,
        status_tip=None,
        whats_this=None,
        parent=None):
        """Add a toolbar icon to the toolbar.

        :param icon_path: Path to the icon for this action. Can be a resource
            path (e.g. ':/plugins/foo/bar.png') or a normal file system path.
        :type icon_path: str

        :param text: Text that should be shown in menu items for this action.
        :type text: str

        :param callback: Function to be called when the action is triggered.
        :type callback: function

        :param enabled_flag: A flag indicating if the action should be enabled
            by default. Defaults to True.
        :type enabled_flag: bool

        :param add_to_menu: Flag indicating whether the action should also
            be added to the menu. Defaults to True.
        :type add_to_menu: bool

        :param add_to_toolbar: Flag indicating whether the action should also
            be added to the toolbar. Defaults to True.
        :type add_to_toolbar: bool

        :param status_tip: Optional text to show in a popup when mouse pointer
            hovers over the action.
        :type status_tip: str

        :param parent: Parent widget for the new action. Defaults None.
        :type parent: QWidget

        :param whats_this: Optional text to show in the status bar when the
            mouse pointer hovers over the action.

        :returns: The action that was created. Note that the action is also
            added to self.actions list.
        :rtype: QAction
        """

        icon = QIcon(icon_path)
        action = QAction(icon, text, parent)
        action.triggered.connect(callback)
        action.setEnabled(enabled_flag)

        if status_tip is not None:
            action.setStatusTip(status_tip)

        if whats_this is not None:
            action.setWhatsThis(whats_this)

        if add_to_toolbar:
            self.toolbar.addAction(action)

        if add_to_menu:
            self.iface.addPluginToMenu(
                self.menu,
                action)

        self.actions.append(action)

        return action

    def initGui(self):
        """Create the menu entries and toolbar icons inside the QGIS GUI."""

        icon_path = ':/plugins/syke_tampere_plugin/icon.png'
        self.add_action(
            icon_path,
            text=self.tr(u'SYKE:n pohjavesialueiden tuonti'),
            callback=self.run,
            parent=self.iface.mainWindow())


    def unload(self):
        """Removes the plugin menu item and icon from QGIS GUI."""
        for action in self.actions:
            self.iface.removePluginMenu(
                self.tr(u'&SYKE-pohjavesialueiden tuonti'),
                action)
            self.iface.removeToolBarIcon(action)
        # remove the toolbar
        del self.toolbar


    def run(self):
        """Run method that performs all the real work"""

        # TODO save and read from settings

        self.dlg.buttonBoxOkCancel.button(QDialogButtonBox.Ok).setEnabled(False)

        self.dlg.qgsFileWidgetDataLocation.setFilePath(self.data_download_dir)

        # show the dialog
        self.dlg.show()

        self.getSYKEInfo()

        self.dlg.labelInfoSYKE.setText(self.updated_text)
        self.dlg.buttonBoxOkCancel.button(QDialogButtonBox.Ok).setEnabled(True)

        # Run the dialog event loop
        result = self.dlg.exec_()
        # See if OK was pressed
        if result:
            self.shouldAddToKDYKDatabase = self.dlg.checkBoxAddToKDYKDatabase.isChecked()
            QgsMessageLog.logMessage('shouldAddToKDYKDatabase: ' + str(self.shouldAddToKDYKDatabase), "Tampere-KDYK-SYKE-plugin", Qgis.Info)
            self.data_download_dir = self.dlg.qgsFileWidgetDataLocation.filePath()
            # TODO check that all succeeds and user settings are ok

            self.importData()

    def importData(self):
        self.getZip()
        self.copyDataFromSYKESHPToTamperePlan()

    def getSYKEInfo(self):
        atom_URL = "http://wwwd3.ymparisto.fi/d3/Atom/pohjavesialueet.xml"
        r = request.urlopen(atom_URL)
        atom_xml_string = r.read().decode(r.info().get_param('charset') or 'utf-8')
        #QgsMessageLog.logMessage(atom_xml, "Tampere-KDYK-SYKE-plugin", Qgis.Info)
        et_SYKE = etree.ElementTree(etree.fromstring(atom_xml_string))
        root = et_SYKE.getroot()
        QgsMessageLog.logMessage(root.tag, "Tampere-KDYK-SYKE-plugin", Qgis.Info)
        entry = root.find('{http://www.w3.org/2005/Atom}entry')
        zip_url_elem = entry.find('{http://www.w3.org/2005/Atom}id')
        self.zip_url = zip_url_elem.text
        self.updated = entry.find('{http://www.w3.org/2005/Atom}updated')

        # TODO add author.name and author.email and entry.link.title

        self.updated_text = self.formatUpdatedText(self.updated.text)

        QgsMessageLog.logMessage(self.zip_url, "Tampere-KDYK-SYKE-plugin", Qgis.Info)
        QgsMessageLog.logMessage(self.updated.text, "Tampere-KDYK-SYKE-plugin", Qgis.Info)
        QgsMessageLog.logMessage(self.updated_text, "Tampere-KDYK-SYKE-plugin", Qgis.Info)

    def formatUpdatedText(self, text):
        parsed_time = datetime.strptime(text, '%Y-%m-%dT%H:%M:%SZ')

        QgsMessageLog.logMessage(str(parsed_time))

        if parsed_time.hour < 10:
            parsed_hours = '0' + str(parsed_time.hour)
        else:
            parsed_hours = str(parsed_time.hour)

        if parsed_time.minute < 10:
            parsed_minutes = '0' + str(parsed_time.minute)
        else:
            parsed_minutes = str(parsed_time.minute)


        if parsed_time.second < 10:
            parsed_seconds = '0' + str(parsed_time.second)
        else:
            parsed_seconds = str(parsed_time.second)

        return str(parsed_time.day) + '.' + str(parsed_time.month) + '.' + str(parsed_time.year) + ", klo " + parsed_hours + ':' + parsed_minutes + ':' + parsed_seconds + ' (UTC)'

    def getZip(self):

        self.iface.messageBar().pushMessage(self.tr(u'A moment... Downloading the SYKE groundwater area data...'), Qgis.Info, 8)
        #QCoreApplication.processEvents()
        QgsApplication.processEvents()

        #self.busy_indicator_dialog = QgsBusyIndicatorDialog(self.tr(u'A moment... Downloading the SYKE groundwater area data...'), self.iface.mainWindow())
        #self.busy_indicator_dialog.show()

        
        response = request.urlopen(self.zip_url)

        dir_path = os.path.join(self.data_download_dir)

        if not os.path.exists(dir_path):
            try:
                os.makedirs(dir_path)
            except OSError as exc:
                QgsMessageLog.logMessage(str(exc.errno), "Tampere-KDYK-SYKE-plugin", QgsMessageLog.CRITICAL)
        if not os.path.exists(dir_path):
            QgsMessageLog.logMessage("Error creating folder to store the SYKE data", "Tampere-KDYK-SYKE-plugin", QgsMessageLog.CRITICAL)

        zip_url_parts = self.zip_url.split('/')
        file_name = zip_url_parts[-1]
        zip_path = os.path.join(dir_path, file_name)
        CHUNK = 16 * 1024
        with open(zip_path, 'wb') as f:
            while True:
                chunk = response.read(CHUNK)
                if not chunk:
                    break
                f.write(chunk)

        #self.busy_indicator_dialog.setMessage(self.tr(u'A moment... Extracting the SYKE groundwater area data...'))

        with zipfile.ZipFile(zip_path) as zf:
            zf.extractall(dir_path)

        self.iface.messageBar().clearWidgets()
        self.iface.messageBar().pushMessage(self.tr(u'Data downloaded...'), Qgis.Info, 8)
        #self.busy_indicator_dialog.hide()


    def copyDataFromSYKESHPToTamperePlan(self):
        pass

