# Timbu Shop App - Mobile Track Stage Four Task

## Overview
This project involves enhancing the Timbu Shop App by adding and completing various features to ensure a seamless shopping experience. The main objectives were to implement product management, a smooth checkout process, and an order history screen, along with addressing all noticeable issues.

## Features Implemented

### Product Management
- **Fetching Products from Timbu API:**
  - Integrated the Timbu API to fetch all products, ensuring no placeholders are used.
  - Displayed at least 20 unique products, categorized appropriately.

- **Cart Functionality:**
  - Implemented features to add and remove products from the cart.
  - Added a wishlist/bookmark feature for users to save products for later.

- **Product Persistence:**
  - Ensured products remain in the cart after closing and reopening the app by saving the cart items in a local database using Hive.

### Checkout and Payment Flow
- **Order Checkout:**
  - Created a smooth checkout process that includes simulating payment flow and order confirmation.

### Order History
- **Order History Screen:**
  - Developed an order history screen that displays all completed orders.
  - Added a navigation icon on the home screen top bar to access the order history screen.
  - Clicking on an order in the history screen navigates to a detailed view of that order.
  - Cached order history items and details in a local database using Hive.

### User Interface and Experience
- **Intuitive UI:**
  - Ensured the application has a user-friendly and intuitive interface with clear labeling and spacing.
  - Addressed all noticeable UI issues, such as the app not supporting landscape mode and making the discount field visible.

### State Management and Error Handling
- **UI State Management:**
  - Utilized appropriate state management techniques to ensure a smooth and responsive user experience.
  - Implemented error handling to manage potential issues gracefully.

## Fixes and Improvements
- **Landscape Mode Support:**
  - Added support for landscape mode to enhance user experience.

- **Cart Persistence:**
  - Ensured products remain in the cart after closing and reopening the app by saving cart items using Hive.

- **Discount Field Visibility:**
  - Made the discount field visible and functional.

## Dependencies
- **Necessary Third-party Packages:**
  - Used only necessary third-party packages to keep the app lightweight and efficient.

## Testing and Quality Assurance
- **QA Testing:**
  - Collaborated with a QA tester to ensure all features work as expected and to identify any remaining issues.
  - Submitted QA test cases result sheet.

## Setup Instructions

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/timbu-shop.git
   cd timbu-shop
