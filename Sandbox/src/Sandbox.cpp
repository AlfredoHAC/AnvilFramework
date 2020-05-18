#include <Anvil.hpp>

class SandboxApplication : public Anvil::Application {
    public:

    private:

};

Anvil::Application* Anvil::BuildApplication() {
    return new SandboxApplication();
}