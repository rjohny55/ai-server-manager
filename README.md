# AI Server Manager

[**Русская версия**](README.ru.md) · [**User documentation**](docs/en/README.md) · [Website](https://ai-server-manager.ru/)

**Run and manage AI on your own Linux server.** AI Server Manager brings model
downloads, GPU assignment, local inference, chat, media generation and automation
into one web interface.

This is the **public installation and user-documentation repository**, not the
application source repository. It contains no application source code, model
weights, license keys or service credentials. English is the primary language;
a separate [Russian guide](docs/ru/README.md) is available.

## What you can do

- **Find and launch models:** a categorized catalog, downloads, hardware-aware
  recommendations, saved launch settings and presets.
- **Run local LLMs:** vLLM and llama.cpp, with additional experimental integrations
  such as 1Cat-vLLM, Hipfire and Strata in compatible image variants.
- **Use NVIDIA or AMD GPUs:** automatic or manual GPU assignment, engine-specific
  multi-GPU placement and supported CPU/RAM offload modes.
- **Chat and work with an AI agent:** model conversations, supported tool calls,
  code previews and project workflows.
- **Generate images and video:** supported FLUX Klein, Ideogram, Wan, MiniMax H3
  and LTX pipelines, with resolution presets, progress and saved results.
- **Work with audio and 3D:** supported speech recognition, speech synthesis,
  document/OCR plugins and specialized 3D workflows.
- **Automate:** MCP, Telegram, scheduling, knowledge/RAG and other plugins.
- **Operate your server:** monitoring, user permissions, API keys and a separate
  updater with recovery access.

Features depend on the installed image, model format, hardware and license.
Experimental presets are not a promise of successful inference on every GPU.

## Interface preview

English-language panel screens with **mock data**. GPU load, memory, models and
server details are illustrative, not benchmark results. No production accounts,
credentials or server addresses are shown.

### Sign in

![AI Server Manager sign-in screen in English](docs/assets/login-en.png)

### Dashboard — blue theme

![English dashboard in the blue theme with demo resource charts and GPU monitoring](docs/assets/dashboard-blue-en.png)

### Dashboard — dark theme

![English dashboard in the dark theme with two CMP 170HX GPUs and a modified 20 GB CMP 50HX](docs/assets/dashboard-en.png)

## Plugin catalog

The catalog includes these **19 implemented plugins**. Availability and pricing
depend on your subscription, installed build and each plugin's requirements;
check AI Store in your panel for current access. Model weights are separate.

| Plugin | Purpose |
| --- | --- |
| **MCP Server** | Connect external AI agents to supported server and model-management tools |
| **Telegram Sentinel** | Remote server monitoring and control through a Telegram bot |
| **Realtime Voice Agent** | Interactive voice conversations with speech recognition and synthesis |
| **Cron Task Scheduler** | Scheduled tasks, model wake-ups, reports and maintenance |
| **SecOps Pentest Agent** | Defensive security assistant with persistent knowledge and controlled integrations |
| **Docker Manager** | Container status, logs, lifecycle actions and configuration |
| **Level 0 Support AI** | First-line support workflows and knowledge-assisted answers |
| **AI Chat Agent** | AI assistant with knowledge/RAG, web search and supported server tools |
| **Server Messenger** | Server messaging, rooms, group conversations and direct messages |
| **TG Commenter Pro** | AI-assisted Telegram commenting, accounts and schedules |
| **AiSharkOCR** | Document recognition and structured parsing in Lite, Vision and Hybrid modes |
| **Transcriber Agent** | Audio transcription, speaker diarization and LLM summaries |
| **Object Detector** | Object detection and segmentation for images and cameras; custom training |
| **LiveKit SIP** | SIP telephony and voice-agent call integration |
| **AI Pearl Mining** | Mining runtime management, statistics, console and supported NVIDIA GPU tuning |
| **AI Knowledge** | Shared knowledge bases, RAG, document versions and access permissions |
| **AI Music Clip Creator** | Music-driven storyboards, scene generation and music-video export |
| **AI Ad Creator** | Product/person references, advertising scripts and video export |
| **AI Film Creator** | Short-film projects, scenes, dialogue, music, effects and export |

**Planned / prototype catalog entries — not available as production plugins:**
Crypto/Stock Trader Analyst, Media Factory and DevOps Toolkit.

See the [plugin guide](docs/en/plugins.md) for setup and creative workflows.

## Creative plugins included in Business

These plugins are included in **Business and Enterprise without an additional
plugin charge**:

| Plugin | Purpose |
| --- | --- |
| **AI Music Clip Creator** | Music track → storyboard → H3/LTX scenes → exported music video |
| **AI Ad Creator** | Person/product photos and a script → advertising video, Reels or YouTube |
| **AI Film Creator** | Short-film projects up to 30 minutes, scene references, dialogue/TTS, music, sound effects and export |

They support saved projects, reusable character assets, queues and creative MCP
tools. Long films are assembled from short scenes, not generated in one request.
Actual quality, generation time and lip synchronization require verification.
See [Plugins](docs/en/plugins.md).

## Quick start

Use a Linux host with Docker/Compose and working GPU drivers where applicable.
Review the [installation guide](docs/en/installation.md) before proceeding.

Download the public entry point and read it before running:

```bash
curl -fL --proto '=https' --proto-redir '=https' \
  https://raw.githubusercontent.com/rjohny55/ai-server-manager/main/install.sh \
  -o install.sh
bash install.sh --help
bash install.sh auto --download-only
```

`--download-only` saves the current official installer as a new file for review.
It does **not** install anything. To install after review:

```bash
bash install.sh auto
```

You can select `nvidia`, `amd` or `cpu` instead of `auto`. Administrative
privileges may be required by the official installer. It creates the panel and
the separate updater and may install Docker. Do not run it blindly over an
existing production deployment.

The entry point retrieves the current installer from
`https://ai-server-manager.ru/api/install` using verified HTTPS. Review and run
the saved downloaded file if you need to execute exactly the version you inspected.
No license or account credentials are embedded in this repository.

## Documentation

- [Installation and first login](docs/en/installation.md)
- [Model catalog, downloads and launch](docs/en/models.md)
- [GPU assignment and memory](docs/en/gpu.md)
- [Chat, agent and application API](docs/en/chat-api.md)
- [Images, video, audio and 3D](docs/en/media.md)
- [Plugins and creative projects](docs/en/plugins.md)
- [Updates, licensing, backup and troubleshooting](docs/en/operations.md)
- [Security and support](docs/en/security.md)

## Links and licensing

[Project website](https://ai-server-manager.ru/) · [Online user guide](https://ai-server-manager.ru/docs) · [Neithos](https://neithos.ru/)

AI Server Manager is distributed under its product license. A public installer
and public documentation do **not** make the application open source. Third-party
engines and model weights have their own licenses; verify their terms before use.
See [NOTICE](NOTICE.md).

For support, open a GitHub issue with a sanitized description. **Never post
passwords, tokens, license strings, cookies, `.env` files or private documents.**
