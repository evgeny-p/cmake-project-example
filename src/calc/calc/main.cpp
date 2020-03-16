#include <cxxopts.hpp>
#include <fstream>
#include <iostream>
#include <libarithmetic/arithmetic.hpp>
#include <string>

std::ifstream& open_stream(const std::string& file_path, std::ifstream& is) {
  is.open(file_path);
  return is;
}

int main(int argc, char** argv) {
  const std::string file_path_opt = "file_path";

  cxxopts::Options options("calc", "Project structure example");

  options.positional_help("[file_path]");

  // clang-format off
  options.add_options()
      (file_path_opt, "", cxxopts::value<std::string>())
      ("h,help", "Print help");
  // clang-format on

  options.parse_positional({file_path_opt});

  const auto result = options.parse(argc, argv);

  if (result.count("help") > 0) {
    std::cout << options.help() << "\n";
    return 0;
  }

  std::ifstream is;
  auto& input_stream =
      result.count(file_path_opt) > 0
          ? open_stream(result[file_path_opt].as<std::string>(), is)
          : std::cin;

  if (!input_stream.good()) {
    std::cerr << "Unable to read stream\n";
    return 1;
  }

  const auto sum = libarithmetic::stream_sum(input_stream);
  std::cout << sum << "\n";
}
