# jetson-voice-assistant

A Jetson voice assistant. Running in a container.

## Usage

### Build

```bash
docker build -t jetson-voice-assistant:latest .
```

### Run

#### Interactive shell

```bash
docker run -it --rm \
    --device /dev/snd:/dev/snd \
    --device /dev/bus/usb:/dev/bus/usb \
    -v $PWD:/code \
    jetson-voice-assistant:latest /bin/bash
```

#### Record a short audio clip

```bash
# Use arecord -L to see HW devices.
# Use card number & device number in -D flag: hw:<card number>,<device number>
arecord -D plughw:Device,0 --format=S16_LE --duration=5 --rate=44100 test.wav
```

#### Play recording

```bash
# Use aplay -L to see HW devices.
# Use card number & device number in -D flag: hw:<card number>,<device number>
aplay -D plughw:Device_1,0 --format=S16_LE --rate=44100 test.wav
```