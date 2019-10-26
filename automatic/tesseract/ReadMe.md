# [Tesseract Open Source OCR Engine](https://chocolatey.org/packages/tesseract)

This package contains an **OCR engine** - `libtesseract` and a **command line program** - `tesseract`.
Tesseract 4 adds a new neural net (LSTM) based OCR engine which is focused
on line recognition, but also still supports the legacy Tesseract OCR engine of
Tesseract 3 which works by recognizing character patterns. Compatibility with
Tesseract 3 is enabled by using the Legacy OCR Engine mode (--oem 0).
It also needs traineddata files which support the legacy engine, for example
those from the tessdata repository.

The lead developer is Ray Smith. The maintainer is Zdenko Podobny.
For a list of contributors see [AUTHORS](https://github.com/tesseract-ocr/tesseract/blob/master/AUTHORS)
and GitHub's log of [contributors](https://github.com/tesseract-ocr/tesseract/graphs/contributors).

Tesseract has **unicode (UTF-8) support**, and can **recognize more than 100 languages** "out of the box".

Tesseract supports **various output formats**: plain text, hOCR (HTML), PDF, invisible-text-only PDF, TSV. The master branch also has experimental support for ALTO (XML) output.

You should note that in many cases, in order to get better OCR results, you'll need to **[improve the quality](https://github.com/tesseract-ocr/tesseract/wiki/ImproveQuality) of the image** you are giving Tesseract.

This project **does not include a GUI application**. If you need one, please see the [3rdParty](https://github.com/tesseract-ocr/tesseract/wiki/User-Projects-%E2%80%93-3rdParty) wiki page.

Tesseract **can be trained to recognize other languages**. See [Tesseract Training](https://github.com/tesseract-ocr/tesseract/wiki/TrainingTesseract) for more information.