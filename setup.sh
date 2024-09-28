#!/bin/bash

# Prompt for project name
read -p "Enter your project name: " project_name

# Prompt for Clerk keys
read -p "Enter your Clerk Publishable Key: " clerk_publishable_key
read -p "Enter your Clerk Secret Key: " clerk_secret_key

# Prompt for Convex URL
read -p "Enter your Convex Deployment URL: " convex_url

# Update project name in package.json
sed -i '' "s/\"name\": \".*\"/\"name\": \"$project_name\"/" package.json

# Create .env.local file
echo "NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=$clerk_publishable_key" > .env.local
echo "CLERK_SECRET_KEY=$clerk_secret_key" >> .env.local
echo "NEXT_PUBLIC_CONVEX_URL=$convex_url" >> .env.local

# Install dependencies
npm install

# Initialize Convex
npx convex init

echo "Setup complete! Your project is ready to go."