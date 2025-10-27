{
  programs = {
    firefox = {
      enable = true;
      profiles."8b2kzims.default" = {
        settings = {
          "browser.startup.homepage" = "http://127.0.0.1:8080";
          "widget.non-native-theme.scrollbar.style" = 3;
          "browser.tabs.closeWindowWithLastTab" = false;
          "rowser.dataFeatureRecommendations.enabled" = false;
          "browser.newtabpage.activity-stream.feeds.recommendationprovider" = false;
          "browser.newtabpage.activity-stream.feeds.recommendationproviderswitcher" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "browser.tabs.loadBookmarksInTabs" = true;
          "general.autoScroll" = true;
          "network.http.rcwn.enabled" = false;
          "privacy.resistFingerprinting" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.uidensity" = 0; # Set UI density to normal
          "svg.context-properties.content.enabled" = true; # Enable SVG context-propertes
          "browser.theme.dark-private-windows" = false; # Disable private window dark theme
        };
        extraConfig = ''
          //
          /* You may copy+paste this file and use it as it is.
           *
           * If you make changes to your about:config while the program is running, the
           * changes will be overwritten by the user.js when the application restarts.
           *
           * To make lasting changes to preferences, you will have to edit the user.js.
           */

          /****************************************************************************
           * Betterfox                                                                *
           * "Ad meliora"                                                             *
           * version: 137                                                             *
           * url: https://github.com/yokoffing/Betterfox                              *
          ****************************************************************************/

          /****************************************************************************
           * SECTION: FASTFOX                                                         *
          ****************************************************************************/
          /** GENERAL ***/
          user_pref("content.notify.interval", 100000);

          /** GFX ***/
          user_pref("gfx.canvas.accelerated.cache-size", 512);
          user_pref("gfx.content.skia-font-cache-size", 20);

          /** DISK CACHE ***/
          user_pref("browser.cache.disk.enable", false);

          /** MEDIA CACHE ***/
          user_pref("media.memory_cache_max_size", 65536);
          user_pref("media.cache_readahead_limit", 7200);
          user_pref("media.cache_resume_threshold", 3600);

          /** IMAGE CACHE ***/
          user_pref("image.mem.decode_bytes_at_a_time", 32768);

          /** NETWORK ***/
          user_pref("network.http.max-connections", 1800);
          user_pref("network.http.max-persistent-connections-per-server", 10);
          user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);
          user_pref("network.http.pacing.requests.enabled", false);
          user_pref("network.dnsCacheExpiration", 3600);
          user_pref("network.ssl_tokens_cache_capacity", 10240);

          /** SPECULATIVE LOADING ***/
          user_pref("network.dns.disablePrefetch", true);
          user_pref("network.dns.disablePrefetchFromHTTPS", true);
          user_pref("network.prefetch-next", false);
          user_pref("network.predictor.enabled", false);
          user_pref("network.predictor.enable-prefetch", false);

          /** EXPERIMENTAL ***/
          user_pref("layout.css.grid-template-masonry-value.enabled", true);

          /****************************************************************************
           * SECTION: SECUREFOX                                                       *
          ****************************************************************************/
          /** TRACKING PROTECTION ***/
          user_pref("browser.contentblocking.category", "strict");
          user_pref("browser.download.start_downloads_in_tmp_dir", true);
          user_pref("browser.helperApps.deleteTempFileOnExit", true);
          user_pref("browser.uitour.enabled", false);
          user_pref("privacy.globalprivacycontrol.enabled", true);

          /** OCSP & CERTS / HPKP ***/
          user_pref("security.OCSP.enabled", 0);
          user_pref("security.pki.crlite_mode", 2);

          /** SSL / TLS ***/
          user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
          user_pref("browser.xul.error_pages.expert_bad_cert", true);
          user_pref("security.tls.enable_0rtt_data", false);

          /** DISK AVOIDANCE ***/
          user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
          user_pref("browser.sessionstore.interval", 60000);

          /** SHUTDOWN & SANITIZING ***/
          user_pref("browser.privatebrowsing.resetPBM.enabled", true);
          user_pref("privacy.history.custom", true);

          /** SEARCH / URL BAR ***/
          user_pref("browser.urlbar.trimHttps", true);
          user_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true);
          user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
          user_pref("browser.urlbar.update2.engineAliasRefresh", true);
          user_pref("browser.search.suggest.enabled", false);
          user_pref("browser.urlbar.quicksuggest.enabled", false);
          user_pref("browser.urlbar.groupLabels.enabled", false);
          user_pref("browser.formfill.enable", false);
          user_pref("network.IDN_show_punycode", true);

          /** PASSWORDS ***/
          user_pref("signon.formlessCapture.enabled", false);
          user_pref("signon.privateBrowsingCapture.enabled", false);
          user_pref("network.auth.subresource-http-auth-allow", 1);
          user_pref("editor.truncate_user_pastes", false);

          /** MIXED CONTENT + CROSS-SITE ***/
          user_pref("security.mixed_content.block_display_content", true);
          user_pref("pdfjs.enableScripting", false);

          /** EXTENSIONS ***/
          user_pref("extensions.enabledScopes", 5);

          /** HEADERS / REFERERS ***/
          user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

          /** CONTAINERS ***/
          user_pref("privacy.userContext.ui.enabled", true);

          /** SAFE BROWSING ***/
          user_pref("browser.safebrowsing.downloads.remote.enabled", false);

          /** MOZILLA ***/
          user_pref("permissions.default.desktop-notification", 2);
          user_pref("permissions.default.geo", 2);
          user_pref("geo.provider.network.url", "https://beacondb.net/v1/geolocate");
          user_pref("browser.search.update", false);
          user_pref("permissions.manager.defaultsUrl", "");

          /** TELEMETRY ***/
          user_pref("datareporting.policy.dataSubmissionEnabled", false);
          user_pref("datareporting.healthreport.uploadEnabled", false);
          user_pref("toolkit.telemetry.unified", false);
          user_pref("toolkit.telemetry.enabled", false);
          user_pref("toolkit.telemetry.server", "data:,");
          user_pref("toolkit.telemetry.archive.enabled", false);
          user_pref("toolkit.telemetry.newProfilePing.enabled", false);
          user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
          user_pref("toolkit.telemetry.updatePing.enabled", false);
          user_pref("toolkit.telemetry.bhrPing.enabled", false);
          user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
          user_pref("toolkit.telemetry.coverage.opt-out", true);
          user_pref("toolkit.coverage.opt-out", true);
          user_pref("toolkit.coverage.endpoint.base", "");
          user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
          user_pref("browser.newtabpage.activity-stream.telemetry", false);

          /** EXPERIMENTS ***/
          user_pref("app.shield.optoutstudies.enabled", false);
          user_pref("app.normandy.enabled", false);
          user_pref("app.normandy.api_url", "");

          /** CRASH REPORTS ***/
          user_pref("breakpad.reportURL", "");
          user_pref("browser.tabs.crashReporting.sendReport", false);

          /** DETECTION ***/
          user_pref("captivedetect.canonicalURL", "");
          user_pref("network.captive-portal-service.enabled", false);
          user_pref("network.connectivity-service.enabled", false);

          /****************************************************************************
           * SECTION: PESKYFOX                                                        *
          ****************************************************************************/
          /** MOZILLA UI ***/
          user_pref("browser.privatebrowsing.vpnpromourl", "");
          user_pref("extensions.getAddons.showPane", false);
          user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
          user_pref("browser.discovery.enabled", false);
          user_pref("browser.shell.checkDefaultBrowser", false);
          user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
          user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
          user_pref("browser.preferences.moreFromMozilla", false);
          user_pref("browser.aboutConfig.showWarning", false);
          user_pref("browser.aboutwelcome.enabled", false);
          user_pref("browser.profiles.enabled", true);

          /** THEME ADJUSTMENTS ***/
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          user_pref("browser.compactmode.show", true);
          user_pref("browser.privateWindowSeparation.enabled", false); // WINDOWS

          /** FULLSCREEN NOTICE ***/
          user_pref("full-screen-api.transition-duration.enter", "0 0");
          user_pref("full-screen-api.transition-duration.leave", "0 0");
          user_pref("full-screen-api.warning.timeout", 0);

          /** URL BAR ***/
          user_pref("browser.urlbar.unitConversion.enabled", true);
          user_pref("browser.urlbar.trending.featureGate", false);
          user_pref("dom.text_fragments.create_text_fragment.enabled", true);

          /** NEW TAB PAGE ***/
          user_pref("browser.newtabpage.activity-stream.default.sites", "");
          user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
          user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
          user_pref("browser.newtabpage.activity-stream.showSponsored", false);

          /** POCKET ***/
          user_pref("extensions.pocket.enabled", false);

          /** DOWNLOADS ***/
          user_pref("browser.download.manager.addToRecentDocs", false);

          /** PDF ***/
          user_pref("browser.download.open_pdf_attachments_inline", true);

          /** TAB BEHAVIOR ***/
          user_pref("browser.bookmarks.openInTabClosesMenu", false);
          user_pref("browser.menu.showViewImageInfo", true);
          user_pref("findbar.highlightAll", true);
          user_pref("layout.word_select.eat_space_to_next_word", false);

          /****************************************************************************
           * START: MY OVERRIDES                                                      *
          ****************************************************************************/
          // visit https://github.com/yokoffing/Betterfox/wiki/Common-Overrides
          // visit https://github.com/yokoffing/Betterfox/wiki/Optional-Hardening
          // Enter your personal overrides below this line:
          user_pref("identity.fxaccounts.enabled", false);
          user_pref("browser.firefox-view.feature-tour", "{\"screen\":\"\",\"complete\":true}");
          user_pref("signon.rememberSignons", false);
          user_pref("extensions.formautofill.addresses.enabled", false);
          user_pref("extensions.formautofill.creditCards.enabled", false);
          user_pref("dom.security.https_only_mode", true);
          user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);
          user_pref("network.trr.mode", 3);
          user_pref("media.eme.enabled", false);


          /****************************************************************************
           * SECTION: SMOOTHFOX                                                       *
          ****************************************************************************/
          // visit https://github.com/yokoffing/Betterfox/blob/main/Smoothfox.js
          // Enter your scrolling overrides below this line:



          /****************************************************************************
           * END: BETTERFOX                                                           *
          ****************************************************************************/
        '';
        userChrome = ''
          /* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/autohide_toolbox.css made available under Mozilla Public License v. 2.0
          See the above repository for updates as well as full license text. */

          /* Hide the whole toolbar area unless urlbar is focused or cursor is over the toolbar
           * Dimensions on non-Win10 OS probably needs to be adjusted.
           */

          :root{
            --uc-autohide-toolbox-delay: 200ms; /* Wait 0.1s before hiding toolbars */
            --uc-toolbox-rotation: 82deg;  /* This may need to be lower on mac - like 75 or so */
          }

          :root[sizemode="maximized"]{
            --uc-toolbox-rotation: 88.5deg;
          }

          @media  (-moz-platform: windows){
            :root:not([lwtheme]) #navigator-toolbox{ background-color: -moz-dialog !important; }
          }

          :root[sizemode="fullscreen"],
          :root[sizemode="fullscreen"] #navigator-toolbox{ margin-top: 0 !important; }

          #navigator-toolbox{
            --browser-area-z-index-toolbox: 3;
            position: fixed !important;
            background-color: var(--lwt-accent-color,black) !important;
            transition: transform 82ms linear, opacity 82ms linear !important;
            transition-delay: var(--uc-autohide-toolbox-delay) !important;
            transform-origin: top;
            transform: rotateX(var(--uc-toolbox-rotation));
            opacity: 0;
            line-height: 0;
            z-index: 1;
            pointer-events: none;
            width: 100vw;
          }
          :root[sessionrestored] #urlbar[popover]{
            pointer-events: none;
            opacity: 0;
            transition: transform 82ms linear var(--uc-autohide-toolbox-delay), opacity 0ms calc(var(--uc-autohide-toolbox-delay) + 82ms);
            transform-origin: 0px calc(0px - var(--tab-min-height) - var(--tab-block-margin) * 2);
            transform: rotateX(89.9deg);
          }

          :root[window-modal-open] #urlbar[popover],
          #mainPopupSet:has(> [panelopen]:not(#ask-chat-shortcuts,#selection-shortcut-action-panel,#chat-shortcuts-options-panel,#tab-preview-panel)) ~ toolbox #urlbar[popover],
          #navigator-toolbox:is(:hover,:focus-within,[movingtab]) #urlbar[popover],
          #urlbar-container > #urlbar[popover]:is([focused],[open]){
            pointer-events: auto;
            opacity: 1;
            transition-delay: 33ms;
            transform: rotateX(0deg);
          }

          :root[window-modal-open] #navigator-toolbox,
          #mainPopupSet:has(> [panelopen]:not(#ask-chat-shortcuts,#selection-shortcut-action-panel,#chat-shortcuts-options-panel,#tab-preview-panel)) ~ toolbox,
          #navigator-toolbox:has(#urlbar:is([open],[focus-within])),
          #navigator-toolbox:is(:hover,:focus-within,[movingtab]){
            transition-delay: 33ms !important;
            transform: rotateX(0);
            opacity: 1;
          }
          /* This makes things like OS menubar/taskbar show the toolbox when hovered in maximized windows.
           * Unfortunately it also means that other OS native surfaces (such as context menu on macos)
           * and other always-on-top applications will trigger toolbox to show up. */
          @media (-moz-bool-pref: "userchrome.autohide-toolbox.unhide-by-native-ui.enabled"),
                 -moz-pref("userchrome.autohide-toolbox.unhide-by-native-ui.enabled"){
            :root[sizemode="maximized"]:not(:hover){
              #navigator-toolbox:not(:-moz-window-inactive),
              #urlbar[popover]:not(:-moz-window-inactive){
                transition-delay: 33ms !important;
                transform: rotateX(0);
                opacity: 1;
              }
            }
          }

          #navigator-toolbox > *{ line-height: normal; pointer-events: auto }

          /* Don't apply transform before window has been fully created */
          :root:not([sessionrestored]) #navigator-toolbox{ transform:none !important }

          :root[customizing] #navigator-toolbox{
            position: relative !important;
            transform: none !important;
            opacity: 1 !important;
          }

          #navigator-toolbox[inFullscreen] > #PersonalToolbar,
          #PersonalToolbar:is([collapsed=""],[collapsed="true"]){ display: none }

          /* This is a bit hacky fix for an issue that will make urlbar zero pixels tall after you enter customize mode */
          #urlbar[breakout][breakout-extend] > .urlbar-input-container{
            padding-block: calc(min(4px,(var(--urlbar-container-height) - var(--urlbar-height)) / 2) + var(--urlbar-container-padding)) !important;
          }

          /* Uncomment this if tabs toolbar is hidden with hide_tabs_toolbar.css */
           /*#titlebar{ margin-bottom: -9px }*/

          /* Uncomment the following for compatibility with tabs_on_bottom.css - this isn't well tested though */
          /*
          #navigator-toolbox{ flex-direction: column; display: flex; }
          #titlebar{ order: 2 }
          */
        '';
      };
    };
  };
  stylix.targets.firefox = {
    enable = true;
    profileNames = ["8b2kzims.default"];
    firefoxGnomeTheme.enable = true;
  };
}
