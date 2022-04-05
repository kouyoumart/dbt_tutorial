/* EXTENDED SCOPES */
{% macro set_values() %}

    {% set EXTENDED_SCOPES = ({
    "IM": ["s_series",
         "a_series",
        "n_series",
        "j_series",
        "galaxy_fold",
        "galaxy_flip",
        "galaxy_others",
        "galaxy_fit",
        "gear",
        "buds",
        "galaxy_watch",
        "tablet",
        "wearables",
    ],
    "TV": [
        "tv_fhd",
        "tv_hd",
        "tv_uhd",
        "tv_phud",
        "tv_frame",
        "tv_led",
        "tv_premiere",
        "tv_qled",
        "tv_qled_8k",
        "tv_serif",
        "tv_sero",
        "tv_micro",
        "tv_terrace",
        "soundbar",
        "uhd_bluray_tv_player",
        "monitor",
    ],
    "DA": ["air_conditioner", "cleaner", "fridge_freezer", "tumble_dryer", "washing_machine"],
}) %}

{{ return (result)}}
{% endmacro %}

{% macro set_values2() %}
    {% set result = ({
    "browser": ["Chrome", "Samsung Internet", "Safari", "Android Webview", "Edge", "Safari (in-app)", "Firefox"],
    "operatingSystem": ["Android", "iOS", "Windows", "Macintosh", "Chrome OS", "Linux"],
    "channelGrouping": ["Direct", "Paid Search", "Organic Search", "Display", "Referral", "Social", "Email"],
}) %}

{{ return (result)}}
{% endmacro %}

