requires "lemmas.k"

module VERIFICATION
  imports LEMMAS

  // proxy with target 0x420
  syntax ByteArray ::= "#proxyTemplate"
  rule #proxyTemplate => #parseByteStack("0x7300000000000000000000000000000000000004203d366025573d3d3d3d34865af16031565b363d3d373d3d363d855af45b3d82803e603c573d81fd5b3d81f3") [macro]

endmodule
