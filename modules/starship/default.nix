{lib, ...}: {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;

    settings = {
      add_newline = true;
      command_timeout = 2000;
      format = lib.concatStrings [
        "$os"
        "$shell"
        "$time"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_status"
        "($nix_shell$container$git_metrics)$cmd_duration\n"
        "$hostname"
        "$localip"
        "$shlvl"
        "$env_var"
        "$sudo"
        "$username"
        "$kubernetes"
        "$docker_context"
        "$package"
        "$c"
        "$cmake"
        "$dotnet"
        "$golang"
        "$lua"
        "$nodejs"
        "$python"
        "$rust"
        "$terraform"
        "$zig"
        "$aws"
        "$gcloud"
        "$status"
        "$character"
      ];
      kubernetes = {
        symbol = "";
        disabled = false;
      };

      palette = "cyberdream";

      hostname = {
        ssh_symbol = "";
      };

      character = {
        format = "$symbol ";
        success_symbol = "[  ](bold bg:#5EFF6C fg:#16181A)";
        error_symbol = "[  ](bold bg:#FF6E5E fg:#16181A)";
      };

      env_var.VIMSHELL = {
        format = "[$env_value]($style)";
        style = "#FF5EF1 italic";
      };

      sudo = {
        format = "[$symbol]($style)";
        style = "bold #FFBD5E";
        symbol = "󰡗";
        disabled = false;
      };
      username = {
        style_user = "#5EA1FF bold italic";
        style_root = "#BD5EFF bold italic";
        format = "[ $user ]($style) ";
        disabled = false;
        show_always = false;
      };
      directory = {
        home_symbol = "";
        truncation_length = 3;
        truncation_symbol = "../";
        read_only = " 󰌾";
        use_os_path_sep = true;
        style = "italic fg:#16181A bg:#FFFFFF";
        format = "[$path]($style)[$read_only]($read_only_style)";
        repo_root_style = "bold base0E";
        repo_root_format = "[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) [](bold bg:#FFFFFF fg:#16181A)";
      };
      cmd_duration = {
        format = "[◄ $duration](italic fg:#16181A bg:#FFFFFF)";
        show_notifications = true;
      };

      localip = {
        ssh_only = true;
        format = " 󰩟[$localipv4](bold bg:#F1FF5A fg:#16181A) ";
        disabled = false;
      };
      time = {
        disabled = false;
        use_12hr = true;
        format = "[$time]($style) ";
        time_format = "%r";
        utc_time_offset = "local";
        style = "italic bg:#FFBD5E fg:#16181A";
      };
      os = {
        disabled = false;
        format = "[](bold fg:#BD5EFF bg:none)[$symbol]($style)";
        style = "bold bg:#BD5EFF fg:#FFFFFF";
      };
      git_branch = {
        format = "[$branch(:$remote_branch)]($style)";
        symbol = "[](bold italic base0E)";
        style = "italic base0F";
        truncation_symbol = "⋯";
        truncation_length = 11;
        ignore_branches = [];
        only_attached = true;
      };
      git_metrics = {
        format = " ( [$added]($added_style)) ([$deleted]($deleted_style)) ";
        added_style = "italic #5EFF6C";
        deleted_style = "italic #FF6E5E";
        ignore_submodules = true;
        disabled = false;
      };
      git_status = {
        style = "bold italic base0E";
        format = "([⎪$ahead_behind$staged$modified$untracked$renamed$deleted$conflicted$stashed⎥]($style))";
        conflicted = "[](italic bright-magenta)";
        ahead = "[│[$count](bold #FFFFFF)│](italic #5EFF6C)";
        behind = "[│[\${count}](bold #FFFFFF)│](italic #FF6E5E)";
        diverged = "[[\${ahead_count}](regular #FFFFFF)│┤[\${behind_count}](regular #FFFFFF)│](italic bright-magenta)";
        untracked = "[](italic bright-yellow)";
        stashed = "[◃󰊱](italic #FFFFFF)";
        modified = "[◦](italic #F1FF5E)";
        staged = "[┤[$count](bold #FFFFFF)│](italic bright-cyan)";
        renamed = "[󰚚◦](italic bright-blue)";
        deleted = "[󰗨](italic #FF6E5E)";
      };

      lua = {
        format = "[lua](italic) [\${symbol}\${version}]($style)";
        version_format = "\${raw}";
        symbol = "⨀";
        style = "bold bg:#BD5EFF fg:#FFFFFF";
      };

      nodejs = {
        format = "[node: ($version) ](bold bg:#BD5EFF fg:#FFFFFF)";
        version_format = "\${raw}";
        detect_files = ["package-lock.json" "yarn.lock"];
        detect_folders = ["node_modules"];
        detect_extensions = [];
      };

      rust = {
        format = "[rs](italic) [$symbol$version]($style)";
        symbol = "⊃";
        version_format = "\${raw}";
        style = "bold bg:#BD5EFF fg:#FFFFFF";
      };

      package = {
        format = "[pkg](italic dimmed) [$symbol$version]($style)";
        version_format = "\${raw}";
        symbol = "◨ ";
        style = "dimmed bg:#BD5EFF fg:#FFFFFF italic bold";
      };

      aws = {
        disabled = false;
        format = "[aws](italic) [ $symbol $profile $region ]($style)";
        style = "bold bg:#BD5EFF fg:#FFFFFF";
        symbol = "";
      };

      c = {
        symbol = " ";
        format = " [$symbol($version(-$name))]($style)";
        style = "bold bg:#BD5EFF fg:#FFFFFF";
      };

      docker_context = {
        symbol = "◧ ";
        format = " docker [$symbol$context]($style)";
        style = "bold bg:#BD5EFF fg:#FFFFFF";
      };

      golang = {
        symbol = "∩ ";
        format = " go [$symbol($version )]($style)";
        style = "bold bg:#BD5EFF fg:#FFFFFF";
      };

      memory_usage = {
        symbol = " ";
        format = "Ram[\${ram_pct}( \${swap_pct})]($style)";
        style = "bold bg:#BD5EFF fg:#FFFFFF";
        disabled = false;
      };

      palettes.cyberdream = {
        base00 = "#16181A";
        base01 = "#1E2124";
        base02 = "#3C4048";
        base03 = "#7B8496";
        base04 = "#7B8496";
        base05 = "#FFFFFF";
        base06 = "#16181A";
        base07 = "#FFFFFF";
        base08 = "#FF6E5E";
        base09 = "#FFBD5E";
        base0A = "#F1FF5E";
        base0B = "#5EFF6C";
        base0C = "#5EF1FF";
        base0D = "#5EA1FF";
        base0E = "#BD5EFF";
        base0F = "#FF5EF1";
      };
      nix_shell = {
        style = "bold bg:#FF5EF1 fg:#FFFFFF";
        symbol = "󱄅";
        format = "[$symbol nix⎪$state⎪]($style) [$name](italic dimmed #FFFFFF)";
        impure_msg = "[󱕼](bold dimmed #FF6E5E)";
        pure_msg = "[󰿞](bold dimmed #5EFF6C)";
        unknown_msg = "[](bold dimmed #F1FF5E)";
      };

      shell = {
        bash_indicator = "  ";
        fish_indicator = " 󰈺 ";
        disabled = false;
        style = "bold bg:#BD5EFF";
      };

      container = {
        symbol = "󰡨 ";
        style = "bold #BD5EFF";
      };
    };
  };
}
