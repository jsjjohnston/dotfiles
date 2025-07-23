{
  programs.sesh = {
    enable = true;
    settings = {
      default_session = {
        # startup_command = "nvim";
        windows = ["nvim" "bash" "lazygit"];
        window = [
          {
            name = "nvim";
            startup_script = "nvim .";
          }
          {
            name = "bash";
            startup_script = "ls";
          }
          {
            name = "lazygit";
            startup_script = "lazygit";
          }
        ];
      };
      session = [
        {
          name = "mgs";
          path = "~/projects/montu/montu-group-services.gitmain
";
          startup_command = "git pull";
          windows = ["nvim" "bash" "lazygit"];
          window = [
            {
              name = "nvim";
              startup_script = "nvim .";
            }
            {
              name = "bash";
              startup_script = "ls";
            }
            {
              name = "lazygit";
              startup_script = "lazygit";
            }
          ];
        }
        {
          name = "Server";
          path = "~/";
          startup_command = "ssh jay@ssh.aldarow.dev";
        }
        {
          name = "Downloads";
          path = "~/Downloads";
          startup_command = "yazi";
        }
      ];
    };
  };
}
