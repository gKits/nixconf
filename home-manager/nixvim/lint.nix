{
  programs.nixvim.plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        text = [ "vale" ];
        markdown = [ "vale" ];
        dockerfile = [ "hadolint" ];
        python = [ "pylint" ];
        json = [ "jsonlint" ];
      };
    };
  };
}
