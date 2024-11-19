{ config, lib, ... }:
{
  programs.nixvim.plugins = {
    neotest = {
      enable = true;

      settings = {
        adapters = lib.optionals config.programs.nixvim.plugins.rustaceanvim.enable [
          # Lua
          ''require('rustaceanvim.neotest')''
        ];
      };

      adapters = {
        bash.enable = config.programs.nixvim.plugins.neotest.enable;
        deno.enable = config.programs.nixvim.plugins.neotest.enable;
        dotnet = {
          inherit (config.programs.nixvim.plugins.neotest) enable;

          settings = {
            dap = {
              args = {
                justMyCode = false;
              };
            };
          };
        };
        go.enable = config.programs.nixvim.plugins.neotest.enable;
        java.enable = config.programs.nixvim.plugins.neotest.enable;
        # NOTE: just run NeotestJava setup
        # java.settings = {
        # Not sure why this wasn't working
        # junit_jar =
        #   pkgs.fetchurl
        #     {
        #       url = "https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.10.1/junit-platform-console-standalone-1.10.1.jar";
        #       hash = "sha256-tC6qU9E1dtF9tfuLKAcipq6eNtr5X0JivG6W1Msgcl8=";
        #     }
        #     .outPath;
        # };
        jest.enable = config.programs.nixvim.plugins.neotest.enable;
        playwright.enable = config.programs.nixvim.plugins.neotest.enable;
        plenary.enable = config.programs.nixvim.plugins.neotest.enable;
        python.enable = config.programs.nixvim.plugins.neotest.enable;
        # rust.enable = config.plugins.neotest.enable;
        zig.enable = config.programs.nixvim.plugins.neotest.enable;
      };
    };

    which-key.settings.spec = lib.optionals config.programs.nixvim.plugins.neotest.enable [
      {
        __unkeyed = "<leader>n";
        group = "Neotest";
        icon = "󰙨";
      }
    ];
  };

  programs.nixvim.keymaps = lib.mkIf config.programs.nixvim.plugins.neotest.enable [
    {
      mode = "n";
      key = "<leader>dn";
      action.__raw = ''
        function()
          require("neotest").run.run({strategy = "dap"})
        end
      '';
      options = {
        desc = "Neotest Debug";
        # TODO: Update Keymap desc
      };
    }
    {
      mode = "n";
      key = "<leader>na";
      action = "<CMD>Neotest attach<CR>";
      options = {
        desc = "Attach";
        # # TODO: Update Keymap desc
      };
    }
    {
      mode = "n";
      key = "<leader>nd";
      action.__raw = ''
        function()
          require("neotest").run.run({strategy = "dap"})
        end
      '';
      options = {
        desc = "Debug";
        # # TODO: Update Keymap desc
      };
    }
    {
      mode = "n";
      key = "<leader>nh";
      action = "<CMD>Neotest output<CR>";
      options = {
        desc = "Output";
        # # TODO: Update Keymap desc
      };
    }
    {
      mode = "n";
      key = "<leader>no";
      action = "<CMD>Neotest output-panel<CR>";
      options = {
        desc = "Output Panel toggle";
        # # TODO: Update Keymap desc
      };
    }
    {
      mode = "n";
      key = "<leader>nr";
      action = "<CMD>Neotest run<CR>";
      options = {
        desc = "Run (Nearest Test)";
        # # TODO: Update Keymap desc
      };
    }
    {
      mode = "n";
      key = "<leader>nR";
      action.__raw = ''
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end
      '';
      options = {
        desc = "Run (File)";
        # # TODO: Update Keymap desc
      };
    }
    {
      mode = "n";
      key = "<leader>ns";
      action = "<CMD>Neotest stop<CR>";
      options = {
        desc = "Stop";
        # # TODO: Update Keymap desc
      };
    }
    {
      mode = "n";
      key = "<leader>nt";
      action = "<CMD>Neotest summary<CR>";
      options = {
        desc = "Summary toggle";
        # # TODO: Update Keymap desc
      };
    }
  ];
}
