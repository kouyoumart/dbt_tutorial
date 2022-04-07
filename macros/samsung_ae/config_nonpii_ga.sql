/*  COOKIE_ID  */
{% macro set_cookie_id () %}

    {% set COOKIE_ID = "fullVisitorId" %}
    {{ return (COOKIE_ID) }}

{% endmacro %}


/*  PRODUCT_SCOPES
    -> Definition of the products of interest 
*/
{% macro set_product_scopes () %}

    {% set PRODUCT_SCOPES = ({
            "qled_premium": {
                "product_list": ["tv_frame", 
                                 "tv_phud", 
                                 "tv_premiere", 
                                 "tv_qled", 
                                 "tv_qled_8k", 
                                 "tv_serif", 
                                 "tv_sero", 
                                 "tv_terrace"],
            },
            "tv_non_premium": {
                "product_list": ["tv_fhd", 
                                 "tv_hd", 
                                 "tv_led", 
                                 "tv_uhd"],
            },
            "s_series": {
                "product_list": ["s_series"],
            },
            "a_series": {
                "product_list": ["a_series"],
            },
            "galaxy_fold": {
                "product_list": ["galaxy_fold"],
            },
            "galaxy_flip": {
                "product_list": ["galaxy_flip"],
            },
            "fold_flip": {
                "product_list": ["galaxy_fold", 
                                 "galaxy_flip"],
            },
            "wearables": {
                "product_list": ["gear",
                                 "buds", 
                                 "galaxy_fit", 
                                 "galaxy_watch"],
            },
            "tablet": {
                "product_list": ["tablet"],
            },
            "tabs_wearables": {
                "product_list": ["tablet", 
                                 "gear", 
                                 "buds", 
                                 "galaxy_fit", 
                                 "galaxy_watch"],
            },
            "fridge_freezer": {
                "product_list": ["fridge_freezer"],
            },
            "washing_machine": {
                "product_list": ["washing_machine"],
            },
            "monitor": {
                "product_list": ["monitor"]
            }
        })  %}
    {{ return (PRODUCT_SCOPES)  }}

{% endmacro %}


/*  EXTENDED SCOPES 
    -> Extended scopes for IM (smartphones and related equipment), TV and DA (domestic appliances) are used to
    -> compute features (clics, pageviews, purchases...) related to these categories as anciliary info
*/
{% macro set_extended_scopes () %}

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
        "DA": [
            "air_conditioner", 
            "cleaner", 
            "fridge_freezer", 
            "tumble_dryer", 
            "washing_machine"],
    }) %}

    {{ return (EXTENDED_SCOPES) }}

{% endmacro %}


/*  JOINT_PREPROCESSING_SETS
    - Joint preprocessing sets are used to avoid computing the same information (general session features) 
      multiple times when preprocessing multiple products for one country
*/
{% macro set_joint_preprocessing_sets () %}

    {% set JOINT_PREPROCESSING_SETS = ({
        "test": [
            "fold_flip", 
            "tabs_wearables", 
            "washing_machine"
            ],
        "samsung_weeks": [
            "s_series",
            "galaxy_fold",
            "galaxy_flip",
            "qled_premium",
            "washing_machine",
            "fridge_freezer",
            ],
        "jan_sale": [
            "s_series",
            "a_series",
            "galaxy_fold",
            "galaxy_flip",
            "wearables",
            ],
        "small_products": [
            "tablet",
            "galaxy_fold",
            "galaxy_flip",
            "wearables",
            "washing_machine",
            "fridge_freezer",
            ],
        "SEG": [
            "s_series", 
            "fold_flip", 
            "wearables", 
            "qled_premium", 
            "washing_machine"
            ],
        "ES": [
            "s_series", 
            "galaxy_fold", 
            "galaxy_flip", 
            "qled_premium", 
            "fridge_freezer", 
            "washing_machine"
            ],
        "sei": [
            "qled_premium", 
            "fridge_freezer", 
            "washing_machine"
            ],
        "SEPOL": ["s_series"],
        "rainbow": [
            "s_series", 
            "wearables"],
        "IM": [
            "s_series",
            "a_series",
            "galaxy_fold",
            "galaxy_flip",
        ],
        "TV": [
            "qled_premium",
            "tv_non_premium",
            "monitor",
        ],
        "DA": [
            "washing_machine",
            "fridge_freezer",
        ],
        "other": [
            "fold_flip",
            "wearables",
            "tablet",
        ],
        }) %}

    {{ return (JOINT_PREPROCESSING_SETS) }}

