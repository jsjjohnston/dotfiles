{ ... }:
{
  programs.nixvim = {
    plugins = {
      which-key = {
        enable = true;
        settings = {
          preset = "modern";
          spec = [
            {
              __unkeyed-1 = "<leader>l";
              desc = "[L]sp";
            }
            {
              __unkeyed-1 = "<leader>gt";
              desc = "[T]oggle";
            }
            {
              __unkeyed-1 = "<leader>g";
              desc = "[G]it";
            }
            {
              __unkeyed-1 = "<leader>f";
              desc = "[F]ind";
            }
            {
              __unkeyed-1 = "<leader>sg";
              desc = "[G]it";
            }
            {
              __unkeyed-1 = "<leader>gh";
              desc = "Git [H]unk";
            }
            {
              __unkeyed-1 = "<leader>bp";
              desc = "[P]ick";
            }
            {
              __unkeyed-1 = "<leader>bs";
              desc = "[S]ort";
            }
            {
              __unkeyed-1 = "<leader>b";
              desc = "[B]uffer";
            }
            {
              __unkeyed-1 = "<leader>c";
              desc = "[C]ode";
            }
            {
              __unkeyed-1 = "<leader>d";
              desc = "[D]ocument";
            }

            {
              __unkeyed-1 = "<leader>r";
              desc = "[R]efactor";
            }
            {
              __unkeyed-1 = "<leader>s";
              desc = "[S]earch";
            }
            {
              __unkeyed-1 = "<leader>w";
              desc = "[W]orkspace";
            }
            {
              __unkeyed-1 = "<leader>jl";
              desc = "[L]ist";
            }
            {
              __unkeyed-1 = "<leader>j";
              desc = "[J]ira";
            }
            {
              __unkeyed-1 = "<leader>t";
              desc = "[T]oggle";
            }

            {
              __unkeyed-1 = "<leader>h";
              desc = "Git [H]unk";
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
