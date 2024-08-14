#ifndef NEURALNETDETECTOR_H
#define NEURALNETDETECTOR_H

#include <opencv2/opencv.hpp>
#include <opencv2/dnn.hpp>

#include <iostream>
#include <fstream>
#include <cerrno>

/** Параметры обработки */
static const float SCORE_THRESHOLD      = 0.50f;
static const float NMS_THRESHOLD        = 0.45f;
static const float CONFIDENCE_THRESHOLD = 0.45f;

/** Параметры шрифтов */
static const float FONT_SCALE = 0.7f;
static const int   THICKNESS  = 1;

/** Флаг отображения метки */
static const bool DRAW_LABEL = false;
static const bool DIAGNOSTIC_LOG = false;
static const bool COMMAND_LOG = true;

/** Цветовые константы */
static cv::Scalar BLACK  = cv::Scalar(0,   0,   0);
static cv::Scalar YELLOW = cv::Scalar(0, 255, 255);
static cv::Scalar RED    = cv::Scalar(0,   0, 255);
static cv::Scalar GREEN  = cv::Scalar(0, 255,   0);

class NeuralNetDetector
{
private:
    /** Структура нейросети */
    cv::dnn::Net network;
    /** Ширина и высота входного изображения */
    int input_width = 640;
    int input_height = 640;
    /** Вектор распознаваемых классов */
    std::vector<std::string> classes;
    /** Структуры для хранения результатов обработки */
    std::vector<int> classes_id_set;
    std::vector<cv::Rect> boxes_set;
    std::vector<float> confidences_set;
    std::vector<std::string> classes_set;
    /** Время обработки */
    float inference_time;

#ifdef _WIN32
    /** Получить строковые значения классов */
    errno_t read_classes(const std::string file_path);
    /** Инициализация нейросети */
    errno_t init_network(const std::string model_path, const std::string classes_path);
#else
    /** Получить строковые значения классов */
    error_t read_classes(const std::string file_path);
    /** Инициализация нейросети */
    error_t init_network(const std::string model_path, const std::string classes_path);
#endif

    /** Отрисовка метки */
    void draw_label(cv::Mat& img, std::string label, int left, int top);
    /** Предобработка результатов */
    std::vector<cv::Mat> pre_process(cv::Mat &img, cv::dnn::Net &net);
    /** Постобработка результатов */
    cv::Mat post_process(cv::Mat &img, std::vector<cv::Mat> &outputs, const std::vector<std::string> &class_name);
public:
    NeuralNetDetector(const std::string model, const std::string classes);
    NeuralNetDetector(const std::string model, const std::string classes, int width, int height);
    std::vector<float> get_confidences(void) { return confidences_set; }
    std::vector<cv::Rect> get_boxes(void) { return boxes_set; }
    std::vector<int> get_class_ids(void) { return classes_id_set; }
    std::vector<std::string> get_classes(void) { return classes_set; }
    float get_inference(void) { return inference_time; }
    std::string get_info(void);
    cv::Mat process(cv::Mat &img);
};

#endif // NEURALNETDETECTOR_H
