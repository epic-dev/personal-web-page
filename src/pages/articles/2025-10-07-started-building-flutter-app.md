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

Today I've created a couple of UI components. One of them is the Card component which will be the main functional thing is the app.

The card is draggable and depends on which side users drag the card the correct or incorrect answer will be given.

<mp4 file goes here>

At the moment of this article I've already created a feedback overlay. This feedback shows the correctness of the answer given.

Also added sound and haptic feedback depending on answer correctness.