{% endmacro %}


/* Add _GENERIC_FAVORITE_COLUMN_VALUES */
{%  macro set_generic_favorite_column_values () %}

    {% set _GENERIC_FAVORITE_COLUMN_VALUES = ({
        "browser": ["Chrome", "Samsung Internet", "Safari", "Android Webview", "Edge", "Safari (in-app)", "Firefox"],
        "operatingSystem": ["Android", "iOS", "Windows", "Macintosh", "Chrome OS","Linux"],
        "channelGrouping": ["Direct", "Paid Search", "Organic Search", "Display", "Referral", "Social", "Email"],
        })   %}
    {{ return (_GENERIC_FAVORITE_COLUMN_VALUES) }}

{%  endmacro %}

/* FAVORITE_COLUMN_VALUES */
{% macro test_for () %}

    {% set _GENERIC_FAVORITE_COLUMN_VALUES = set_generic_favorite_column_values() %}

    {% for key, value in _GENERIC_FAVORITE_COLUMN_VALUES.items() %}
                '{{key}}' : {{value}} {%- if not loop.last %},{% endif -%}
    {% endfor %}

{% endmacro %}


{%  macro set_favorite_column_values () %}

    {%- set _GENERIC_FAVORITE_COLUMN_VALUES = test_for() -%}

    {% set FAVORITE_COLUMN_VALUES = ({
        "be" : 
            {{**_GENERIC_FAVORITE_COLUMN_VALUES}}
        
    })  %} 
    {{ return FAVORITE_COLUMN_VALUES }
{%  endmacro %} 

{#
{%  macro set_favorite_column_values () %}

    {% set FAVORITE_COLUMN_VALUES = ({
    "be": {
        set_generic_favorite_column_values(), 
        "region": [
            "Flanders", 
            "Wallonia", 
            "Brussels"]
    },
    "nl": {
        set_generic_favorite_column_values(),
        "region": [
            "South Holland",
            "North Holland",
            "North Brabant",
            "Gelderland",
            "Utrecht",
            "Overijssel",
            "Limburg",
            "Friesland"],
    },
    "sei": {
        set_generic_favorite_column_values(),
        "region": [
            "Lombardy", 
            "Lazio", 
            "Campania", 
            "Emilia-Romagna", 
            "Veneto", 
            "Sicily", 
            "Piedmont", 
            "Tuscany"],
    },
    "SEUK": {
        set_generic_favorite_column_values(), 
            "region": [
                "England", 
                "Scotland", 
                "Wales", 
                "Northern Ireland"]
    },
    "SEG": {
        set_generic_favorite_column_values(),
        "region": [
            "North Rhine-Westphalia",
            "Bavaria",
            "Baden-Wurttemberg",
            "Berlin",
            "Lower Saxony",
            "Hamburg",
            "Hessen",
            "Hesse"],
    },
    "ES": {
         set_generic_favorite_column_values(),
        "region": [
            "Madrid", 
            "Catalonia", 
            "Andalusia", 
            "Valencian Community", 
            "Basque Country", 
            "Castile and Leon", 
            "Galicia"],
    },
    "SE": {
        set_generic_favorite_column_values(),
        "region": [
            "Stockholm County",
            "Vastra Gotaland County",
            "Skane County",
            "Ostergotland County",
            "Uppsala County",
            "Jonkoping County",
            "Halland County",
            "Vasterbotten County"],
    },
    "DK": {
        set_generic_favorite_column_values(),
        "region": [
            "Capital Region of Denmark",
            "Central Denmark Region",
            "Region of Southern Denmark",
            "Region Zealand",
            "North Denmark Region",
            "Stockholm County",
            "Skane County"],
    },
    "FI": {
        set_generic_favorite_column_values(),
        "region": [
            "Uusimaa",
            "Pirkanmaa",
            "Southwest Finland",
            "Northern Ostrobothnia",
            "Satakunta",
            "Central Finland",
            "Paijanne Tavastia",
            "Northern Savonia"],
    },
    "NO": {
        set_generic_favorite_column_values(),
        "region": [
            "Oslo", 
            "Viken", 
            "Trondelag", 
            "Rogaland", 
            "Vestland", 
            "More og Romsdal", 
            "Nordland"],
    },
    "SEPOL": {
        set_generic_favorite_column_values(),
        "region": [
            "Masovian Voivodeship",
            "Silesian Voivodeship",
            "Lower Silesian Voivodeship",
            "Greater Poland Voivodeship",
            "Lesser Poland Voivodeship",
            "Pomeranian Voivodeship",
            "Lodz Voivodeship",
            "Kuyavian-Pomeranian Voivodeship"],
    },
    "cz": {
        set_generic_favorite_column_values(),
        "region": [
            "Prague",
            "South Moravian Region",
            "Moravian-Silesian Region",
            "Central Bohemian Region",
            "Usti nad Labem Region",
            "South Bohemian Region",
            "Olomouc Region",
            "Plzen Region"],
    },
    "sk": {
        set_generic_favorite_column_values(),
        "region": [
            "Bratislava Region",
            "Presov Region",
            "Trnava Region",
            "Zilina Region",
            "Nitra Region",
            "Banska Bystrica Region",
            "Trencin Region",
            "Kosice Region"],
    },
    "hu": {
        set_generic_favorite_column_values(),
        "region": [
            "Budapest",
            "Pest County",
            "Borsod-Abauj-Zemplen",
            "Gyor-Moson-Sopron",
            "Hajdu-Bihar",
            "Fejer",
            "Csongrad",
            "Bacs-Kiskun",
        ],
    },
    "al": {
        set_generic_favorite_column_values(),
        "region": [
            "Pristina District",
            "Durres County",
            "Elbasan County",
            "Fier County",
            "Tirana County",
            "Shkoder County",
            "Vlore County",
        ],
    },
    "rs": {
        set_generic_favorite_column_values(),
        "region": [
            "Vojvodina",
            "Podgorica Municipality",
            "Budva Municipality",
            "Republika Srpska",
            "Pristina District",
            "Federation of Bosnia and Herzegovina",
            "Kosovska Mitrovica District",
        ],
    },
    "hr": {
        set_generic_favorite_column_values(),
        "region": [
            "City of Zagreb",
            "Split-Dalmatia County",
            "Federation of Bosnia and Herzegovina",
            "Primorje-Gorski Kotar County",
            "Osijek-Baranja County",
            "Istria County",
            "Varazdin County",
            "Medjimurje County",
        ],
    },
    "si": {
        set_generic_favorite_column_values(),
        "region": [
            "Ljubljana",
            "Administrative unit Maribor",
            "Koper",
            "Kranj",
            "Radovljica",
            "(not set)",
            "Celje",
            "Novo Mesto",
        ],
    },
    "ro": {
        set_generic_favorite_column_values(),
        "region": [
            "Bucharest",
            "Cluj County",
            "Timis County",
            "Iasi County",
            "Brasov County",
            "Constanta County",
            "Prahova",
            "Arges County",
        ],
    },
    "bg": {
        set_generic_favorite_column_values(),
        "region": [
            "Sofia City Province",
            "Varna",
            "Plovdiv Province",
            "Burgas",
            "Stara Zagora",
            "Blagoevgrad Province",
            "Pazardzhik",
            "Ruse",
        ],
    },
    "ch": {
        set_generic_favorite_column_values (),
        "region": [
            "Zurich",
            "Canton of Bern",
            "Geneva",
            "North Rhine-Westphalia",
            "St. Gallen",
            "Basel City",
            "Aargau",
            "Vaud",
        ],
    }
    }) %}

    {{ return (FAVORITE_COLUMN_VALUES) }}

{%  endmacro %}
#}
