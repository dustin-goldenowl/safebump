<div align="left">
  
  <div align="center">
    <h1>SafeBumb</h1>

  <p>
This is a tracking application for pregnant mothers, looking up knowledge about taking care of their children from the time they are pregnant until their children grow up
  </p>
  </div>
  

  
  
<!-- Badges -->

<br />
  <div align ="center">
    <p>
      <a href="https://github.com/dustin-goldenowl/safebump/graphs/contributors">
        <img src="https://img.shields.io/github/contributors/dustin-goldenowl/safebump" alt="contributors" />
      </a>
      <a href="">
        <img src="https://img.shields.io/github/last-commit/dustin-goldenowl/safebump" alt="last update" />
      </a>
      <a href="https://github.com/dustin-goldenowl/safebump/network/members">
        <img src="https://img.shields.io/github/forks/dustin-goldenowl/safebump" alt="forks" />
      </a>
      <a href="https://github.com/dustin-goldenowl/safebump/stargazers">
        <img src="https://img.shields.io/github/stars/dustin-goldenowl/safebump" alt="stars" />
      </a>
      <a href="https://github.com/dustin-goldenowl/safebump/issues/">
        <img src="https://img.shields.io/github/issues/dustin-goldenowl/safebump" alt="open issues" />
      </a>
      <a href="https://github.com/dustin-goldenowl/safebump/blob/master/LICENSE">
        <img src="https://img.shields.io/github/license/dustin-goldenowl/safebump.svg" alt="license" />
      </a>
    </p>
      
  <h4>
      <a href="https://github.com/dustin-goldenowl/jobspot/">View Demo</a>
    <span> · </span>
      <a href="https://github.com/dustin-goldenowl/jobspot">Documentation</a>
    <span> · </span>
      <a href="https://github.com/dustin-goldenowl/jobspot/issues/">Report Bug</a>
    <span> · </span>
      <a href="https://github.com/dustin-goldenowl/jobspot/issues/">Request Feature</a>
    </h4>
  </div>
  </div>
<br />

<!-- Table of Contents -->
# :notebook_with_decorative_cover: Table of Contents

