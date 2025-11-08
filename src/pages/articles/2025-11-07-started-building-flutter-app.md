---
layout: '../../layouts/article.astro'
title: '[Day 4] About screen'
pubDate: 2025-11-07
description: 'This is the fourth post of my new Astro blog.'
author: 'Pavel Yuruts'
tags: ["astro", "blogging", "learning in public"]

topImage: 
  src: '/images/coding-day1.webp'
  alt: coding-day-1

setup: |
  import { Picture } from "astro-imagetools/components";
---

Today I created a screen that displays information about the app. To display the app version, I've included a new Flutter package, `platform_info_plus`. This package allows me to read platform information, as its name suggests, without the need to update it manually on the screen.

<screenshot goes here>

I also made some small UI enhancements, updating the styling of the settings menu items.
There is still a lot of work to do. A huge part of it is to distinguish which words should be in the Free version and which ones in the Pro version. I need to somehow separate them by categories and popularity, or even by common proficiency levels, like A1, A2, etc.

To be continued...
