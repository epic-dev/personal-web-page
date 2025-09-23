---
layout: '../../layouts/article.astro'
title: '[Day 1] Started crafting my first Flutter app'
pubDate: 2025-09-23
description: 'This is the first post of my new Astro blog.'
author: 'Pavel Yuruts'
tags: ["astro", "blogging", "learning in public"]

topImage: 
  src: '/images/coding-day1.webp'
  alt: coding-day-1

image1: 
  src: '/images/2025-09-23.png'
  alt: screenshot-1

setup: |
  import { Picture } from "astro-imagetools/components";
---

I've got an idea to help myself learn Dutch. Where to start? Since I'm a software developer the solution is simple -- let's build it from scratch.

The initial MVP of my first mobile app took me a couple of evenings and numerous cups of coffee. So, here it is. _(link)_

The main idea is to learn Dutch noun articles, distinguishing which article ('De' or 'Het') is used where.

<!-- <Picture
  src={frontmatter.image1.src}
  alt={frontmatter.image1.alt}
/> -->

But it's not usual memoization of words with articles. The app uses spatial memory. Which means you need to swipe the card with a word to the correct direction. 
