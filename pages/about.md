---
layout: page
title: About
permalink: /about/
weight: 3
---

# **About me**

Hi I am **{{ site.author.name }}** :wave:, welcome to my space!<br>
The site just uses for archive my study and my experirence. It's maybe useless and boring to you but I think that not so ^^<br>

<div class="row">
{% include about/skills.html title="Programming Skills" source=site.data.programming-skills %}
{% include about/skills.html title="Other Skills" source=site.data.other-skills %}
</div>

<div class="row">
{% include about/timeline.html %}
</div>
