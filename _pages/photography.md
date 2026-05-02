---
layout: single
title: "Photography"
permalink: /photography/
author_profile: false
page_class: photography-page
---

{% assign photography_images = site.static_files | where_exp: "file", "file.path contains '/images/photography/'" | sort: "path" %}
{% assign image_extensions = "jpg,jpeg,png,gif,webp,avif" | split: "," %}

<div class="photography-gallery" markdown="1">
{% for image in photography_images %}
{% assign extension = image.extname | remove_first: "." | downcase %}
{% if image_extensions contains extension %}
{% assign filename = image.name | split: "." | first %}
{% assign alt_text = filename | replace: "-", " " | replace: "_", " " %}

[![{{ alt_text }}]({{ image.path | relative_url }})]({{ image.path | relative_url }})

{% endif %}
{% endfor %}
</div>
