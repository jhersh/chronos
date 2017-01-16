# Chronos

Chronos is an experiment in how humans perceive time. It is a Swift command line utility that repeats a message after a fixed delay.

Chronos is named for [Chronos](https://en.wikipedia.org/wiki/Chronos), the Greek personification of Time.

## Usage

```bash
/path/to/chronos ["message"] [duration in seconds]
```

## Examples

Default message with default delay of 5 minutes:

```bash
/path/to/chronos
Blip.
See you in 5 minutes...
```

(5 minutes later...)

```bash
Blip.
```

(5 minutes later...)

```bash
Blip.
```

With an optional duration, message, and run in the background:

```bash
/path/to/chronos "Hello Chronos" 100 &
```
