TEMPLATE = app

CONFIG += console c++17
CONFIG -= app_bundle
# CONFIG -= qt
QT += core network

SOURCES += \
        main.cpp \
        neuralnetdetector.cpp \
        udppacket.cpp

win32 {
    INCLUDEPATH += c:\opencv-4.10.0-build\install\include\

    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_core4100.lib
    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_dnn4100.lib
    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_highgui4100.lib
    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_imgcodecs4100.lib
    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_videoio4100.lib
    LIBS += c:\opencv-4.10.0-build\install\x64\vc17\lib\opencv_imgproc4100.lib
}
unix {
    INCLUDEPATH += /usr/include/opencv4
    INCLUDEPATH += /usr/local/include/opencv4
    LIBS += -L/usr/local/lib -lopencv_core -lopencv_highgui -lopencv_imgcodecs -lopencv_videoio -lopencv_imgproc -lopencv_dnn -pthread
}

HEADERS += \
    neuralnetdetector.h \
    udppacket.h
