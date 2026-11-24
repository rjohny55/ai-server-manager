# AI Server Manager 1.0.39 — capabilities

[User guide](README.md) · [Русская версия](../ru/features.md)

Updated 24 November 2026. Features depend on the image variant, GPU architecture,
engine, model format, subscription and user permissions. Catalog entries and
presets describe available integrations; they do not certify every hardware or
model combination. Experimental routes are identified below.

## 1. Catalog and downloads

Browse LLM, image, video, audio and 3D categories, search Hugging Face and
ModelScope, inspect repository information, choose files and quantizations, and
use hardware recommendations. Cards identify the engine, package and local path.
Downloads support resuming, speed, cancellation, file verification and metadata
refresh. Verification progress stays within the downloaded portion of the bar.
Composite pipelines need the selected transformer, encoders, VAE, configuration
and shards; drafters and adapters can require separate downloads. Gated models
require the owner's acceptance and a suitable Hugging Face read token.

For LTX-2.5, the SDNQ generation package and native BF16 components are tracked
separately. Missing optional native files do not make a complete SDNQ package
unlaunchable. Download size, preparation disk space, system RAM and inference
VRAM are different requirements.

## 2. Six LLM engines

| Engine | Formats and operation | Compatibility limits |
| --- | --- | --- |
| vLLM | Supported text/multimodal checkpoints, streaming, batching, parallel requests, prefix caching; supported multi-GPU, CUDA Graphs, MTP and DFlash recipes | NVIDIA and AMD need their respective image/driver stacks; optimizations depend on model and build |
| llama.cpp | Compatible GGUF, CPU/GPU or hybrid offload, supported vision projectors, context and KV-cache controls | Backend, Flash Attention and drafter support depend on the build and model |
| QEngine | Separately downloaded engine; NVIDIA SM75/SM80/SM86 profiles, compatible Qwen3.8-27B, Pi INT8 and Flash-Next packages | Engine, weights, drafters and adapters are separate; MTP/DFlash2 and vision require matching support |
| Hipfire | Native AMD HIP packages, including supported MQ3 variants and MI50/gfx906 profiles | Generic GGUF or safetensors cannot be renamed into a compatible package |
| Strata | Compatible split GGUF, expert caching in GPU/RAM, supported layer placement and prepared MTP drafters | Experimental hardware routes; MI50 has a separate source-build path, not a universal CUDA binary |
| Avalon | Compatible Flash-Next GGUF package, expert ranking/caching, GPU/RAM placement and MTP recipes | Catalog profiles still require inference and memory validation on the target host |

1Cat is no longer offered as a current engine. A panel upgrade is separate from
an engine update or model download.

## 3. Launch controls and acceleration

Save account-specific presets and select context, precision, KV-cache, GPU
placement, offload and supported extra flags. Prefix caching, CUDA Graphs,
attention backends, MTP and DFlash require compatible weights and runtimes.
Reasoning controls only work when the selected model/template supports them.
Longer contexts consume more memory; a requested window can be reduced at launch.
Quantized KV cache must be checked for both quality and speed on the workload.
No universal throughput or context guarantee is implied by a preset.

## 4. Chat and multimodal input

Use ordinary chat or agent mode, select a running model, attach supported files,
stream responses and inspect available usage and speed metrics. Conversations
can use another compatible model; a stale runtime selection should not bind a
chat permanently. Conversation lists and selected histories load separately.
Images require vision support, and speech input requires a running ASR service.
The model's reasoning stream and its user-facing progress messages are distinct.

## 5. Coding agent and tools

The agent works within its authorized workspace using file tools, editing and
patching, Linux commands, rg searches and configured test tools. It can plan
substantial tasks, accept user clarifications, delegate bounded subagent roles,
stop or continue work and recover saved plans/history. Revision and exact-match
checks protect edits; repetition and lack of progress are tracked separately.
Reports distinguish completion, errors, interruption and unavailable tests.
Success depends on the model's tool-calling ability and the execution environment.

## 6. Code Preview and browser checks

Browse code and document tabs, edit and save files, refresh the preview and
manually send selected HTML element details to the agent. Authorized browser
checks use isolated Chromium to inspect screenshots, JavaScript/WebGL errors and
bounded UI actions. Images are sent to the LLM only with vision permission.
This does not grant arbitrary desktop or local-network access. A rendered
screenshot, syntax validation and functional tests are different evidence.

