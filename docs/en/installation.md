# Installation and first login

[Guide](README.md) · [Русская версия](../ru/installation.md)

## Prepare a host

Use a Linux machine with sufficient disk space and RAM, working Docker/Compose
and the appropriate GPU drivers. NVIDIA containers require a configured NVIDIA
Container Toolkit; AMD requires the appropriate GPU device access. A container
image does not repair host drivers or apply hardware unlocks.

Allow space for the application image, selected checkpoints, download/extraction
temporary files and generation results. Checkpoint size is not peak VRAM use.
CPU offload requires free system RAM and still needs VRAM for computation.

## Choose an installer

The repository's [install.sh](../../install.sh) retrieves the current official
installer over HTTPS. It supports `auto`, `nvidia`, `amd` and `cpu`.

```bash
bash install.sh --help
bash install.sh nvidia --download-only
```

The second command saves a new file without installing anything. Read that file,
then run the exact filename printed by the command. Alternatively,
`bash install.sh nvidia` downloads and starts the current version again.

Review the installer before granting administrative privileges. It may install
Docker and creates the panel and updater services. Do not run it over an
existing deployment without a backup and a clear migration plan.

## Keep image families separate

| Hardware | Selection considerations |
| --- | --- |
| NVIDIA Turing / CMP50HX | Use a compatible Turing image and FP16-compatible recipes. Modified 20 GB CMP50HX cards are distinct from stock cards. |
| NVIDIA Ampere / CMP170HX and newer supported GPUs | Select the appropriate NVIDIA runtime and model preset. |
| AMD, including MI50/gfx906 | Use an AMD image; ROCm runtime families are not interchangeable. |
| CPU | Check that the selected model and engine support CPU execution. |

Confirm that your intended image tag and architecture are actually published.
Some newer integrations require a newer image build, not merely the same version
number. Do not select an `-updater` tag as the main application image.

## First login

Use the panel address and port printed by the installer. Set a unique initial
administrator password and follow the first-login instructions. An existing
account is not reset simply by changing an environment variable.

Activate your own license, verify detected GPUs and persistent storage, then
test a small compatible model with one request. Restrict access to the local
network until HTTPS, authentication and permissions are configured.

Keep Compose, environment files, data, models and updater state outside the
container and include them in protected backups. Never upload those files here.
