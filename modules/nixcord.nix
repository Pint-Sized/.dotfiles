{userSettings, ...}: {
  programs.nixcord = {
    enable = true;
    quickCss = "
      :root {
        --font: '${userSettings.fontSerif}';
      }

      ::placeholder, body, button, input, select, textarea {
        font-family: var(--font), sans-serif;
      }
    ";
    vesktop = {
      enable = true;
      autoscroll.enable = true;
      settings = {
        audio = {
          input_mode = "1";
        };
        keybinds = {
          PUSHTOTALK = [
            {
              key = "V";
              modifiers = [];
            }
          ];
        };
      };
    };
    config = {
      useQuickCss = true;
      frameless = true;
      plugins = {
        alwaysAnimate.enable = true;
        alwaysTrust.enable = true;
        anonymiseFileNames = {
          enable = true;
          anonymiseByDefault = true;
        };
        betterGifPicker.enable = true;
        betterRoleContext.enable = true;
        betterSettings.enable = true;
        blurNSFW.enable = false;
        callTimer.enable = true;
        clearURLs.enable = true;
        copyUserURLs.enable = true;
        dearrow.enable = true;
        disableCallIdle.enable = true;
        experiments.enable = true;
        fakeNitro.enable = true;
        favoriteEmojiFirst.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        iLoveSpam.enable = true;
        memberCount.enable = true;
        mentionAvatars = {
          enable = true;
          showAtSymbol = false;
        };
        noOnboardingDelay.enable = true;
        noTypingAnimation.enable = true;
        openInApp = {
          enable = true;
          spotify = true;
          steam = true;
          epic = true;
          tidal = true;
          itunes = true;
        };
        petpet.enable = true;
        pictureInPicture.enable = true;
        serverInfo.enable = true;
        serverListIndicators.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        silentTyping = {
          enable = true;
          showIcon = true;
        };
        spotifyCrack.enable = true;
        startupTimings.enable = true;
        typingTweaks.enable = true;
        voiceChatDoubleClick.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
