{lib, ...}: {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;

    settings = {
      add_newline = true;
      command_timeout = 1000;
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
        format = "[ $user]($style) ";
        disabled = false;
        show_always = false;
      };
      directory = {
        home_symbol = "";
        truncation_length = 3;
        truncation_symbol = "../";
        read_only = "󰌾";
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
      localip = {
        ssh_only = true;
        format = "󰩟[$localipv4](bold bg:#F1FF5A fg:#16181A)";
        disabled = false;
      };
      time = {
        disabled = false;
        use_12hr = true;
        format = "[$time]($style)";
        time_format = "%r";
        utc_time_offset = "local";
        style = "italic bg:#FFBD5E fg:#16181A";
      };
      os = {
        disabled = false;
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
        format = " ([$added]($added_style))([$deleted]($deleted_style)) ";
        added_style = "italic dimmed green";
        deleted_style = "italic dimmed red";
        ignore_submodules = true;
        disabled = false;
      };
      git_status = {
        style = "bold italic base0E";
        format = "([⎪$ahead_behind$staged$modified$untracked$renamed$deleted$conflicted$stashed⎥]($style))";
        conflicted = "[](italic bright-magenta)";
        ahead = "[│[$count](bold white)│](italic green)";
        behind = "[│[\${count}](bold white)│](italic red)";
        diverged = "[[\${ahead_count}](regular white)│┤[\${behind_count}](regular white)│](italic bright-magenta)";
        untracked = "[](italic bright-yellow)";
        stashed = "[◃󰊱](italic white)";
        modified = "[◦](italic yellow)";
        staged = "[┤[$count](bold white)│](italic bright-cyan)";
        renamed = "[󰚚◦](italic bright-blue)";
        deleted = "[󰗨](italic red)";
      };

      lua = {
        format = "[lua](italic) [\${symbol}\${version}]($style)";
        version_format = "\${raw}";
        symbol = "⨀";
        style = "bold base0E";
      };

      nodejs = {
        format = "[node: ($version)](bold base0E)";
        version_format = "\${raw}";
        detect_files = ["package-lock.json" "yarn.lock"];
        detect_folders = ["node_modules"];
        detect_extensions = [];
      };

      rust = {
        format = "[rs](italic) [$symbol$version]($style)";
        symbol = "⊃";
        version_format = "\${raw}";
        style = "bold base0E";
      };

      package = {
        format = "[pkg](italic dimmed) [$symbol$version]($style)";
        version_format = "\${raw}";
        symbol = "◨";
        style = "dimmed base0E italic bold";
      };

      aws = {
        disabled = true;
        format = "[aws](italic) [$symbol $profile $region]($style)";
        style = "bold base0E";
        symbol = "";
      };

      c = {
        symbol = " ";
        format = " [$symbol($version(-$name))]($style)";
        style = "bold base0E";
      };

      docker_context = {
        symbol = "◧ ";
        format = " docker [$symbol$context]($style)";
        style = "bold base0E";
      };

      golang = {
        symbol = "∩ ";
        format = " go [$symbol($version )]($style)";
        style = "bold base0E";
      };

      memory_usage = {
        symbol = "";
        format = "Ram[\${ram_pct}( \${swap_pct})]($style)";
        style = "bold base0E";
        disabled = false;
      };

      nix_shell = {
        style = "bold base0E";
        symbol = "󱄅";
        format = "[$symbol nix⎪$state⎪]($style) [$name](italic dimmed white)";
        impure_msg = "[󱕼](bold dimmed red)";
        pure_msg = "[󰿞](bold dimmed green)";
        unknown_msg = "[](bold dimmed yellow)";
      };

      shell = {
        bash_indicator = "";
        fish_indicator = "󰈺";
        disabled = false;
        style = "bold bg:base0E";
      };

      container = {
        symbol = "󰡨";
        style = "bold base0E";
      };
    };
  };
}
