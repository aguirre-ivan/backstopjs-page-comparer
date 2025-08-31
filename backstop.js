const scenarios = require('./scenarios.json');

module.exports = {
    "id": "visual_test",
    "viewports": [
        {
            "label": "desktop",
            "width": 1280,
            "height": 800
        }
    ],
    "scenarios": scenarios,
    "paths": {
        "bitmaps_reference": "backstop_data/bitmaps_reference",
        "bitmaps_test": "backstop_data/bitmaps_test",
        "html_report": "backstop_data/html_report",
        "ci_report": "backstop_data/ci_report"
    },
    "engine": "playwright",
    "report": [
        "browser",
        "CI"
    ],
    "engineOptions": {
        "args": [
            "--no-sandbox"
        ]
    }
}