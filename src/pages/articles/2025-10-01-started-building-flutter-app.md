---
layout: '../../layouts/article.astro'
title: '[Day 2] Principles'
pubDate: 2025-10-01
description: 'This is the second post of my new Astro blog.'
author: 'Pavel Yuruts'
tags: ["astro", "blogging", "learning in public"]

topImage: 
  src: '/images/coding-day1.webp'
  alt: coding-day-1

setup: |
  import { Picture } from "astro-imagetools/components";
---

I like clean architecture and meaningful solutions. But as is often the case the devil is in the details.
From the very beginning I started thinking about two versions of the app. On a high level they are Free and Pro.

The Free app will run with limited functionality: only the core idea that makes the app useful and a limited set of words to learn. The words will appear randomly and will not be categorized by topic.
The Pro version will include metrics to allow users to track their progress and set achievements and goals. It will have an extended set of words categorized by topic. Users will be able to choose the topic from which to learn words.

Okay, let's start with a proof of concept so as not to drown in the details.


### Framework

As I mentioned in the [previous article](/articles/2025-09-23-started-building-flutter-app), I've chosen Flutter. One codebase for multiple platforms. The Flutter community gets bigger and bigger each day, and there are dozens of widgets and plugins to build beautiful apps.

Flutter also allows me to build different versions of the app based on 'flavors'. Each flavor is just a set of configurations (bundle IDs, app names, feature flags, etc.). This became the basis of the project, allowing me to play with different settings depending on the app version and to include or exclude services and functionalities.

### Architecture and services

The app is small and simple and I wanted to keep that simplicity but also wanted to make a room for future maintenance and scale. 
Keeping that in mind I started building the app according to the principles of the clean architecture - separating code into layers, keep components decoupled as much as possible.
Basically, the app has three layers at this moment - domain, presentation and data.

### Domain

The smallest layer in the Free version of the app. The only use case is to swipe the card to the correct side and store the date and time of the latest swipe.
This will possibly be altered during app development.

### Data

The app is going to work offline, no internet connection needed. User data will be stored on their devices.
All data in the app it's just user settings and words. New device - new setup.

### Presentation

The most interesting layer because this is what users see and interact with. I selected Provider as a state manager for the presentation layer. It allows me to separate the user interface from the code that manages the state. Its transparent nature ideally aligns with the concept of the app's architecture.



To be continued...
