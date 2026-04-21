{pkgs, ...}: {
  home.file = {
    ".local/share/fonts/anurati".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/anurati.zip";
      sha256 = "sha256-dmZpAWkryDUYA7YBc2D/T8s2KQVnEgJbtGHJr6arDj4=";
      stripRoot = true;
    };
    ".local/share/fonts/automata".source = pkgs.fetchzip {
      url = "https://www.1001fonts.com/download/automata.zip";
      sha256 = "sha256-/FB1xgjkCoMxBOjfnDLlJakzMIx6vLcu8E6PgRbYDoc=";
      stripRoot = false;
    };
    ".local/share/fonts/blockletter".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/blockletter.zip";
      sha256 = "sha256-hDbZS2Un59qvZL8UKzywY4TBNqKt7hoH5HSxBAzLcmU=";
      stripRoot = true;
    };
    ".local/share/fonts/natsu".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/natsu.zip";
      sha256 = "sha256-37+X8ZysUOAk7em+tIgJWjOkXsn93hhJzNXJhm+F6xY=";
      stripRoot = true;
    };
    ".local/share/fonts/electric-formula".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/electric-formula.zip";
      sha256 = "";
      stripRoot = true;
    };
    #".local/share/fonts/elvishring".source = pkgs.fetchzip {
    # url = "https://font.download/dl/font/elvish-ring-nfi-2.zip";
    # sha256 = "";
    # stripRoot = true;
    #};
    #".local/share/fonts/got-heroin".source = pkgs.fetchzip {
    # url = "https://font.download/dl/font/got-heroin.zip";
    # sha256 = "";
    # stripRoot = true;
    #};
    #".local/share/fonts/hobbiton-brush".source = pkgs.fetchzip {
    # url = "https://font.download/dl/font/hobbiton-brush-hand.zip";
    # sha256 = "";
    # stripRoot = true;
    #};
    #".local/share/fonts/infinite-realities".source = pkgs.fetchzip {
    # url = "https://font.download/dl/font/infinite-realities.zip";
    # sha256 = "";
    # stripRoot = true;
    #};
    #".local/share/fonts/aniron".source = pkgs.fetchzip {
    # url = "https://www.1001fonts.com/download/aniron.zip";
    # sha256 = "";
    # stripRoot = true;
    #   };
    #".local/share/fonts/neon".source = pkgs.fetchzip {
    #   url = "https://font.download/dl/font/neon-2.zip";
    #   sha256 = "";
    #   stripRoot = true;
    #  };
    # ".local/share/fonts/punk-kid".source = pkgs.fetchzip {
    #   url = "https://font.download/dl/font/punk-kid.zip";
    #   sha256 = "";
    #   stripRoot = true;
    # };
    # ".local/share/fonts/runy-tunes".source = pkgs.fetchzip {
    #   url = "https://font.download/dl/font/runy-tunes-revisited-nf.zip";
    #   sha256 = "";
    #   stripRoot = true;
    # };
    # ".local/share/fonts/rush-driver".source = pkgs.fetchzip {
    #   url = "https://font.download/dl/font/rush-driver.zip";
    #   sha256 = "";
    #   stripRoot = true;
    # };
    # ".local/share/fonts/saucerbb".source = pkgs.fetchzip {
    #   url = "https://font.download/dl/font/saucer-bb.zip";
    #   sha256 = "";
    #   stripRoot = true;
    # };
    # ".local/share/fonts/the-shire".source = pkgs.fetchzip {
    #   url = "https://font.download/dl/font/the-shire.zip";
    #   sha256 = "";
    #   stripRoot = true;
    # };
    # "./local/share/ringbearer".source = pkgs.fetchzip {
    #   url = "https://www.1001fonts.com/download/ringbearer.zip";
    #   sha256 = "";
    #   stripRoot = true;
    # };
  };
}
