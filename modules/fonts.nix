{pkgs, ...}: {
  home.file.".local/share/fonts/anurati".source = pkgs.fetchzip {
    url = "https://font.download/dl/font/anurati.zip";
    sha256 = "sha256-dmZpAWkryDUYA7YBc2D/T8s2KQVnEgJbtGHJr6arDj4=";
    # Optional: If the zip has a lot of junk, you can strip the root folder
    stripRoot = true;
  };
}
