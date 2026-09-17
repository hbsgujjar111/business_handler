name: Deploy Web to GitHub Pages

on:
push:
branches:
- main # Runs whenever you push code to the main branch
workflow_dispatch: # Allows manual trigger from GitHub UI

permissions:
contents: write # Needed to create and push to gh-pages branch

jobs:
build-and-deploy:
runs-on: ubuntu-latest

steps:
- name: Checkout Source Code
uses: actions/checkout@v4

- name: Set up Flutter
uses: subosito/flutter-action@v2
with:
flutter-version: '3.44.0'
channel: 'stable'
cache: true

- name: Get Dependencies
run: flutter pub get

- name: Build Web App
run: |
flutter build web --release --base-href "/" --no-wasm-dry-run \
--dart-define=SUPABASE_URL=${{ secrets.SUPABASE_URL }} \
--dart-define=SUPABASE_PUBLISHABLE_KEY=${{ secrets.SUPABASE_PUBLISHABLE_KEY }}

- name: Deploy to GitHub Pages Branch
uses: peaceiris/actions-gh-pages@v4
with:
github_token: ${{ secrets.GITHUB_TOKEN }}
publish_dir: ./build/web
publish_branch: gh-pages