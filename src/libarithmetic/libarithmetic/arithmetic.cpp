#include <libarithmetic/arithmetic.hpp>

#include <iterator>
#include <numeric>

namespace libarithmetic {

int stream_sum(std::istream& is) {
  return std::accumulate(
      std::istream_iterator<int>(is),
      std::istream_iterator<int>(),
      0,
      [](int acc, int x) { return acc + x; });
}

}  // namespace libarithmetic
