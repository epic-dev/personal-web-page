---
layout: '../../layouts/article.astro'
title: '[Day 3] Adding dummy UI'
pubDate: 2025-10-07
description: 'This is the third post of my new Astro blog.'
author: 'Pavel Yuruts'
tags: ["astro", "blogging", "learning in public"]

topImage: 
  src: '/images/coding-day1.webp'
  alt: coding-day-1

setup: |
  import { Picture } from "astro-imagetools/components";
---

Today I created a couple of UI components. One of them is the Card component which will be the main functional element in the app.

The card is draggable and depending on which side a user drags the card, the correct or incorrect answer will be given.

<mp4 file goes here>

At the time of this article I've already created a feedback overlay. This feedback shows whether the given answer is correct.

I also added sound and haptic feedback depending on the answer's correctness.
