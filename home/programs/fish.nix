_:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
    '';

    shellInit = ''
      fish_add_path $HOME/.local/bin
    '';
  };
}
