with import <nixpkgs> { };
stdenv.mkDerivation {
  pname = "nfusr";
  version = "1.0.0";
  src = fetchFromGitHub{
    owner = "facebookarchive";
    repo = "nfusr";
    rev = "4c21b69f201b50b8f1dd3aac0125baa3b5d02ade";
    hash = "sha256-Uy3g3PURmYzyMcNbd7g94pVRKAowAiATTOO9fetycrg=";
  };

  patchPhase = ''
    mv NfsClient.cpp NfsClient.old
    echo "#include <sys/sysmacros.h>" >> NfsClient.cpp
    cat NfsClient.old >> NfsClient.cpp
  '';
 
  preConfigure = ''
    autoreconf -vif
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -c mount.nfusr $out/bin
    install -c nfusr $out/bin
  '';

  buildInputs = [ fuse git autoreconfHook libnfs ];

  enableParallelBuilding = true;
}
