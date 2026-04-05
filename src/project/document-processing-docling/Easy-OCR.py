"""
Easy-OCR script: Extracts text from images using EasyOCR.

Usage:
    python Easy-OCR.py [-i IMAGE_FILE]

Dependencies:
    - easyocr (install via `pip install easyocr`)

Notes:
    If no image file is provided, defaults to 'input.png'.
    Prints detected text with coordinates and confidence scores.
"""

import sys
import argparse
import easyocr


def main():
    parser = argparse.ArgumentParser(
        description="Extract text from images using EasyOCR."
    )
    parser.add_argument(
        "-i",
        "--image",
        type=str,
        default="input.png",
        help="Path to the image file (default: input.png)",
    )
    args = parser.parse_args()

    try:
        reader = easyocr.Reader(["en"])
        result = reader.readtext(args.image)
    except Exception as e:
        print(f"Error processing image '{args.image}': {e}", file=sys.stderr)
        sys.exit(1)

    if not result:
        print(f"No text found in image '{args.image}'.")
        return

    all_text: str = ""
    for res in result:
        coord, text, conf = res
        all_text = all_text + "\n" + text
        print(f"Text: {text}")
        print(f"  Coordinates: {coord}")
        print(f"  Confidence: {conf:.2f}\n")

    print(f"Full Text: {all_text}")


if __name__ == "__main__":
    main()
