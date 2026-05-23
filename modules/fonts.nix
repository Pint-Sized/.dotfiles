{ pkgs, ... }:
{
  home.file = {
    ".local/share/fonts/anakron".source = pkgs.fetchzip {
      url = "https://github.com/molarmanful/ANAKRON/releases/download/v0.0.1/anakron-release_v0.0.1.zip";
      sha256 = "sha256-6sZ0c4G48RXOM1RQnJg8Dq7hFRSG5tYmf9Ml4ChRTf8=";
      stripRoot = true;
    };
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
      sha256 = "sha256-jOEwnX5ZqNEelajp2priG+U67GllefSmH+JuuVOyAa0=";
      stripRoot = false;
    };
    ".local/share/fonts/elvishring".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/elvish-ring-nfi-2.zip";
      sha256 = "sha256-XWyP8Z5uMzQz2y3fovFvBVBXZxbmBz8rbqEwDRLCU30=";
      stripRoot = true;
    };
    ".local/share/fonts/got-heroin".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/got-heroin.zip";
      sha256 = "sha256-pldDDYX4EFtWiCUcNKzZP5lm53i4vA4fT5CmP/W7MoM=";
      stripRoot = true;
    };
    ".local/share/fonts/hobbiton-brush".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/hobbiton-brush-hand.zip";
      sha256 = "sha256-l5kgDA9V+432caTFnhhC0l/HHnxzTgKSDqpswyWfo4M=";
      stripRoot = true;
    };
    ".local/share/fonts/infinite-realities".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/infinite-realities.zip";
      sha256 = "sha256-WTColf3rm7Tfeqwp9g3EAHF91fzF3M5EHrLnqNJcqQ0=";
      stripRoot = false;
    };
    ".local/share/fonts/aniron".source = pkgs.fetchzip {
      url = "https://www.1001fonts.com/download/aniron.zip";
      sha256 = "sha256-LVZf9kZP0ructTxg2CLp53dO4epzQiFz/vCIIn9/ljI=";
      stripRoot = false;
    };
    ".local/share/fonts/neon".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/neon-2.zip";
      sha256 = "sha256-9Ec6RkeARSe48aqUFmDmJvSkjGcxjxZQuk8/g7mJeEc=";
      stripRoot = true;
    };
    ".local/share/fonts/punk-kid".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/punk-kid.zip";
      sha256 = "sha256-fe064pPdudwzOmZ4epegDWFOUmpNVMoZRp8iG4dlwtk=";
      stripRoot = true;
    };
    ".local/share/fonts/runy-tunes".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/runy-tunes-revisited-nf.zip";
      sha256 = "sha256-uyXRkrsGiTAJ5KWL/scoffKaoEW/bTfVQCVQ8o72o9k=";
      stripRoot = true;
    };
    ".local/share/fonts/rush-driver".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/rush-driver.zip";
      sha256 = "sha256-ltSODZEmBJXBwH2E30kOJ3veCuOupKvFDK0mhgHUuF0=";
      stripRoot = true;
    };
    ".local/share/fonts/saucerbb".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/saucer-bb.zip";
      sha256 = "sha256-qZ9m+NWXutkussbxA2w048yec2UKW32NMSgr90Cg6k4=";
      stripRoot = true;
    };
    ".local/share/fonts/the-shire".source = pkgs.fetchzip {
      url = "https://font.download/dl/font/the-shire.zip";
      sha256 = "sha256-qXxVXyxSfllgRLezXlJy2hdG9dAsxT2FyzfikWuTuao=";
      stripRoot = false;
    };
    ".local/share/fonts/ringbearer".source = pkgs.fetchzip {
      url = "https://www.1001fonts.com/download/ringbearer.zip";
      sha256 = "sha256-j9Dlqs9UNgCtVWiPWpftwvpaAkCiiudH+seGY05gE5w=";
      stripRoot = false;
    };
  };
}
