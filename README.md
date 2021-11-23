# aridai's (Very Personal) Godot Template
 A project template for Godot with some of the most essential plugins, a scene transition/loading system and itch.io integration
# How to set up itch.io builds?
You have to fill in 3 secrets in your repository:
- ``BUTLER_CREDENTIALS`` - an API key, generated on your itch.io account (Account > Settings > API keys)
- ``ITCH_GAME`` - internal name of the game (ex. if it's located at ``aridai.itch.io/spirit``, the ``ITCH_GAME`` would be ``spirit``)
- ``ITCH_USER`` - your username on itch.io
You can either be more precise in your exports by triggering the manual Dispatch Export workflow, or just get the game out quickly by putting ``!itch-deploy`` somewhere in your commit name.
# Features
- Godot Game Settings plugin - For setting up a basic config menu for the player
- Aseprite Importer - Say goodbye to clunky sprite management
- Sound Manager - A pipeline to control Music and SFX, complete with volume control in the GGS
- Asynchronous Scene loading - Complete with a loading anim for the really hefty assets
- Scene transition system - Complete with seamless music and lack of freezing transitions
# Special thanks
- [Crystal Bit](https://github.com/crystal-bit/godot-game-template) for the Dispatch Workflow
- [barichello](https://github.com/aBARICHELLO/godot-ci) for godot-ci
- [PunchablePlushie](https://github.com/PunchablePlushie/godot_ggs) for GGS
- [hectorid](https://github.com/hectorid/aseprite_importer) for Aseprite Importer
- [Xecestel](https://gitlab.com/Xecestel/sound-manager) for Sound Manager
- The [Godot Team](https://www.patreon.com/godotengine) for an amazing engine
- 