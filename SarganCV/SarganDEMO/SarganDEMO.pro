QT += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    resources.qrc

win32 {
    INCLUDEPATH += c:\opencv-4.10.0-build\install\include\

    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_core4100.lib
    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_highgui4100.lib
    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_imgcodecs4100.lib
    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_features2d4100.lib
    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_videoio4100.lib
    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_imgproc4100.lib
}
unix {
    INCLUDEPATH += /usr/include/opencv4
    INCLUDEPATH += /usr/local/include/opencv4
    LIBS += -L/usr/local/lib -lopencv_core -lopencv_highgui -lopencv_imgcodecs -lopencv_videoio -lopencv_imgproc -lopencv_dnn -pthread
}
