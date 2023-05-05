#include <Example.hpp>

#include <gtest/gtest.h>
#include <fmt/core.h>

struct ExampleTest : testing::Test {
    Example example;
};

TEST_F(ExampleTest, test) {
    // given
    // when
    auto value = example.get_number();

    // then
    const auto expected_value{5};
    ASSERT_EQ(value, expected_value);
}
