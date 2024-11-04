{ ... }:
{

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<esc>";
      action = "<cmd>nohc<CR>";
    }

  ];
}
