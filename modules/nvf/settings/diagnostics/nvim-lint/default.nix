{pkgs, ...}: {
  programs.nvf.settings.vim.diagnostics.nvim-lint = {
    enable = true;
    lint_after_save = true;

    linters_by_ft = {
      javascript = ["eslint_d" "biomejs" "cspell" "codespell"];
      typescript = ["eslint_d" "cspell" "codespell"];
      markdown = ["vale" "cspell" "codespell" "typos"];
      python = ["bandit" "vulture" "ruff" "cspell" "codespell"];
      nix = ["deadnix" "statix" "cspell" "codespell"];
      bash = ["shellcheck" "cspell" "codespell"];
      css = ["stylelint" "cspell" "codespell"];
      scss = ["stylelint" "cspell" "codespell"];
      html = ["htmlhint" "cspell" "codespell"];
      yaml = ["yq" "actionlint" "cspell" "codespell"];
      terraform = ["tflint" "tfsec" "cspell" "codespell"];
      hcl = ["tflint" "cspell" "codespell"];
      gitcommit = ["commitlint" "cspell" "codespell"];
      text = ["typos"];
      sql = ["sqlfluff"];
    };

    linters = {
      tflint.required_files = [".tflint.hcl"];
      tfsec.required_files = ["main.tf"];
      actionlint.required_files = [".github/workflows/"];
      statix.required_files = ["flake.nix"];
      deadnix.required_files = ["flake.nix"];

      commitlint = {
        required_files = ["commitlint.config.js"];
        stdin = true;
        stream = "stdout";
        args = ["--stdin"];
        cmd = "commitlint";
      };
      gitlint = {
        stdin = true;
        stream = "stdout";
        cmd = "gitlint";
      };

      codespell = {
        cmd = "codespell";
        args = ["-"];
        stdin = true;
        stream = "stdout";
      };

      cspell = {
        cmd = "cspell";
        args = ["lint" "--no-color" "--stdin" "--language-id" "en-AU"];
        stdin = true;
        stream = "stdout";
        required_files = ["cspell.json"];
      };

      typos = {
        cmd = "typos";
        args = ["-"];
        stdin = true;
        stream = "stdout";
      };

      stylelint.required_files = [".stylelintrc" "stylelint.config.js"];
      htmlhint.required_files = [".htmlhintrc"];
      vale.required_files = [".vale.ini"];
      ruff.required_files = ["pyproject.toml"];
    };
  };

  home.packages = with pkgs; [
    nodePackages.eslint_d
    commitlint
    nodePackages.cspell
    nodePackages.htmlhint
    stylelint

    tflint
    tfsec
    deadnix
    statix
    actionlint

    bandit
    python313Packages.vulture
    ruff
    sqlfluff

    vale
    woke
    typos
    yq
    shellcheck
    codespell
  ];
}
