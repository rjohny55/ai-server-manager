# Images, video, audio and 3D

[Guide](README.md) · [Русская версия](../ru/media.md)

## Images

Select a supported image model and complete pipeline, apply its hardware preset,
launch it and wait for readiness. Then choose the running model in image
generation. Supported integrations include FLUX Klein and Ideogram workflows.

Set prompt, dimensions, steps and seed. Use compatible reference-image/editing
weights where needed. Prompt enhancement is optional and requires a selected
compatible language model; it is not required for ordinary image generation.

SDPA, FlashAttention, SageAttention and xFormers are alternatives subject to
hardware and pipeline support. Selecting all optimizations is not required.
Use a compatible SDPA preset as a diagnostic baseline.

## Video

Supported workflows include Wan, MiniMax H3 and LTX. Select a preset for the exact
checkpoint, hardware and input mode: text, image reference and audio reference
are not interchangeable. Keep reference components if you intend to use them.

Start with a short clip and modest resolution. Frame-count and dimension
constraints vary by pipeline. More frames, resolution and quality can greatly
increase memory use and render time. Multi-GPU and CPU offload work only in
supported configurations; a memory estimate is not a guarantee.

Some H3/LTX workflows generate video with audio. This is not a universal service
for adding sound to every existing video. Use [creative plugins](plugins.md) for
project-based scenes and sound editing.

## Audio and 3D

Speech recognition and synthesis require their own supported models. Language,
voice cloning, timestamps, diarization and streaming depend on the chosen engine.
Test a short file or phrase first. Obtain permission before using another person's
voice or image.

OCR plugins and specialized 3D integrations have separate models and jobs.
A video-generation model is not a 3D generator, and video analysis is not video
generation. Wait for an asynchronous job to finish before downloading its result.

## Results and history

Use persistent data storage for generation history and projects. Switching tabs
should not require deleting or re-downloading models. Inspect an existing job
before repeating a request with an unknown outcome. Export important images,
videos and project assets and include persistent data in backups.
