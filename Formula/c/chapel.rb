  url "https://github.com/chapel-lang/chapel/releases/download/2.2.0/chapel-2.2.0.tar.gz"
  sha256 "bb16952a87127028031fd2b56781bea01ab4de7c3466f7b6a378c4d8895754b6"
  revision 1
    sha256 arm64_sequoia: "8d89a038eccaf6554f234a24b31d142b37043e3cb6bbffe5d11d60dac34eb163"
    sha256 arm64_sonoma:  "a8e2a5cc575a16cc513cbdc19edd212a115e689b5d7df2f62f80d7cc08140da4"
    sha256 arm64_ventura: "68752adba8c728b86fea019bc7080ee255f3ba81705c54db60d80d34d33db19b"
    sha256 sonoma:        "97ab1744ea1f5e61a445a3c907d381f3b8e9a5d78f5503520a9ad89b22304dc3"
    sha256 ventura:       "afeb776fbe3475093841eb26731f54b8533724de9c96dce750b738a22b848289"
    sha256 x86_64_linux:  "6dcaabe4a79be7ed91b6f89c5725fa421f661b0f70baeec065872bb8fb83dfaa"
      rm_r("third-party/gasnet/gasnet-src/")
      rm_r("third-party/libfabric/libfabric-src/")
      rm_r("third-party/fltk/fltk-1.3.8-source.tar.gz")
      rm_r("third-party/libunwind/libunwind-src/")
      rm_r("third-party/qthread/qthread-src/")