## 7. Documents and PDF

Read and search PDF, DOCX, XLSX and PPTX, including multiple search queries per
call. Use OCR for supported scans without a text layer. Create DOCX and PDF,
including multi-page PDF assembly from supported documents. DOCX editing checks
revisions; XLSX/PPTX are read-only in this document workflow. PDF revisions create
a new output rather than editing arbitrary original layouts. Preview, upload,
rename, save and download documents. Complex layouts or macros are not guaranteed.

## 8. AI Knowledge, OCR and retrieval

AI Knowledge provides a shared knowledge base with separate agent keys and
search/read/create/update permissions. Chat access is explicitly enabled.
AiSharkOCR extracts text and structured data from supported sources. Retained
images from new OCR imports can be inspected through an authorized vision model;
previously deleted source images need reimporting. Compatible embedding and
reranking operations support retrieval applications, but connecting a particular
RAG store and assigning its permissions remain separate configuration steps.

## 9. Images

SDNQ / SD.Next runs compatible FLUX, Qwen Image, Ideogram and other catalog
pipelines. Choose resolution, steps, seed and supported attention options.
Editing, masks and reference-image counts depend on the exact model. Optional
prompt enhancement uses a selected running LLM. A preset cannot add unsupported
conditioning capabilities to a different model family.

## 10. Video and generated sound

Supported families include Wan 2.2, MiniMax H3, LTX-2.3 and LTX-2.5. Configure
resolution, frames, steps, seed, placement and supported offload. Text, image,
audio and multiple-reference modes are checkpoint-specific. SDNQ packages,
native inference components and native DEV training components are distinct.
The separate native H3 Turbo route is experimental. Generated sound and lip
synchronization need model-specific testing; they are not guaranteed for every
video or supplied recording.

## 11. Ad, Film and Music Clip Creator

Ad Creator offers Lite and Pro, reusable projects, references and scene takes.
Scene descriptions and exact spoken lines are separate. Use supported TTS,
uploaded/recorded speech or compatible identity/reference adapters. Scene length,
speech rate, pauses, clothing continuity and previous-frame settings depend on
the active workflow. Identity, packaging text and seamless joins require review.

Film Creator organizes characters, scenes, dialogue, music/effects and export.
Music Clip Creator can start with a photo and an audio track; an existing video
clip is not required for that workflow. Projects assemble short generations,
retain selected takes and export the result. Plugins discover available engines
and retain user model choices. Adapter compatibility is checked separately; an
ID-LoRA and an Ingredients adapter are not interchangeable.

## 12. Speech recognition and Transcriber Agent

Use compatible Whisper.cpp, FunASR or ONNX ASR packages for file transcription
and supported voice input. Languages, timestamps, diarization and streaming
vary by model. Transcriber Agent accepts supported audio/video or public media
links, obtains an ASR transcript and can ask an LLM for structured summaries,
key points, decisions, tasks, risks and questions. Speaker labels/timestamps
require ASR support. Jobs expose progress and remain scoped to their owner.

## 13. Speech synthesis

Supported integrations include CosyVoice, Pocket TTS, Qwen3-TTS and OmniVoice.
Voice choice, reference audio, language, streaming and adapter support vary by
engine. Compatible TTS adapters have their own requirements. A visual character
LoRA does not automatically train or clone a TTS voice.

## 14. Voice Agent V1, V2 and experimental V3

V1 preserves the original conversation path. V2 has an optional SmartTurn
switch. V3 is an experimental native Go pipeline with server-side ONNX VAD,
SmartTurn end-of-turn handling, parallel ASR/turn evaluation and streamed speech
output. Test audio-only and audio-plus-camera separately. Interruptions cancel
obsolete output, but actual latency and recognition quality must be measured on
the target device. Post-fault ASR corruption reported in phone sessions has not
been established as universally resolved; no blanket reliability claim is made.

## 15. Camera, personality and avatar

Camera object labels are separate from actual frame inspection. With permission
and a compatible vision LLM, the agent can request an image when labels are
insufficient. Scene changes are coalesced instead of repeatedly sending unchanged
objects. A camera timeout is an upper bound, not a required wait before answering.
Optional personality, role, adaptation, initiative and own-goal controls support
experiments with conversational behavior. Adaptation summaries are distinct from
conversation history. These are software behavior settings, not evidence of
consciousness. The particle avatar's mouth follows audio level, not phoneme-level
lip synchronization.

