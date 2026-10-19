# GPU assignment and memory

[Guide](README.md) · [Русская версия](../ru/gpu.md)

GPU **selection** and model **distribution** are separate. Selection identifies
the cards to use; the engine determines how work and weights can be divided.
Two GPUs do not behave like one larger GPU for every model.

## Automatic and manual modes

Automatic mode chooses cards at launch using managed model assignments and
reservations. A model that is still loading can already reserve a card. Available
memory is also checked; a process outside the panel may consume VRAM.

Manual mode lets you select specific cards. Check the saved assignments and
launch console if a model appears on a different card. Logical runtime GPU 0
can represent a different physical GPU after visibility filtering.

- llama.cpp tensor-split proportions apply to the selected cards. Relative
  values such as `30,70` are not vLLM tensor-parallel settings.
- vLLM parallelism must match a topology and model supported by that runtime.
- Hipfire and media engines have their own supported placement strategies.
- AMD Vulkan and ROCm are separate execution paths, not interchangeable flags.

## Memory and offload

Weights, KV cache, temporary activations, encoders and decoding can all consume
memory. The total VRAM across cards is not a guarantee that an indivisible
component fits. CPU/RAM offload moves storage or computation according to the
pipeline; it does not eliminate GPU memory requirements.

Start with a small context or short low-resolution generation. Test each model
individually before running multiple workloads on the same cards. A low compute
graph during file loading or text encoding is not proof of a stalled engine.

Choose a precision supported by the hardware and checkpoint. Turing/CMP50 and
MI50/gfx906 generally need FP16-compatible routes rather than BF16 settings.
Changing a compute setting does not convert a BF16 GGUF file into F16 weights.
