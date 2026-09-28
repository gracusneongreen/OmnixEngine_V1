# Omnix Human Drawing Knowledge

The Draw Agent treats a human character as an editable hierarchy rather than one flat bitmap.

Knowledge domains:
- skeleton and joints
- body proportions
- head and face construction
- arms, hands, legs and feet
- pose and balance
- perspective
- clothing and folds
- lineart
- cel shading
- animation consistency

Pipeline:
reference -> skeleton -> proportions -> volumes -> pose -> clothing -> lineart -> color -> shading -> animation.

For FNF-compatible original characters, the same rig can drive idle, LEFT, DOWN, UP and RIGHT poses while preserving character identity.