## 16. Object Detector and SkyVision

Object Detector has its own runtime and start/stop/readiness lifecycle, camera
input and supported detection settings. It can supply events to Voice Agent.
SkyVision/Marlin analyzes compatible video inputs and returns textual descriptions
with timing; it does not analyze the audio track. Listing other model weights
in the catalog does not establish that every combination is ready for inference.

## 17. 3D

Compatible TRELLIS.2 workflows generate and preview 3D assets with GLB export.
Review geometry and materials before downstream use. MiraScene and additional
AMD routes are experimental and need their own runtime/model validation.

## 18. GPUs and multiple servers

Select automatic placement or explicit GPU UUIDs and engine-supported multi-GPU
settings. Check drivers, architecture, VRAM and RAM. Worker nodes and P2P links
support monitoring and compatible distributed recipes; they do not turn all
networked GPU memory into an automatic shared pool. CPU offload and expert
caching follow each engine's supported placement scheme.

## 19. Monitoring and operation

Inspect resource charts, GPU memory/utilization, process state, model consoles,
logs, worker connectivity and available speed/usage metrics. Distinguish process
start, warm-up and readiness before sending traffic. Persistent storage and
backups remain necessary for generated files, projects and user data.

## 20. Application API and MCP

Use scoped API keys and model discovery for supported OpenAI-compatible chat,
embeddings, ASR, TTS, image and video endpoints. OCR, 3D and specialized plugins
have their own request/job contracts. Streaming and metrics vary by engine.
MCP exposes authorized management and creative tools; it is not unrestricted
host access. Inspect accepted job status instead of duplicating requests.

## 21. Plugins and automation

The catalog includes MCP Server, Telegram Sentinel, Voice Agent, Cron Scheduler,
Server Messenger, TG Commenter Pro, Docker Manager, AiSharkOCR, Transcriber Agent,
Object Detector, AI Chat Agent, Level 0 Support AI, SecOps Pentest Agent,
AI Pearl Mining, LiveKit SIP, AI Knowledge, Music Clip Creator, Ad Creator,
Film Creator, AI LoRA Trainer and NeithOS GPU Lab. Access depends on the plan,
build and permissions. Trader Analyst, Media Factory and DevOps Toolkit are
prototype entries, not advertised production backends.

## 22. LiveKit and SIP

Connect supported SIP/LiveKit call workflows to the voice pipeline with suitable
telephony credentials, network configuration, ASR, LLM and TTS. A local browser
microphone session does not itself provision a telephone service.

## 23. AI LoRA Trainer

Train compatible LTX-2.5 adapters using the official trainer and required native
DEV transformer, matching text encoder and video/audio VAE. SDNQ inference
weights are not substitutes for these training components. Import prepared
photo/video datasets or prepare photo sets of up to 2,000 examples through a
compatible running image model, with a confirmed reference, captions and
replacement/regeneration of unsuitable examples. Photo identity and video motion
are different training signals. Compatible trained adapters can be selected in
creative workflows; visual training does not imply a cloned speaking voice.

## 24. NeithOS GPU Lab

A separately authorized Hub connection supports controlled remote diagnostics
and experiments. The owner grants access, and a valid license is required.
GPU/container/code access is bounded by those permissions; it does not imply
SSH or unrestricted host control. Diagnostic exchange uses authenticated,
validated request formats. Experiments do not prove production readiness.

## 25. Updates, access and plans

A separate updater compares installed/published builds and handles supported
updates and recovery. Keep persistent data backed up. Use account roles, API
scopes and plugin permissions. Browser camera/microphone capture requires HTTPS
or another browser-approved secure context. Model licenses are separate from
the application plan. Start includes its supported LLM, Whisper/Silero and
SDNQ/PyTorch image/video scope; advanced audio, 3D and plugins require the
applicable plan. Consult the current panel/store for access rather than assuming
all catalog entries are included.

## Further reading

[Installation](installation.md) · [Models](models.md) · [Chat and API](chat-api.md) ·
[Plugins](plugins.md) · [Current website capabilities](https://ai-server-manager.ru/features)
