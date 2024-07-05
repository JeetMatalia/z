This project uses flutter gen to generate assets.

For assets generation :
- If the issue zsh: command not found: fluttergen then execute the command follow 'dart pub global activate flutter_gen' then you have to do execute command export PATH="$PATH":"$HOME/.pub-cache/bin"
- Copy the assets inside (packages/my_assets/assets/images/)
- Run 'fluttergen -c pubspec.yaml' command inside my_assets directory to regenerate MyAssets Class
- You can access assets by MyUnboxAssets.images.assets_name.image() 