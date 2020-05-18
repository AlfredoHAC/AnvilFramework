#pragma once

namespace Anvil {

    class Application {
        public:
            Application();
            ~Application();

            void Run();
        
        private:

    };

    extern Application* BuildApplication();
}