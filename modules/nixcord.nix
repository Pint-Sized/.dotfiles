{
  programs.nixcord = {
    enable = true;
    frameless = true;
    config = {
      plugins = {
        alwaysAnimate.eanble = true;
        alwaysTrust.enable = true;
        anonymiseFileNames = {
          enable = true;
          anonymiseFileNamesenable = true;
        };
        betterGifPicker.enable = true;
        betterRoleContext.enable = true;
        betterSettings.eanble = true;
        blurNSFW = {
          enable = true;
          blurAmount = 6;
        };
        callTimer.enable = true;
        clearURLS.enable = true;
        copyUserURLS.eanble = true;
        dearrow.enable = true;
        disableCallIdle.enable = true;
        experiments.enable = true;
        fakeNitro.eanble = true;
        favoriteEmojiFirst.enable = true;
        fixCodeblockGap.enable = true;
        fixImageQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        iLoveSpam.enable = true;
        memeberCount.enable = true;
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
