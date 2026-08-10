#!/usr/bin/env bash
set -o pipefail

# --- Configuration ---
CONFIG_FILE="$UPLOADED_FILES/mypy.ini"
TARGET_PATH="assignment.py"           # Target file or directory
MAX_POINTS=10             # Total points possible
PENALTY_PER_ERROR=2       # Deduction per mypy error
MIN_SCORE=0               # Floor score

echo "=========================================="
echo " Running Static Type Analysis (mypy)"
echo "=========================================="

# Run mypy and capture output
MYPY_OUTPUT=$(python -m mypy --config-file "$CONFIG_FILE" --strict --allow-untyped-decorators "$TARGET_PATH" 2>&1)
EXIT_CODE=$?

# Print full output to standard stdout for student feedback
echo "$MYPY_OUTPUT"
echo "=========================================="

# Parse error count from standard mypy output lines
ERROR_COUNT=$(echo "$MYPY_OUTPUT" | grep -c ": error:" || true)

# Calculate final points
DEDUCTION=$(( ERROR_COUNT * PENALTY_PER_ERROR ))
RAW_SCORE=$(( MAX_POINTS - DEDUCTION ))

if [ "$RAW_SCORE" -lt "$MIN_SCORE" ]; then
    FINAL_SCORE=$MIN_SCORE
else
    FINAL_SCORE=$RAW_SCORE
fi

PERCENTAGE=$(( (FINAL_SCORE * 100) / MAX_POINTS ))

echo "SUMMARY:"
echo " - Total Errors Found : $ERROR_COUNT"
echo " - Penalty per Error  : -$PENALTY_PER_ERROR pts"
echo " - Final Score        : $FINAL_SCORE / $MAX_POINTS ($PERCENTAGE%)"
echo "=========================================="

# Output points to CodeGrade structured output (File Descriptor 3)
echo "{\"tag\": \"points\", \"points\": \"${FINAL_SCORE}/${MAX_POINTS}\"}" >&3

exit 0
