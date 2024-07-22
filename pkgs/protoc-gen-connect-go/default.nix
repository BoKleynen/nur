{
  lib,
  buildGoModule,
  fetchFromGitHub,

  version ? "1.16.2",
  hash ? "sha256-Ej8ya2sKtRVRQdMr63YpPbqzwtV0ZsqO+7xiif3gFr0=",
}:

buildGoModule rec {
  inherit version;
  pname = "protoc-gen-connect-go";

  src = fetchFromGitHub {
    inherit hash;
    owner = "connectrpc";
    repo = "connect-go";
    rev = "v${version}";
  };

  vendorHash = "sha256-OKTRxExgJ2V3736fIVvQX3FEa44jGngwCi2D/uk0F58=";

  subPackages = [ "cmd/protoc-gen-connect-go" ];

  meta = with lib; {
    description = "The Go implementation of Connect: Protobuf RPC that works.";
    mainProgram = "protoc-gen-go";
    homepage = "https://connectrpc.com";
    license = licenses.asl20;
  };
}
