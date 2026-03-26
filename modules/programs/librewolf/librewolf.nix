{
  flake.modules.homeManager.librewolf = {pkgs, ...}: {
    programs.librewolf = {
      enable = true;
      settings = {
        "middlemouse.paste" = false;
        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.delay" = 0;
        "full-screen-api.warning.timeout" = 0;
        "browser.startup.page" = 3; # Restore previous session
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "permissions.default.shortcuts" = 2;
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "sidebar.position_start" = false;
        "toolkit.tabmanager.enabled" = false;
        "toolkit.tabbox.switchByScrolling" = true;
        "browser.tabs.dragDrop.pinInteractionCue.delayMS" = 999999;
      };

      profiles.default = {
        id = 0;
        isDefault = true;
        userChrome = ''
          #tabs-newtab-button,
          #context_pinTab,
          #alltabs-button,
          #new-tab-button {
            display: none !important;
          };

          #tabbrowser-tabs {
            counter-reset: tab-counter;
          }

          .tabbrowser-tab:nth-child(-n+8) {
            counter-increment: tab-counter;
          }

          .tabbrowser-tab:nth-child(-n+8) .tab-content::before {
            content: counter(tab-counter) "";
            position: absolute;
            left: 0.2em;
            top: 50%;
            transform: translateY(-50%);
            min-width: 1.2em;
            text-align: center;
            font-size: 0.75em;
            font-weight: bold;
            opacity: 0.5;
            z-index: 1;
            pointer-events: none;
          }

          .tabbrowser-tab:nth-child(-n+8) .tabcontent {
            padding-left: 1.4em !important;
          }

          .tab-background {
            border-radius: 0 !important;
            margin: 0 !important;
            margin-block: 0 !important;
            padding: 0 !important;
          }

          .tabbrowser-tab[selected] .tab-background {
            background: rgba(128, 128, 128, 0.4) !important;
          }

          .tabbrowser-tab[selected] .tab-text {
            font-weight: bold !important;
            opacity: 1 !important;
          }
        '';
      };

      policies = {
        SearchEngines = {
          Add = [
            {
              Name = "Kagi";
              URLTemplate = "https://kagi.com/search?q={searchTerms}";
              SuggestURLTemplate = "https://kagi.com/api/autosuggest?q={searchTerms}";
            }
            {
              Name = "Google";
              URLTemplate = "https://google.com/search?q={searchTerms}";
              SuggestURLTemplate = "https://suggestqueries.google.com/complete/search?client=firefox&q={searchTerms}";
            }
          ];
          Default = "Kagi";
        };
        SearchSuggestEnabled = true;
        Cookies = {
          Allow = [
            "https://kagi.com"
          ];
        };
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisablePocket = true;
        DisplayBookmarksToolbar = "never";
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        ExtensionSettings = {
          # "*".installation_mode = "blocked";
          # uBlock Origin
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4598854/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
          };
          # Skip Redirect
          "skipredirect@sblask" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/3920533/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
          };
          # Bitwarden
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4599707/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
          };
          # SponsorBlock
          "sponsorBlocker@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4598130/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            default_area = "menupanel";
          };
          # Reddit Enhancement Suite
          "jid1-xUfzOsOFlzSOXg@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4424459/latest.xpi";
            installation_mode = "force_installed";
          };
          # Old Reddit Redirect
          "{9063c2e9-e07c-4c2c-9646-cfe7ca8d0498}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4526031/latest.xpi";
            installation_mode = "force_installed";
          };
          # DeArrow
          "deArrow@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4656721/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };
          # Tampermonkey
          "firefox@tampermonkey.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4624137/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
          };
        };

        Preferences = {
          "general.autoScroll" = {
            Value = 1;
            Status = "locked";
          };
          "browser.uidensity" = {
            Value = 1;
            Status = "locked";
          };
          "browser.compactmode.show" = {
            Value = true;
            Status = "locked";
          };
          "browser.sessionstore.restore_on_demand" = {
            Value = false;
            Status = "locked";
          };
          "browser.topsites.contile.enabled" = {
            Value = false;
            Status = "locked";
          };
          "browser.formfill.enable" = {
            Value = false;
            Status = "locked";
          };
          "browser.search.suggest.enabled" = {
            Value = false;
            Status = "locked";
          };
          "browser.search.suggest.enabled.private" = {
            Value = false;
            Status = "locked";
          };
          "browser.urlbar.suggest.searches" = {
            Value = false;
            Status = "locked";
          };
          "browser.urlbar.showSearchSuggestionsFirst" = {
            Value = false;
            Status = "locked";
          };
          "browser.tabs.closeWindowWithLastTab" = {
            Value = false;
            Status = "locked";
          };
          "browser.newtabpage.activity-stream.feeds.section.topstories" = {
            Value = false;
            Status = "locked";
          };
          "browser.newtabpage.activity-stream.feeds.snippets" = {
            Value = false;
            Status = "locked";
          };
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = {
            Value = false;
            Status = "locked";
          };
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = {
            Value = false;
            Status = "locked";
          };
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = {
            Value = false;
            Status = "locked";
          };
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = {
            Value = false;
            Status = "locked";
          };
          "browser.newtabpage.activity-stream.showSponsored" = {
            Value = false;
            Status = "locked";
          };
          "browser.newtabpage.activity-stream.system.showSponsored" = {
            Value = false;
            Status = "locked";
          };
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = {
            Value = false;
            Status = "locked";
          };
          "cookiebanners.service.mode.privateBrowsing" = {
            Value = 2;
            Status = "locked";
          };
          "cookiebanners.service.mode" = {
            Value = 2;
            Status = "locked";
          };
          "privacy.donottrackheader.enabled" = {
            Value = true;
            Status = "locked";
          };
          "privacy.fingerprintingProtection" = {
            Value = true;
            Status = "locked";
          };
          "privacy.resistFingerprinting" = {
            Value = true;
            Status = "locked";
          };
          "privacy.trackingprotection.emailtracking.enabled" = {
            Value = true;
            Status = "locked";
          };
          "privacy.trackingprotection.enabled" = {
            Value = true;
            Status = "locked";
          };
          "privacy.trackingprotection.fingerprinting.enabled" = {
            Value = true;
            Status = "locked";
          };
          "privacy.trackingprotection.socialtracking.enabled" = {
            Value = true;
            Status = "locked";
          };
          "signon.rememberSignons" = {
            Value = false;
            Status = "locked";
          };
          "signon.autofillForms" = {
            Value = false;
            Status = "locked";
          };
          "signon.autofillForms.http" = {
            Value = false;
            Status = "locked";
          };
          "signon.storeWhenAutocompleteOff" = {
            Value = false;
            Status = "locked";
          };
          "browser.tabs.insertRelatedAfterCurrent" = {
            Value = false;
            Status = "locked";
          };
        };
      };
    };
  };
}
