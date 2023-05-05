# template-cpp

### Requirements
- Compiler (Gcc / clang / MSVC)
- Cppcheck
- ccatche
- Conan

### Things to add
- [x] Licence update
- [x] Conan support
    - [x] fmt 8.x.x
    - [x] spdlog 1.10.0
    - [x] gtest 1.11.0
- [x] Appropriate compiler flags GCC 
- [x] Appropriate compiler flags Clang
- [x] Appropriate compiler flags MSVC
- [x] Cpp20 support
- [x] clang-tidy
- [x] [cppcheck](https://cppcheck.sourceforge.io/)
- [x] [ccache](https://ccache.dev/)
- [x] [Google test examples](https://google.github.io/googletest/)
- [ ] Think about and add Relase builds in CI/CD
- [ ] Docker development environment example
- [x] [Doxygen documentation setup](https://www.doxygen.nl/index.html)
- [x] github actions for three compilers (GCC, Clang, MSVC)
  - [x] GCC
  - [x] Clang
  - [x] MSVC
- [x] github actions for three platforms (Linux, Windows, Mac OS)
- [ ] GCC and clang on windows
- [x] Basic code coverage for GCC 
- [ ] Advanced code coverage based on unit and integrations tests and combined coverage
- [ ] Coverage for different compilers (MSVC and Clang)
- [ ] Badges
    - [ ] Coverage at unit tests
    - [ ] Coverage at integration tests
    - [ ] Combined coverage
    - [ ] code quality c/c++
    - [ ] All compilers and all platforms
- [ ] Docs folder
  - [ ] Doxygen tutorial page
  - [ ] Docker development environment
- [ ] [Fuzz testing with LibFuzzer](https://llvm.org/docs/LibFuzzer.html)
- [ ] Sanitizers
    - [ ] [Address](https://github.com/google/sanitizers/wiki/AddressSanitizer) or [HWASAN](https://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html)
    - [ ] [Memory](https://github.com/google/sanitizers/wiki/MemorySanitizer)
    - [ ] [Thread](https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual)
    - [ ] [Leak](https://github.com/google/sanitizers/wiki/AddressSanitizerLeakSanitizer)
    - [ ] [Undefined Behaviour](https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html)

### Troubleshooting

Invalid setting '14' is not a valid 'settings.compiler.version' value.

If you see above warning. Just update your conan settings like [this](https://docs.conan.io/en/1.36/extending/custom_settings.html#custom-settings)

### Requirements

- Graphviz for doxygen dot

Linux: 
`sudo apt install graphviz`

Others:
[GraphViz](https://www.graphviz.org/download/)