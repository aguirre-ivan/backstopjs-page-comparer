# BackstopJS Page Comparer

A simple project to perform **visual regression testing** between two web pages using [BackstopJS](https://github.com/garris/BackstopJS). 
It allows you to compare screenshots of different environments (e.g., staging vs production) and detect unexpected UI changes.  
The project is fully containerized with Docker, so you don’t need to install Node.js or BackstopJS locally.

## Configuration

1. Clone this repository and move into the project folder:

```bash
git clone https://github.com/aguirre-ivan/backstopjs-page-comparer \
&& cd backstopjs-page-comparer
```

2. Copy the example scenarios file:

```bash
cp scenarios-example.json scenarios.json
```

3. Edit `scenarios.json`and set the pages you want to compare. Example:

```json
[
   {
       "label": "Home",
       "url": "https://example.com",
       "referenceUrl": "https://example.com",
       "selectors": ["document"],
       "misMatchThreshold": 0.1
   }
]
```

- url → the page under test (e.g., staging).
- referenceUrl → the baseline page to compare against (e.g., production).
- selectors → which part of the DOM to capture ("document" means the full page).
- misMatchThreshold → maximum percentage of pixel difference allowed before failing.

## Usage

Run the provided script:

```bash
./backstop-run.sh
```

This will:

- Generate new reference images.
- Run the visual comparison tests.
- Automatically open the HTML report in your browser.

The report will be available at `backstop_data/html_report/index.html`

*Open it manually if your system does not support xdg-open.*