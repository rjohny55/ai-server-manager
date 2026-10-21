# AI Film Creator

[Guide](README.md) · [Plugins](plugins.md) · [Русская версия](../ru/film-creator.md)

Create a short film by planning shots, assigning character references, generating
takes and assembling dialogue, music and effects. A coherent film needs explicit
continuity; the model does not automatically remember every earlier scene.

![Film Creator with story and character preparation](../assets/guide-film-en.png)

## 1. Start with a short project

Enable **AI Film Creator** in AI Store. It is included in Business and Enterprise
without an additional plugin charge, subject to build and permissions. Projects
can be up to **1,800 seconds**, but a 30-minute film is many sequential
generations, not one model request. First test 10–20 seconds.

Start a supported **MiniMax H3 or LTX-2.5** in **Launch**, wait for readiness and
select it in **Settings and models**. H3 photo conditioning requires Ref2VA.
An LLM is optional for scripts; a supported running TTS model is needed for
separate speech synthesis. Vision or Marlin/SkyVision analysis is optional for
automatic trailer selection, not manual editing.

## 2. Outline the story

Under **Materials and script**, choose duration, portrait 9:16 or landscape 16:9,
style and a short plot. Begin with one location and a small cast.

Example planning brief:

> Anna looks for a book in a library. The librarian points to the correct shelf,
> and Anna thanks him. Two characters, one location, calm camera. Use one action
> and one speaker per shot. Name the speaker for every line. Do not add a
> narrator or new characters. Write the short plot first, then timed shots.

**Fill project with AI** prepares a draft through contextual steps. Review,
apply and save it. For longer work, approve the plot and shot breakdown before
filling detailed prompts. Manual writing does not require an LLM.

## 3. Assign characters and references

Upload character/location images or import them from the reusable library.
Give characters useful names and consistent clothing descriptions. Assign photos
to characters, then check the actual reference for each scene.

Scene settings explicitly offer photo input, the previous shot's last frame,
or no reference. Inspect **Will be sent** before rendering. Merely uploading
a photo does not guarantee that a particular shot uses it. For a difficult
multi-character shot, prepare and test an appropriate combined reference.

## 4. Split action and dialogue into manageable shots

Use 5-, 10- or 15-second shots; 20 seconds and the full random selection require
LTX-2.5. Choose duration according to the action and speech, not only to reduce
the number of renders.

A long scene description should become several shots: searching the shelves,
looking up, the librarian answering, then Anna reacting. Assign each shot an
action, reference and short line. Use **Split dialogue into shots** or shorten
lines that cannot fit. Replanning can increase duration and requires checking
existing takes and audio inserts; they are not silently shifted into a new edit.

## 5. Set the speaker and audio mode

Assign each line to its speaking character. Native model audio does not guarantee
the intended voice or correct lip movements.

For more controllable speech, select the separate TTS mode, a ready supported
speech model and the character's voice. Use **Synthesize line** to listen before
video generation. In TTS mode, scene generation also prepares a missing speech
asset before rendering. Changed text deselects the old speech asset and needs
new synthesis. Make sure the complete line fits the shot.

TTS replaces that shot's audio; it does not provide automatic lip sync. Separate
shots for different speakers are easier to control than a long two-person
conversation in a single generation.

## 6. Generate in order and choose takes

Under **Scenes and timeline**, test one shot and inspect identity, lighting,
motion and the assigned line. Generate the remaining shots only when the test
works. Keep previous takes and explicitly choose the version used in the edit.

Last-frame continuation can help continuous action, but may carry artifacts
forward. Return to a clean reference for a new location or a failed frame.
Changing the selected previous take does not automatically regenerate later
footage.

Pause a good frame and save it with a name to the library. Select it explicitly
when reusing it as a reference; capture does not change current assignments.

## 7. Place music and sound effects

Upload permitted music, ambience, effects or recorded speech and place them on
the audio timeline. For each insert set its start in the film, offset within the
source, duration and volume. Up to 32 inserts are supported. Add another insert
to repeat music; automatic looping is not implied.

Listen for clipped speech and keep background music below dialogue. Save edits
before batch generation and export. Inspect the queue before retrying an action
with an unknown outcome. Canceling an active task may stop waiting while the
already accepted model render continues.

## 8. Export the film and a trailer

Once every shot has a selected take, assemble the film in **Export and results**.
Watch the complete file and download it. History retains previous exports with
persistent storage. Long projects need free disk space for intermediate files;
keep backups of important work.

For a trailer, manually select excerpts from finished takes, set source in-points
and durations, reorder them and add separate music, effects and narration.
Automatic selection can use three sampled frames with a Vision LLM, or temporal
Marlin/SkyVision analysis followed by LLM planning. These modes do not imply
analysis of every frame or the soundtrack. Review the suggested edit before
exporting it.

## Final quality checklist

- Characters, clothing and important objects stay consistent.
- Each shot has a clear action and intended speaker.
- Lines fit their shots and do not cut off.
- There are no black frames, obvious artifacts or accidental pauses.
- Music does not drown out dialogue; framing matches the destination.

New builds also offer **experimental LTX finishing** with a one-scene preview
before a separate full processed export. It needs additional native components
and a compatible GPU, may alter details and is not required for this workflow.
It is not a promise of compatibility with every card, particularly CMP 50HX.

Editing text does not change existing footage: regenerate affected shots and
export a new version. For other workflows, see [music clips](music-clip.md) and
[product advertisements](ad-creator.md).

These steps cover build 1.0.36 with the October 2026 updates. The screenshot
shows a demonstration interface, not a film rendered from this example.
