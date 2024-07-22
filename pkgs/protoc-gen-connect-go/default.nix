{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "protoc-gen-connect-go";
  version = "1.16.2";

  src = fetchFromGitHub {
    hash = "sha256-Ej8ya2sKtRVRQdMr63YpPbqzwtV0ZsqO+7xiif3gFr0=";
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
