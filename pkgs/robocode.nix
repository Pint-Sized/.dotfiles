{
  lib,
  stdenvNoCC,
  fetchurl,
  unzip,
  jdk,
  rsync,
  makeWrapper,
  copyDesktopItems,
  makeDesktopItem,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "robocode";
  version = "1.11.2";

  src = fetchurl {
    url = "https://github.com/robo-code/robocode/releases/download/v${finalAttrs.version}/robocode-${finalAttrs.version}-setup.jar";
    hash = "sha256-5zX5tXNoQMF+gy74I4381FfDH3mximM/gZIpan1l/Sc=";
  };

  nativeBuildInputs = [
    unzip
    makeWrapper
    copyDesktopItems
  ];

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/robocode
    unzip -q $src -d $out/share/robocode
    rm -rf $out/share/robocode/{net,META-INF}
    rm -f $out/share/robocode/*.{bat,command,ico,ico.asc}

    install -Dm644 $out/share/robocode/desktop/robocode.png $out/share/icons/hicolor/128x128/apps/robocode.png

    # Robocode writes to its working directory, so run from a writable copy
    makeWrapper ${jdk}/bin/java $out/bin/.robocode-java
    cat > $out/bin/robocode <<SCRIPT
    #!${stdenvNoCC.shell}
    src=$out/share/robocode
    dir="\''${ROBOCODE_HOME:-\''${XDG_DATA_HOME:-\$HOME/.local/share}/robocode}"
    if [ "\$(cat "\$dir/.nix-src" 2>/dev/null)" != "\$src" ]; then
      mkdir -p "\$dir"
      ${rsync}/bin/rsync -rl --chmod=u+rwX --ignore-existing "\$src/" "\$dir/"
      ${rsync}/bin/rsync -rl --chmod=u+rwX --delete "\$src/libs/" "\$dir/libs/"
      echo "\$src" > "\$dir/.nix-src"
    fi
    cd "\$dir"
    exec ${jdk}/bin/java -cp "libs/*" -Xmx512M \\
      -XX:+IgnoreUnrecognizedVMOptions \\
      --add-opens=java.base/sun.net.www.protocol.jar=ALL-UNNAMED \\
      --add-opens=java.base/java.lang.reflect=ALL-UNNAMED \\
      --add-opens=java.desktop/javax.swing.text=ALL-UNNAMED \\
      --add-opens=java.desktop/sun.awt=ALL-UNNAMED \\
      robocode.Robocode "\$@"
    SCRIPT
    sed -i 's/^    //' $out/bin/robocode
    chmod +x $out/bin/robocode
    rm $out/bin/.robocode-java

    runHook postInstall
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "robocode";
      desktopName = "Robocode";
      exec = "robocode";
      icon = "robocode";
      comment = "Programming game: build the best battle tank";
      categories = [
        "Game"
        "Education"
      ];
    })
  ];

  meta = {
    description = "Programming game where you code robot tanks to battle each other";
    homepage = "https://robocode.sourceforge.io/";
    license = lib.licenses.epl10;
    sourceProvenance = [ lib.sourceTypes.binaryBytecode ];
    mainProgram = "robocode";
    platforms = lib.platforms.linux;
  };
})
