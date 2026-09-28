package omnix.ai.draw;

class OmnixIKSolver {
    public static function solveTwoBone(
        rig:OmnixHumanRig,
        upperId:String,
        lowerId:String,
        targetX:Float,
        targetY:Float,
        upperLength:Float,
        lowerLength:Float
    ):Void {
        var dx = targetX;
        var dy = targetY;
        var distance = Math.sqrt(dx * dx + dy * dy);
        var maxDistance = upperLength + lowerLength;
        if (distance > maxDistance) distance = maxDistance;

        var cosUpper = (upperLength * upperLength + distance * distance - lowerLength * lowerLength)
            / (2 * upperLength * Math.max(distance, 0.0001));
        cosUpper = Math.max(-1, Math.min(1, cosUpper));

        var baseAngle = Math.atan2(dy, dx);
        var upperAngle = baseAngle - Math.acos(cosUpper);

        var lower = rig.get(lowerId);
        var upper = rig.get(upperId);
        if (upper != null) upper.rotation = upperAngle * 180 / Math.PI;
        if (lower != null) lower.rotation = Math.acos(
            (upperLength * upperLength + lowerLength * lowerLength - distance * distance)
            / (2 * upperLength * lowerLength)
        ) * 180 / Math.PI;
    }
}
