# OmnixDraw Model Storage

Trained adapters belong here locally or in a release artifact. Do not commit large model weights to the source repository unless their license and repository policy allow it.

Expected layout:

~~~text
models/omnixdraw/
  dataset.jsonl
  adapters/
    OmnixStyle/
    OmnixCharacter/
    OmnixBackground/
    OmnixLineArt/
    OmnixPose/
~~~
