#pragma once

#include <Application.hpp>

int main(int argc, char** argv){

    Anvil::Application *app = Anvil::BuildApplication();

    app->Run();

    delete app;

}