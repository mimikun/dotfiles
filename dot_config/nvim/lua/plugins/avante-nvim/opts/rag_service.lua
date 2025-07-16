-- RAG service configuration
---@type table
local rag_service = {
    enabled = false, -- Enables the RAG service
    host_mount = os.getenv("HOME"), -- Host mount path for the RAG service (Docker will mount this path)
    runner = "docker", -- The runner for the RAG service (can use docker or nix)
    llm = { -- Configuration for the Language Model (LLM) used by the RAG service
        provider = "openai", -- The LLM provider
        endpoint = "https://api.openai.com/v1", -- The LLM API endpoint
        api_key = "OPENAI_API_KEY", -- The environment variable name for the LLM API key
        model = "gpt-4o-mini", -- The LLM model name
        extra = nil, -- Extra configuration options for the LLM
    },
    embed = { -- Configuration for the Embedding model used by the RAG service
        provider = "openai", -- The embedding provider
        endpoint = "https://api.openai.com/v1", -- The embedding API endpoint
        api_key = "OPENAI_API_KEY", -- The environment variable name for the embedding API key
        model = "text-embedding-3-large", -- The embedding model name
        extra = nil, -- Extra configuration options for the embedding model
    },
    docker_extra_args = "", -- Extra arguments to pass to the docker command
}

return rag_service
