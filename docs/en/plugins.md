# Plugins and creative projects

[Guide](README.md) · [Русская версия](../ru/plugins.md)

Enable supported plugins in AI Store and grant appropriate user permissions.
Free/included plugins require the applicable subscription; **Business and
Enterprise include Music Clip Creator, Ad Creator and Film Creator without an
additional plugin charge**. Other plugins can have different pricing.

Availability depends on the installed image build. Model weights are downloaded
separately. Start the required video, image, language or speech models in the
model-launch section before selecting them inside a plugin.

## AI Music Clip Creator

Upload a track, choose H3/LTX and optionally an LLM/ASR model. Review transcript
and storyboard, use 5-second, 10-second or mixed scene lengths, and generate
shots. Select takes and export. The final soundtrack is the original music.

## AI Ad Creator

Provide a person/avatar photo, product photo and script or LLM brief. Supported
image models can prepare assets or a combined reference frame. Inspect it before
video generation; product text, packaging and identity are not guaranteed.
Choose Reels or YouTube format and export a finished advertising video.

## AI Film Creator

Create a project up to 1,800 seconds, choose format/style and enter the story and
characters. Split the script into short scenes, assign reference photos per
scene and edit shot prompts. H3 photo-conditioned shots require Ref2VA.

For dialogue, select a running TTS model and voice and synthesize a line for the
chosen scene. The line must fit the scene. Changing its text deselects the old
speech asset without deleting it. TTS replaces that scene's audio; exact lip
synchronization is not guaranteed, and the full pipeline does not synthesize
dialogue automatically.

Upload music, effects or recorded speech and place up to 32 audio inserts using
start time, source offset, duration and volume. There is no automatic looping.
Films are assembled from many short generations, not one 30-minute request.
Test a 10–20 second project before a long render.

## Projects, queues and automation

Projects retain scenes, takes, source assets and exports in persistent storage.
The shared character library copies assets into new projects so previous work
is unchanged. Use only assets you have permission to use.

Each creative plugin has one active job and a bounded queue. Inspect unknown
outcomes before retrying. Canceling an active job may stop waiting while an
already accepted model generation continues. After restart, interrupted work is
not silently replayed; queued work can continue.

Creative MCP tools support projects, settings, uploads, queues, cancellation and
exports. Automation uses a separate MCP workspace; it does not grant access to
another user's private projects. Keep MCP credentials in headers, never URLs.
