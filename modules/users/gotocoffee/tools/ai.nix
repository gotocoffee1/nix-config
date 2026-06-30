{
  gtc.tools.homeManager.programs.aichat = {
    enable = true;
    settings = {
      model = "mistral:mistral-medium-latest";
      clients = [
        {
          type = "openai-compatible";
          name = "mistral";
          api_base = "https://api.mistral.ai/v1";
        }
      ];
    };
  };
}
