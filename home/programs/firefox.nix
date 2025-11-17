{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
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
        };
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4599707/latest.xpi";
          installation_mode = "force_installed";
        };
        # SponsorBlock
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4598130/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      Preferences = {
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
        "browser.startup.page" = {Value = 3;}; # Restore previous session
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
      };
    };
  };
}
