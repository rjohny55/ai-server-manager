# AI Ad Creator

[Guide](README.md) · [Plugins](plugins.md) · [Русская версия](../ru/ad-creator.md)

Build a product advertisement from a factual brief, approved images, short
scenes and selected takes. AI Ad Creator organizes the work in one project;
review the finished advertisement before publishing it.

![Ad Creator with a product brief and source images](../assets/guide-ad-en.png)

## 1. Prepare the models

Enable **AI Ad Creator** in AI Store. Business and Enterprise include it without
an additional plugin charge, subject to installed build and user permissions.

Start a supported **MiniMax H3 Ref2VA or LTX-2.5** in **Launch** for
photo-conditioned video. Wait for readiness and choose it in plugin settings.
Optionally select a running LLM for copy and a compatible Flux 2 Klein,
Flux 3 Klein or Ideogram 4 image model for asset preparation. Image editing
depends on the actual checkpoint, not only the model family name.

Existing photos and a manual script do not require an LLM or image model. Leave
enough GPU memory for video generation rather than keeping every model loaded.

## 2. Write a factual brief

Create a project under **Materials and script**. Enter the product name,
description, audience and call to action. Start with a short advertisement,
for example 15 seconds.

Example brief using a fictional product:

> A matte blue 450 ml travel mug for people taking a drink on a walk. Show its
> shape, lid and everyday use. Do not claim a temperature-retention time,
> leak resistance or other unverified benefits. End with: Choose your color
> in the catalog.

Use **Fill project with AI** for a step-by-step draft, or edit individual fields
manually or with AI assistance. Check and apply the draft, then save. Do not let
the model invent certifications, delivery terms or product specifications.

## 3. Add a person and the product

Upload clear, permitted photos in the person/product sections. Preserve the
product's real color, shape, packaging and distinguishing details. Use a
person's likeness only with appropriate permission.

The dice button beside each upload opens image generation. Choose a ready image
model, enter a prompt and adjust resolution, steps and available quality
settings. Regenerate, download or use the result. Give the character or product
a name when saving it to the reusable library.

Generated product artwork must not silently change what is being advertised.
Replace incorrect lids, labels or proportions with a verified source image.

## 4. Inspect the combined reference

Separate photos do not guarantee that a video model will combine them correctly.
Prepare and inspect a person-with-product reference. Check hands, object size,
position and packaging. Automatic preparation needs an image model that supports
editing.

Alternatively upload a finished combined frame and enable **Use uploaded combined
reference from settings**. This avoids relying on image editing when your
checkpoint does not support it.

## 5. Divide the advertisement into shots

Choose portrait **9:16 for Reels** or landscape **16:9 for YouTube** and a
supported resolution. Three 5-second shots make a useful first test. The editor
also supports 10/15-second scenes; 20 seconds and the full random selection need
LTX-2.5.

1. **Hook:** the person gets ready for a walk; the mug sits beside a bag.
2. **Demonstration:** a clear close-up of the mug held in one hand.
3. **Closing:** a calm product shot with a short call to action.

Enter a script and use **Split my script into scenes**, or prepare one with the
selected LLM. Save the project. Give each shot one main action, not a complete
unboxing, walk, comparison and long speech in five seconds.

Generated text and logos can be distorted. Inspect them; add precise final
titles in an appropriate editing tool when exact typography is required.

## 6. Test before queueing the full video

Under **Scenes and timeline**, generate one take and inspect the product, face,
hands, movement and color. Keep good takes and regenerate only failed shots.

Last-frame continuation can connect continuous action, but replaces the next
shot's normal reference and can propagate errors. Return to a verified product
reference for important packaging shots or a new scene.

Run remaining scenes or the full workflow after a successful test. Monitor the
queue rather than submitting repeated jobs. Editing a script does not
automatically regenerate completed takes.

## 7. Export and review

Assemble selected takes under **Export and results**, download the file and
watch it with audio. The plugin retains video-model sound; if it is absent,
the export may contain silence. A visible avatar does not imply automatic
narration or exact lip sync.

Check likeness permissions, actual product details, spoken claims, volume and
framing before publication. Existing exports remain available in project
history when storage is persistent.

If generation is disabled, check model readiness, required fields and unsaved
changes. An image model is needed for image creation, and a video model for
video creation; neither replaces the other. A product-only advertisement is
possible without inventing a person: use a suitable reference and workflow.

Next: [music videos](music-clip.md), [films](film-creator.md) and
[image and video generation](media.md).

These steps cover build 1.0.36 with the October 2026 updates. The screenshot
shows a demonstration interface, not completed generation from this example.
