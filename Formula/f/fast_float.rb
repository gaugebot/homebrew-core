class FastFloat < Formula
  desc "Fast and exact implementation of the C++ from_chars functions for number types"
  homepage "https://github.com/fastfloat/fast_float"
  url "https://github.com/fastfloat/fast_float/archive/refs/tags/v6.1.6.tar.gz"
  sha256 "4458aae4b0eb55717968edda42987cabf5f7fc737aee8fede87a70035dba9ab0"
  license "Apache-2.0"
  head "https://github.com/fastfloat/fast_float.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "1e1033e748383d9efa14599f3ef2bb7f31f8b280f36331fcf1fbd6958d0520eb"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--install", "build"
  end

  test do
    (testpath/"test-fast-float.cc").write <<~CXX
      #include "fast_float/fast_float.h"
      #include <iostream>

      int main() {
          const std::string input =  "3.1416 xyz ";
          double result;
          auto answer = fast_float::from_chars(input.data(), input.data()+input.size(), result);
          if(answer.ec != std::errc()) { std::cerr << "parsing failure\\n"; return EXIT_FAILURE; }
          std::cout << "parsed the number " << result << std::endl;
          return EXIT_SUCCESS;
      }
    CXX

    ENV.append_to_cflags "-I#{include}"
    ENV.append "CXXFLAGS", "-std=c++11"

    system "make", "test-fast-float"
    output = shell_output("./test-fast-float")

    assert_match "parsed the number", output
    refute_match "parsing failure", output
  end
end