- [About the Project](#star2-about-the-project)
  * [Screenshots](#camera-screenshots)
  * [Tech Stack](#space_invader-tech-stack)
  * [Features](#dart-features)
  * [Color Reference](#art-color-reference)
  * [Environment Variables](#key-environment-variables)
- [Getting Started](#toolbox-getting-started)
  * [Prerequisites](#bangbang-prerequisites)
  * [Installation](#gear-installation)
  * [Running Tests](#test_tube-running-tests)
  * [Run Locally](#running-run-locally)
  * [Deployment](#triangular_flag_on_post-deployment)
- [Usage](#eyes-usage)
- [Roadmap](#compass-roadmap)
- [Contributing](#wave-contributing)
  * [Code of Conduct](#scroll-code-of-conduct)
- [FAQ](#grey_question-faq)
- [License](#warning-license)
- [Contact](#handshake-contact)
- [Acknowledgements](#gem-acknowledgements)

<!-- About the Project -->
## :star2: About the Project <a name="star2-about-the-project"></a>

<!-- Screenshots -->
### :camera: Screenshots <a name="camera-screenshots"></a>

| On Boarding  | Sign in | Sign up |
| --- | --- | --- |
| <img src="screenshots/on_boarding.jpg" width=250> | <img src="screenshots/sign_in.jpg" width=250> | <img src="screenshots/sign_up.jpg" width=250> |

| Forgot Password  | Sync Data Screen | Home Screen empty |
| --- | --- | --- |
| <img src="screenshots/forgot_pass.jpg" width=250> | <img src="screenshots/syncing.jpg" width=250> | <img src="screenshots/home_screen_empty.jpg" width=250> |

| Add baby  | Home screen | Setup medication |
| --- | --- | --- |
| <img src="screenshots/add_baby.jpg" width=250> | <img src="screenshots/homescreen.jpg" width=250> | <img src="screenshots/set_up_medication.jpg" width=250> |

| Add medication name  | Edit medication | Medication screen |
| --- | --- | --- |
| <img src="screenshots/add_medication_name.jpg" width=250> | <img src="screenshots/edit_medication.jpg" width=250> | <img src="screenshots/medication_screen.jpg" width=250> |

| Quiz screen | Do question | Result quiz |
| --- | --- | --- |
| <img src="screenshots/quiz_screen.jpg" width=250> | <img src="screenshots/do_question.jpg" width=250> | <img src="screenshots/result_quiz.jpg" width=250> |

| Articles screen  | Detail article | Read full article |
| --- | --- | --- |
| <img src="screenshots/articles_screen.jpg" width=250> | <img src="screenshots/articles_detail.jpg" width=250> | <img src="screenshots/articles_read_full.jpg" width=250> |

| Articles search  | Video screen | Calendar screen |
| --- | --- | --- |
| <img src="screenshots/articles_search.jpg" width=250> | <img src="screenshots/video_screen.jpg" width=250> | <img src="screenshots/calendar_screen.jpg" width=250> |

| Add note  | Profile screen | Edit profile |
| --- | --- | --- |
| <img src="screenshots/add_note.jpg" width=250> | <img src="screenshots/profile.jpg" width=250> | <img src="screenshots/edit_profile.jpg" width=250> |

| About SafeBump  | Read policy | Setting App |
| --- | --- | --- |
| <img src="screenshots/about_app.jpg" width=250> | <img src="screenshots/read_policy.jpg" width=250> | <img src="screenshots/setting.jpg" width=250> |

<!-- TechStack -->
### :space_invader: Tech Stack <a name="space_invader-tech-stack"></a>

<details>
  <summary>Mobile</summary>
  <ul>
    <li><a href="https://dart.dev/">Dart</a></li>
    <li><a href="https://flutter.dev/">Flutter</a></li>
  </ul>
</details>

<details>
  <summary>Serverless</summary>
  <ul>
    <li><a href="https://console.firebase.google.com/">Firebase</a></li>
  </ul>
</details>

<details>
<summary>Local Database</summary>
  <ul>
    <li><a href="https://drift.simonbinder.eu/">Drift - Sqlite3</a></li>
  </ul>
</details>
<details>

<summary>DevOps</summary>
  <ul>
    <li><a href="https://www.gtihub.com/">Github</a></li>
    <li><a href="https://www.gtihub.com/">Github ACtion</a></li>
    <li><a href="https://fastlane.tools/">Fastlane</a></li>
    <li><a href="https://firebase.google.com/docs/crashlytics/">Firebase Crashlytics</a></li>
  </ul>
</details>

<!-- Features -->
### :dart: Features

- Sign In, Sign Up
- Forgot Password
- Manage Daily Quiz
- Artical, Video management
- Monitor the fetus
- Take pregnancy care knowledge tests
- Manage medication schedules
- Search artical, video
- Manage notifications
- Multi language

<!-- Color Reference -->
### :art: Color Reference

| Color  | Hex  |
| --- | --- |
| Primary Color | ![#EC407A](https://via.placeholder.com/10/EC407A?text=+) #EC407A |
| Secondary Color | ![#FFCDD2](https://via.placeholder.com/10/FFCDD2?text=+) #FFCDD2 |
| Accent Color | ![#8C8A8A](https://via.placeholder.com/10/8C8A8A?text=+) #8C8A8A |
| Text Color | ![#000000](https://via.placeholder.com/10/000000?text=+) #000000 |

<!-- Env Variables -->
### :key: Environment Variables

Coming soon

<!-- To run this project, you will need to add the following environment variables to your .env file

`API_KEY`

`ANOTHER_API_KEY` -->

<!-- Getting Started -->
## 	:toolbox: Getting Started

<!-- Prerequisites -->
### :bangbang: Prerequisites

This project uses Fastlane to auto deploy Firebase Distribution. You need to install Fastlane for this project. You need to install the ruby environment before installing Fastlane. Download and install [here](https://rubygems.org)

After installation is complete, run the command below to install Fastlane

```bash
 gem install fastlane
```

<!-- Installation -->
### :gear: Installation

Install all package in project

```bash
  flutter pub get
```
   
<!-- Running Tests -->
### :test_tube: Running Tests

To run tests, run the following command

```bash
  flutter test test/widget_test.dart
```

<!-- Run Locally -->
### :running: Run Locally

Clone the project

```bash
  git clone https://github.com/dustin-goldenowl/safebump.git
```

Install dependencies

```bash
  flutter pub get
```

Set up Multiple Language

```bash
  flutter gen-l10n
```

Start the project

```bash
  flutter run
```


<!-- Deployment -->
### :triangular_flag_on_post: Deployment

To deploy this project to Firebase Distribution

```bash
  fastlane deploy_firebase_distribution version_name: version_name version_code: version_code
```

To deploy this project to CH Play

```bash
  fastlane deploy_ch_play version_name: version_name version_code: version_code
```

<!-- Directory structure -->
## :eyes: Directory Structure

```bash

SafeBump
├───android
├──📁 assets
│   ├──📁 svg
│   ├──📁 jsons
│   ├──📁 fonts
│   ├──📁 images
├──📁 ios
├──📁 lib
│	├──📁 widget
│	│	├──📁 webview
│	│	├──📁 text_field
│	│	├──📁 text
│	│	├──📁 separator
│	│	├──📁 radio
│	│	├──📁 page
│	│	├──📁 list_view
│	│	├──📁 chip
│	│	├──📁 card
│	│	├──📁 calendar
│	│	├──📁 button
│	│	├──📁 avatar
│	│	├──📁 appbar
│	├──📁 src
│	│	├──📁 utils
│	│	├──📁 theme
│	│	├──📁 services
│	│	├──📁 router
│	│	├──📁 network
│	│	│	├──📁 model
│	│	│	│	├──📁 video
│	│	│	│	├──📁 user
│	│	│	│	├──📁 social_user
│	│	│	│	├──📁 quiz
│	│	│	│	├──📁 note
│	│	│	│	├──📁 medications
│	│	│	│	├──📁 daily_quiz.dart
│	│	│	│	├──📁 common
│	│	│	│	├──📁 calendar
│	│	│	│	├──📁 baby
│	│	│	│	├──📁 articles
│	│	│	├──📁 firebase
│	│	│	│	├──📁 helper
│	│	│	│	├──📁 collection
│	│	│	├──📁 data
│	│	│	│	├──📁 video
│	│	│	│	├──📁 user
│	│	│	│	├──📁 sign
│	│	│	│	├──📁 quiz
│	│	│	│	│	├──📁 question
│	│	│	│	├──📁 note
│	│	│	│	├──📁 medication
│	│	│	│	├──📁 daily_quiz
│	│	│	│	├──📁 baby
│	│	│	│	├──📁 articles
│	│	├──📁 localization
│	│	├──📁 local
│	│	│	├──📁 repo
│	│	│	│	├──📁 notes
│	│	│	│	├──📁 articles
│	│	│	├──📁 model
│	│	│	├──📁 entities
│	│	├──📁 feature
│	│	│	├──📁 video
│	│	│	│	├──📁 widget
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	├──📁 sync_data
│	│	│	│	├──📁 view
│	│	│	├──📁 sign_up
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	├──📁 sign_in
│	│	│	│	├──📁 view
│	│	│	│	├──📁 validated
│	│	│	│	├──📁 logic
│	│	│	├──📁 setting
│	│	│	│	├──📁 widget
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	├──📁 quiz
│	│	│	│	├──📁 widget
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	├──📁 profile
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	├──📁 on_boarding
│	│	│	│	├──📁 view
│	│	│	├──📁 medicine
│	│	│	│	├──📁 widget
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	├──📁 home
│	│	│	│	├──📁 widget
│	│	│	│	│	├──📁 daily_quiz
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	├──📁 forgot_password
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	│	│	├──📁 state
│	│	│	│	│	├──📁 cubit
│	│	│	├──📁 edit_profile
│	│	│	│	├──📁 widget
│	│	│	│	│	├──📁 item
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	├──📁 dashboard
│	│	│	│	├──📁 widget
│	│	│	│	├──📁 view
│	│	│	│	├──📁 bloc
│	│	│	├──📁 calendar
│	│	│	│	├──📁 widget
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	├──📁 articles
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	├──📁 add_baby
│	│	│	│	├──📁 view
│	│	│	│	├──📁 logic
│	│	│	│	│	├──📁 state
│	│	│	│	│	├──📁 cubit
│	│	│	├──📁 account
│	│	│	│	├──📁 bloc
│	│	│	├──📁 about_safebump
│	│	│	│	├──📁 view
│	│	├──📁 dialogs
│	│	│	├──📁 widget
│	│	├──📁 config
│	│	│	├──📁 enum
│	│	│	├──📁 device
│	│	│	├──📁 constant
│	├──📁 package
│	│	├──📁 dismiss_keyboard
│	├──📁 gen
├───screenshots
├───test
└───web
```

<!-- Architecture Diagram -->
## :chart: Architecture Diagram

<a href="https://edrawcloudpublicus.s3.amazonaws.com/viewer/self/4887705/share/2024-1-31/1706672623/main.svg">
  <img src="https://edrawcloudpublicus.s3.amazonaws.com/viewer/self/4887705/share/2024-1-31/1706672623/main.svg">
</a>

<!-- Database Diagram -->
## :chart: Database Diagram

![](https://mermaid.ink/svg/pako:eNqtVlGPojAQ_iukz2rUZRf1DZXkSFyNq1yyG14qjNKctNqW23PV_34F8RCLWR6OF3G-mfbrN9MZjihgIaABAj4meMNx7FNDPd7CeTteXtNnITmhG4OEmoniGDQjZ1vduAEaAtfMEGOy1awxYJFwiIFKjxJZ4CFLVlswIiCbSDd_3pnHWMKSxGCE6mW2HhIuowt6vvwM7eG7fs4VXh3c785aWrvuaeVhB9-yrjhjTndkT5zp2K5ITZnEdLZ0DMokiFJ4aq6V1RBkVVYkkRWJjZjYEYmrkhiSgNAqzSSpKJtCnJzvqzN2R_bSnU3rsWYCliWBc2DNYZ8ADQ6axjhmCZX1qjrVszBOiJAVx8mZ229LdzRxFrV440RGTK-VgFEJVK-LLaG_aqZGJHGMOfm6432NwZsS6Z_u2JnVYqxRq2bhESp76YbGbxICK20299yP_1iLaieDJvEK-DwBIQmjBTb3nEVaRMY-h8Qdkwtci81eW_1aY4QLaVPxWXHrBSjBwgdgwDiHoBSaExvb7uS9WVsondpNrnG2vKize1lOTwAfXZzKsGTqzt-xLoaHcTo1m6dj1mCNgeGjH1j4SMevHU35pB6lLnf1ybrZDX4bX7QI3eOYeVyv4iM8q_pHYJGCRx73WEY2xdjpAbksIqf_rzRz3KeogWLgaiiGaipnefeRjNQk9FEqYwhrnGxlKuVZuarWwRYHGqCB5Ak0ULJLB0E-yq_GHaYfjN3-RYMj-oMGHbPVMZ8sy-p3et2uaVpPDXRAg6bVerH6Vq9tKaxrPpvmuYG-shU6rU631-m3u1a_3X7pP_caSDV5yfjr5TMi-5o4_wWtWHPu?type=png)

<!-- Contributing -->
## :wave: Contributing

<a href="https://github.com/dustin-goldenowl/safebump/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=dustin-goldenowl/safebump" />
</a>

Contributions are always welcome!
See `contributing.md` for ways to get started.

<!-- FAQ -->
## :grey_question: FAQ

Coming soon

<!-- License -->
## :warning: License

Distributed under the no License. See ```LICENSE``` for more information.


<!-- Contact -->
## :handshake: Contact

Lance Dinh - [@DeathA2](https://www.facebook.com/DeathA2/) - lance.dinh.goldenowl@gmail.com

Project Link: [https://github.com/dustin-goldenowl/safebump](https://github.com/dustin-goldenowl/safebump)


<!-- Acknowledgments -->
## :gem: Acknowledgements
In SafeBump project, I used some useful resources and libraries to aid the development process.

 - [Desgin Figma](https://www.figma.com/file/2sMOWSroKFDsthE6Nn10ov/Job-Finder-Ui-App-Kit-(Community)?type=design&node-id=0%3A1&mode=design&t=yOVRg0VfUB2TVE5I-1)
 - [Firebase and related packages](https://firebase.google.com/)
 - [Flutter Bloc](https://pub.dev/packages/flutter_bloc)
 - [Auto Route](https://pub.dev/packages/auto_route)
 - [GetIt](https://pub.dev/packages/get_it)
 - [Flutter SVG](https://pub.dev/packages/flutter_svg)
 - [Shared Preferences](https://pub.dev/packages/shared_preferences)
 - [Drift](https://pub.dev/packages/drift)
