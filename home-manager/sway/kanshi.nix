{
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile = {
          name = "laptop";
          outputs = [{
            criteria = "eDP-1";
            status = "enable";
            position = "0,0";
            scale = 1.0;
            mode = "2256x1504@59.999Hz";
            adaptiveSync = true;
          }];
        };
      }
      {
        profile = {
          name = "docked-open";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
              position = "0,0";
              scale = 1.0;
              mode = "2256x1504@59.999Hz";
              adaptiveSync = true;
            }
            {
              criteria =
                "Philips Consumer Electronics Company PHL 34M2C8600 AU42346000005";
              status = "enable";
              position = "2256,0";
              mode = "3440x1440@175Hz";
              adaptiveSync = true;
            }
          ];
        };
      }
      {
        profile = {
          name = "docked";
          outputs = [{
            criteria =
              "Philips Consumer Electronics Company PHL 34M2C8600 AU42346000005";
            status = "enable";
            position = "0,0";
            mode = "3440x1440@175Hz";
            adaptiveSync = true;
          }];
        };
      }
    ];
  };
}
