{ ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      showboat = pkgs.buildGoModule {
        pname = "showboat";
        version = "unstable";
        src = ../..;
        vendorHash = "sha256-mGKxBRU5TPgdmiSx0DHEd0Ys8gsVD/YdBfbDdSVpC3U=";
        subPackages = [ "." ];
        doCheck = false;
        ldflags = [
          "-s"
          "-w"
        ];
      };
    in
    {
      packages = {
        inherit showboat;
        default = showboat;
      };
    };
}
