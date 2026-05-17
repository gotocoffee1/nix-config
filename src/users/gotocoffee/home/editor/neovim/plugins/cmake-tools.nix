{ pkgs, ... }:
{
  plugins.cmake-tools = {
    enable = true;
    settings = {
      cmake_dap_configuration = {
        name = "cpp";
        type = "lldb";
        request = "launch";
        stopOnEntry = false;
        runInTerminal = true;
        console = "integratedTerminal";
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<F7>";
      action.__raw = ''

        function()
          require("cmake-tools").build({})
        end
      '';
      options = {
        desc = "CMake: Build";
      };
    }
  ];
}
