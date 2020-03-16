#include <libarithmetic/arithmetic.hpp>
#include <libarithmetic/test/test_data_path.hpp>

#include <gtest/gtest.h>

#include <fstream>
#include <sstream>

TEST(StreamSumTest, StringInput) {
  std::stringstream ss("1 2 3");
  const auto sum = libarithmetic::stream_sum(ss);
  EXPECT_EQ(6, sum);
}

TEST(StreamSumTest, FileInput) {
  std::ifstream ifs(libarithmetic::test::get_test_data_file_path("42.txt"));
  const auto sum = libarithmetic::stream_sum(ifs);
  EXPECT_EQ(42, sum);
}
