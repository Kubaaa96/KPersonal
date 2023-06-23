#include <fmt/core.h>
#include <qapplication.h>
#include <qmainwindow.h>

int main(int argc, char **argv) {
    fmt::print("My template\n");
    QApplication app(argc, argv);
    QMainWindow w;
    w.show();
    return app.exec();
}
