# Student Social Platform Onboarding

## Overview
A multi-step onboarding system built using Flask, HTML, CSS and JavaScript.

## Features
- Multi-step form
- Form validation
- Progress tracking
- Local storage persistence
- Dynamic profile review page
- Print/Download profile option

## Technologies Used
- Python
- Flask
- HTML
- CSS
- JavaScript

## Database Design
The database contains:
- Users
- Posts
- Comments
- Likes
- Marketplace Items

## Marketplace Integration Decision
Marketplace items are linked to users through seller_id. This allows any existing user account to become a seller without creating a separate seller table, making future marketplace integration simpler and more scalable.
