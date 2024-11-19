{ ... }:
{
  programs.nixvim = {
    plugins = {
      which-key = {
        enable = true;
        settings = {
          spec = [
            {
              __unkeyed-1 = "<leader>c";
              desc = "[C]ode";
              # TODO: Update Description
            }
            {
              __unkeyed-1 = "<leader>d";
              desc = "[D]ocument";
              # TODO: Update Description
            }

            {
              __unkeyed-1 = "<leader>r";
              # TODO: Update Description
              desc = "[R]ename";
            }
            {
              __unkeyed-1 = "<leader>s";
              desc = "[S]earch";
              # TODO: Update Description
            }
            {
              __unkeyed-1 = "<leader>w";
              desc = "[W]orkspace";
              # TODO: Update Description
            }
            {
              __unkeyed-1 = "<leader>t";
              desc = "[T]oggle";
              # TODO: Update Description
            }

            {
              __unkeyed-1 = "<leader>h";
              desc = "Git [H]unk";
              # TODO: Update Description
              mode = [
                "n"
                "v"
              ];
            }
          ];
        };
      };
    };
  };
}
