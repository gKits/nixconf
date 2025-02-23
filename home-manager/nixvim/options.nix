{

  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";

      loaded_ruby_provider = 0; # Ruby
      loaded_perl_provider = 0; # Perl
      loaded_python_provider = 0; # Python 2
    };

    clipboard = {
      register = "unnamedplus";

      providers.wl-copy.enable = true;
    };

    opts = {
      number = true;
      relativenumber = true;

      shiftwidth = 4;
      tabstop = 4;
      expandtab = true;
      autoindent = true;

      swapfile = false;

      scrolloff = 10;
      cursorline = true;
      signcolumn = "yes";
      wrap = false;

      foldlevel = 300;
    };
  };
}
