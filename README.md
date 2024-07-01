# Altered Crafting

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Altered Crafting is a FiveM resource designed to create crafting points, define crafting recipes with success rates, and trigger events upon success or failure. This project is public to encourage learning and invite other developers to contribute in the future.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Crafting Points**: Create specific points on the map where players can perform crafts.
- **Crafting Recipes**: Define recipes with required materials and a success rate.
- **Events**: Configure events that trigger on successful or failed crafts.
- **Customization**: Highly customizable to fit various gameplay needs.

## Prerequisites

- [ox_lib](https://github.com/overextended/ox_lib)

## Installation

1. Clone the repository or download the latest release.
   ```sh
   git clone https://github.com/oldarorn/alt_crafting.git
   ```
2. Ensure you have [ox_lib](https://github.com/overextended/ox_lib) installed.
3. Add `alt_crafting` to your FiveM server resources.
4. Add `ensure alt_crafting` to your `server.cfg`.

## Configuration

1. Take a look at `shared` folder
2. Save your changes and restart your server.

## Usage

- Players can visit the designated crafting points to craft items according to the defined recipes.
- Events will be triggered based on the success or failure of the crafting attempt, allowing for dynamic gameplay experiences.

## Contributing

Contributions are welcome! Please fork this repository, make your changes, and submit a pull request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the Project.
2. Create your Feature Branch (git checkout -b feature/YourFeature).
3. Commit your Changes (git commit -m 'Add some YourFeature').
4. Push to the Branch (git push origin feature/YourFeature).
5. Open a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Oldarorn/alt_crafting/blob/main/LICENSE) file for details.

