<div align="center">
  <a href="https://github.com/codeschooldropout/unraid-nvidia-overclock">
    <h3 align="center">Unraid Nvidia Overclock</h3>
  </a>

  <p align="center">
    Unraid userscript to configure nvidia cards extended power and speed settings while headless
    <br />
    <br />
    <a href="https://github.com/codeschooldropout/unraid-nvidia-overclock/issues">Report Bug</a>
    ·
    <a href="https://github.com/codeschooldropout/unraid-nvidia-overclock/issues">Request Feature</a>
  </p>
</div>


<!-- ABOUT THE PROJECT -->
## About The Project

Decided to change mining computer into backup / test Unraid NAS but still wanted to mine.

Initially wanted to try GPU passthrough to a VM to avoid nvidia-settings on headless system but that didn't work out.

Found and adjusted [unraid-nvidia-overclock.sh](https://gist.github.com/gabrielsond/eea673568c17ff9a4b904cd0eb22760e) to work with Unraid 6.10rc4 test release

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these steps.

### Prerequisites

Install plugins via Community Applications in Unraid

* [Unraid - CA User Scripts](https://forums.unraid.net/topic/48286-plugin-ca-user-scripts/)
* [Unraid - Nvidia Driver](https://forums.unraid.net/topic/98978-plugin-nvidia-driver/)


### Installation

1. Clone the repo somewhere on your array - i.e. /mnt/user/appdata/unraid-nvidia-overclock.git
   ```sh
   git clone https://github.com/codeschooldropout/unraid-nvidia-overclock.git
   ```
2. Add unraid_nvidia_overclock.sh to User Scripts
   * Change APPDIR to location on array
3. Run script to download and create package cache and defaults
   * Set to run at Start of Array
   * Can also be run in foreground if changes are made to configuration

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- [ ] Deployment via Community Applications
- [ ] Test Unraid 6.9.2


See the [open issues](https://github.com/codeschooldropout/unraid-nvidia-overclock/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- LICENSE -->
## License
This is licensed to kill, as in it may kill your computer if misconfigured. Exercise caution.


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

codeschooldropout - [@codedropout](https://twitter.com/codedropout)

Project Link: [https://github.com/codeschooldropout/unraid-nvidia-docker](https://github.com/codeschooldropout/unraid-nvidia-docker)

<p align="right">(<a href="#top">back to top</a>)</p>