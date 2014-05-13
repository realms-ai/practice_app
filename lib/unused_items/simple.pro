# -------------------------------------------------
# QT Project File
# -------------------------------------------------
TARGET = simple

TEMPLATE = app

SOURCES += qchartviewer.cpp \
    simple.cpp
    
HEADERS += qchartviewer.h \
    simple.h

INCLUDEPATH += include /usr/include/mysql /usr/local/include/mysql++

DEFINES += CHARTDIR_HIDE_OBSOLETE _CRT_SECURE_NO_WARNINGS

win32:LIBS += /lib/chartdir51.lib
win32:QMAKE_POST_LINK = copy /Y lib\\chartdir51.dll $(DESTDIR)

macx:LIBS += -L/lib -lchartdir
macx:QMAKE_POST_LINK += mkdir -p \"`dirname $(TARGET)`/../Frameworks\";
macx:QMAKE_POST_LINK += cp lib/libchartdir.5.dylib \"`dirname $(TARGET)`/../Frameworks\";
macx:QMAKE_POST_LINK += install_name_tool -change libchartdir.5.dylib \
     \@loader_path/../Frameworks/libchartdir.5.dylib \"$(TARGET)\";

unix:!macx:LIBS += -L lib -lchartdir -L/local/lib -L/usr/lib -lmysqlclient -lmysqlpp -lnsl -lz -lm
unix:!macx:QMAKE_RPATHDIR += lib


