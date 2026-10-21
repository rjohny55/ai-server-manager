# AI Music Clip Creator

[Guide](README.md) · [Plugins](plugins.md) · [Русская версия](../ru/music-clip.md)

Create a music video by uploading a track, planning short shots, generating takes
and assembling the selected videos with the original music. The plugin manages
the project; a separately running video model generates the footage.

![Music project with a scene timeline and reference library](../assets/guide-music-en.png)

## 1. Prepare your models

Enable **AI Music Clip Creator** in AI Store. Business and Enterprise include
the plugin without an additional plugin charge. Availability also depends on
your installed build and user permissions.

In **Launch**, start a supported **MiniMax H3 or LTX-2.5** and wait until it is
ready. Selecting a model inside the plugin does not start it. Photo-conditioned
H3 generation requires **Ref2VA**.

Optional models serve separate purposes:

- A language model helps write the storyboard. Manual scripts do not require it.
- Whisper or another supported timestamped ASR helps transcribe lyrics.
- An image model can create a character reference; uploading your own photo is
  an alternative.

Use a launch preset compatible with your GPU. Avoid filling video memory with
auxiliary models before rendering. Our CMP 50HX examples use modified **20 GB**
cards; this is not a promise that every video profile fits without RAM offload.

## 2. Upload music and set the format

Create a project under **Materials and script** and upload a track you are
permitted to use. Listen for unwanted silence at its beginning or end. Start
with a short excerpt before processing a complete song.

In **Settings and models**, choose the ready video model and optional LLM/ASR.
Select portrait **9:16 for Reels** or landscape **16:9 for YouTube**, then choose
a supported resolution and save. Settings screenshots are available in the
[plugin overview](plugins.md#ai-music-clip-creator).

Begin with 5-second scenes. Options also include 10 and 15 seconds; **20 seconds
and the full random 5/10/15/20 selection require LTX-2.5**. Longer scenes need
more memory and time. Once takes exist, create a new project for a different
segmentation instead of expecting existing footage to change.

## 3. Fix the character and visual style

Describe consistent clothing, appearance, lighting, locations and camera style.
Upload a character image or use the dice button beside the photo upload field.
Image generation requires a selected ready image model. Inspect the result
before applying it, and save useful assets to the named library for reuse.

A character name alone does not preserve identity across generations. Use a
consistent reference and descriptions, and check every take.

## 4. Prepare lyrics and a storyboard

Under **Lyrics and synchronization**, transcribe the song or enter lyrics and
timings manually. Correct recognition mistakes before using the text to plan
scenes. Lyric timing and approximate beat alignment do not guarantee lip sync.

**Fill project with AI** prepares text through sequential requests that take
existing project context into account. Review and apply the draft, then save.
It does not automatically choose models, assign photos or verify facts.

Example storyboard brief:

> Make a 20-second music video with four 5-second shots. One woman in a red coat
> walks through an evening city. Keep warm shop-window lighting, wet-pavement
> reflections and calm cinematic camera movement. One action per shot, no new
> characters or written text. End with her stopping beside a lit window.

This is a planning example, not a generated benchmark. Edit each scene prompt
before rendering if it asks for more action than its duration allows.

## 5. Generate and choose takes

Open **Scenes and timeline**, render one test shot and inspect identity,
movement and style. Generate the remaining scenes only after that test works.
Previous takes remain available; select the best take for each scene.

**Continue from the last frame of the previous scene** is off by default. When
enabled, from scene two onward it replaces the normal photo reference with the
last frame of the selected previous take. Generate in order. A bad frame can
carry artifacts forward; use a clean original reference when changing location
or recovering from an error. Changing a previous take does not regenerate later
scenes automatically.

Pause a good moment and choose **Save still frame**. Name the reference, save it
to the library or download the PNG, then explicitly select it where needed.
Saving a frame does not silently change project references.

## 6. Export with music

Once every scene has a selected take, open **Export and results** and assemble
the clip with music. The original track becomes the final soundtrack. Review
transitions and the start/end of the song, then download the result.

Saved exports remain in project history with persistent storage. Editing prompts
does not modify existing video: regenerate affected scenes and export again.
If a request outcome is unknown, inspect the queue, project and model console
before retrying. Canceling a job may stop waiting while an accepted render
continues in the engine.

H3 audio reference guidance needs a suitable Ref2VA model and character image;
it does not guarantee accurate singing or lip synchronization.

Next: [product advertising](ad-creator.md), [film creation](film-creator.md) and
[model launch basics](models.md).

These steps cover build 1.0.36 with the October 2026 updates. Controls can differ
in earlier installed images. The screenshot shows a demonstration interface,
not the generated result of the example above.
