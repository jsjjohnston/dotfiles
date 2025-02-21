{lib, ...}: {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;

    settings = {
      add_newline = true;
      command_timeout = 1000;
      format = lib.concatStrings [
        "$shell"
        "$battery"
        "$os"
        "$time"
        "($nix_shell$container$git_metrics)$cmd_duration\n"
        "$hostname"
        "$localip"
        "$shlvl"
        "$env_var"
        "$jobs"
        "$sudo"
        "$username"
        "$kubernetes"
        "$directory"
        "$vcsh"
        "$fossil_branch"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_status"
        "$hg_branch"
        "$pijul_channel"
        "$docker_context"
        "$package"
        "$c"
        "$cmake"
        "$cobol"
        "$daml"
        "$dart"
        "$deno"
        "$dotnet"
        "$elixir"
        "$elm"
        "$erlang"
        "$fennel"
        "$golang"
        "$guix_shell"
        "$haskell"
        "$haxe"
        "$helm"
        "$java"
        "$julia"
        "$kotlin"
        "$gradle"
        "$lua"
        "$nodejs"
        "$ocaml"
        "$opa"
        "$perl"
        "$php"
        "$pulumi"
        "$purescript"
        "$python"
        "$raku"
        "$rlang"
        "$red"
        "$ruby"
        "$rust"
        "$scala"
        "$solidity"
        "$swift"
        "$terraform"
        "$vlang"
        "$vagrant"
        "$zig"
        "$buf"
        "$conda"
        "$meson"
        "$spack"
        "$memory_usage"
        "$aws"
        "$gcloud"
        "$openstack"
        "$azure"
        "$crystal"
        "$custom"
        "$status"
        "$character"
      ];
      kubernetes = {
        symbol = "";
        disabled = false;
      };
      palette = "cyberdream";

      palettes.cyberdream = {
        base00 = "16181a";
        base01 = "1e2124";
        base02 = "3c4048";
        base03 = "7b8496";
        base04 = "7b8496";
        base05 = "ffffff";
        base06 = "16181a";
        base07 = "ffffff";
        base08 = "ff6e5e";
        base09 = "ffbd5e";
        base0A = "f1ff5e";
        base0B = "5eff6c";
        base0C = "5ef1ff";
        base0D = "5ea1ff";
        base0E = "bd5eff";
        base0F = "ff5ef1";
      };
      hostname = {
        ssh_symbol = "";
      };

      character = {
        format = "$symbol ";
        success_symbol = "[](bold italic bright-yellow)";
        error_symbol = "[](italic purple)";
        vimcmd_symbol = "[■](italic dimmed green)";
        vimcmd_replace_one_symbol = "◌";
        vimcmd_replace_symbol = "□";
        vimcmd_visual_symbol = "▼";
      };
      env_var.VIMSHELL = {
        format = "[$env_value]($style)";
        style = "green italic";
      };
      sudo = {
        format = "[$symbol]($style)";
        style = "bold italic bright-purple";
        symbol = "󰡗 ";
        disabled = false;
      };
      username = {
        style_user = "bright-yellow bold italic";
        style_root = "purple bold italic";
        format = "[ $user]($style) ";
        disabled = false;
        show_always = false;
      };
      directory = {
        home_symbol = "";
        truncation_length = 2;
        truncation_symbol = "󰩫 ";
        read_only = " 󰌾";
        use_os_path_sep = true;
        style = "italic blue";
        format = "[$path]($style)[$read_only]($read_only_style)";
        repo_root_style = "bold blue";
        repo_root_format = "[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) [](bold bright-blue)";
      };
      cmd_duration = {
        format = "[ ◄ $duration ](italic white)";
        show_notifications = true;
      };
      jobs = {
        format = "[$symbol$number]($style) ";
        style = "white";
        symbol = "[▶](blue italic)";
      };
      localip = {
        ssh_only = true;
        format = " 󰩟[$localipv4](bold magenta)";
        disabled = false;
      };
      time = {
        disabled = false;
        use_12hr = true;
        format = "[$time]($style) ";
        time_format = "%R%P";
        utc_time_offset = "local";
        style = "italic dimmed white";
      };
      battery = {
        format = "[ $percentage $symbol]($style)";
        full_symbol = "█";
        charging_symbol = "[↑](italic bold green)";
        discharging_symbol = "↓";
        unknown_symbol = "░";
        empty_symbol = "▃";
        display = [
          {
            threshold = 20;
            style = "italic bold red";
          }
          {
            threshold = 60;
            style = "italic dimmed bright-purple";
          }
          {
            threshold = 70;
            style = "italic dimmed yellow";
          }
        ];
      };
      git_branch = {
        format = " [$branch(:$remote_branch)]($style)";
        symbol = "[△](bold italic bright-blue)";
        style = "italic bright-blue";
        truncation_symbol = "⋯";
        truncation_length = 11;
        ignore_branches = ["main" "master"];
        only_attached = true;
      };
      git_metrics = {
        format = "([$added]($added_style)) ([$deleted]($deleted_style))";
        added_style = "italic dimmed green";
        deleted_style = "italic dimmed red";
        ignore_submodules = true;
        disabled = false;
      };
      git_status = {
        style = "bold italic bright-blue";
        format = "([⎪$ahead_behind$staged$modified$untracked$renamed$deleted$conflicted$stashed⎥]($style))";
        conflicted = "[◪◦](italic bright-magenta)";
        ahead = "[▴│[$count](bold white)│](italic green)";
        behind = "[▿│[\${count}](bold white)│](italic red)";
        diverged = "[◇ ▴┤[\${ahead_count}](regular white)│▿┤[\${behind_count}](regular white)│](italic bright-magenta)";
        untracked = "[◌◦](italic bright-yellow)";
        stashed = "[◃◈](italic white)";
        modified = "[●◦](italic yellow)";
        staged = "[▪┤[$count](bold white)│](italic bright-cyan)";
        renamed = "[◎◦](italic bright-blue)";
        deleted = "[✕](italic red)";
      };

      deno = {
        format = " [deno](italic) [∫ $version](green bold)";
        version_format = "\${raw}";
      };

      lua = {
        format = " [lua](italic) [\${symbol}\${version}]($style)";
        version_format = "\${raw}";
        symbol = "⨀ ";
        style = "bold bright-yellow";
      };

      nodejs = {
        format = " [node](italic) [◫ ($version)](bold bright-green)";
        version_format = "\${raw}";
        detect_files = ["package-lock.json" "yarn.lock"];
        detect_folders = ["node_modules"];
        detect_extensions = [];
      };

      python = {
        format = " [py](italic) [\${symbol}\${version}]($style)";
        symbol = "[⌉](bold bright-blue)⌊ ";
        version_format = "\${raw}";
        style = "bold bright-yellow";
      };

      rust = {
        format = " [rs](italic) [$symbol$version]($style)";
        symbol = "⊃ ";
        version_format = "\${raw}";
        style = "bold red";
      };

      package = {
        format = " [pkg](italic dimmed) [$symbol$version]($style)";
        version_format = "\${raw}";
        symbol = "◨ ";
        style = "dimmed yellow italic bold";
      };

      swift = {
        format = " [sw](italic) [\${symbol}\${version}]($style)";
        symbol = "◁ ";
        style = "bold bright-red";
        version_format = "\${raw}";
      };

      aws = {
        disabled = true;
        format = " [aws](italic) [$symbol $profile $region]($style)";
        style = "bold blue";
        symbol = "  ";
      };

      buf = {
        symbol = " ";
        format = " [buf](italic) [$symbol $version $buf_version]($style)";
      };

      c = {
        symbol = " ";
        format = " [$symbol($version(-$name))]($style)";
      };

      conda = {
        symbol = "◯ ";
        format = " conda [$symbol$environment]($style)";
      };

      dart = {
        symbol = "◁◅ ";
        format = " dart [$symbol($version )]($style)";
      };

      docker_context = {
        symbol = "◧ ";
        format = " docker [$symbol$context]($style)";
      };

      elixir = {
        symbol = "△ ";
        format = " exs [$symbol $version OTP $otp_version ]($style)";
      };

      elm = {
        symbol = "◩ ";
        format = " elm [$symbol($version )]($style)";
      };

      golang = {
        symbol = "∩ ";
        format = " go [$symbol($version )]($style)";
      };

      haskell = {
        symbol = "❯λ ";
        format = " hs [$symbol($version )]($style)";
      };

      java = {
        symbol = "∪ ";
        format = " java [\${symbol}(\${version} )]($style)";
      };

      julia = {
        symbol = "◎ ";
        format = " jl [$symbol($version )]($style)";
      };

      memory_usage = {
        symbol = "▪▫▪ ";
        format = " mem [\${ram}( \${swap})]($style)";
      };

      nix_shell = {
        style = "bold italic dimmed blue";
        symbol = "󱄅";
        format = "[$symbol nix⎪$state⎪]($style) [$name](italic dimmed white)";
        impure_msg = "[󱕼](bold dimmed red)";
        pure_msg = "[󰿞](bold dimmed green)";
        unknown_msg = "[](bold dimmed yellow)";
      };
      shell = {
        bash_indicator = " ";
        fish_indicator = "󰈺 ";
        disabled = false;
      };
      spack = {
        symbol = "◇ ";
        format = " spack [$symbol$environment]($style)";
      };
      SHLVL = {
        disabled = false;
      };
      container = {
        symbol = "󰡨";
      };
    };
  };
}
