# **1. A case study:**
## 1.1. System name: ***BookZ***

  - The "BookZ" system is a non-profit online library project of free ebook, developed and designed to allow users to upload their books, download books, rating books and request books from the website. Project BookZ recommends user to buy copyright books to support authors and publishers.
## 1.3. Who will use this system?

   - Project BookZ's target audiance is every Vietnamese who interested in book and wanted to share their books to other users who use this website. Website have books from all category for self-studying, entertaining, motivation,...; provide all the neccessary material for any readers that seeking for knowledge for free. 
## 1.4 Features our system can do
   ### Both administrator and user:
 
   - Login/Register: Login or register to gain fully access of our website's function.

   - Upload: After login, use this function to upload your book to the website from computer.

   - Download: After login, use this function to download books (File PDF or EPUB) from the website to your computer.

   - Show infomation of book in detail: each book has detailed information on a page. Including title, description, language, category, rating,...

   - Search title, author: Use the search bar to search for the infomation about the book that you want to read.

   - Show top book: show the top book of the website by number of download.

   - Show new book: show books that was most recently added to the website.

   - Show random book: show books that is random for each day.
   
   - Show book by category: show books that is classified by category.

   - Show top user: show the top user who upload and rating the most.
   
   - Rating books: After login, use this function to rate and evaluate book uploaded to our website to express that book is a good or bad to read.

   - View downloaded/uploaded book: After login, use this function to show downloaded/uploaded book
   - View rating: After login, use this function to show your rating.
   ### Administrator:
   - Delete/update book: administrator can delete or update information of the book.
  
   - Delete user: administrator can delete user.
  
   - Approve/denied book: administrator can view upload book, approve or denied book.
   
   - View report: administrator can view report book
   ### User:
   -  report book: user can report book if it's inappropriate
# 2. Wireframe or Screenshots of the system
## 2.1 GUI of website
### homepage for admin (user will have a little different icon up right)
![](doc/img/web1.png)

### Login/Register UI
![](doc/img/web5.png)
### Show all book with different category. Sorted by most download or recently added
![](doc/img/web2.png)
### Show specific information of a book
![](doc/img/web3.png)
### Page for uploading book
![](doc/img/web4.png)
### Profile infomation
![](doc/img/web6.png)

### User book downloaded
![](doc/img/web7.png)
### User book uploaded
![](doc/img/web8.png)
### User rating
![](doc/img/web9.png)

### Change password
![](doc/img/web10.png)


### (only admin) Book Management
![](doc/img/web11.png)
### (only admin) User Management
![](doc/img/web12.png)
### (only admin) Book report
![](doc/img/web13.png)
## 2.2 Sitemap
### sitemap for user:
![](doc/img/sitemap_user.png)
### sitemap for administrator:
![](doc/img/sitemap_admin.png)
# 3. Database design
   - Entity–relationship model (ERD) of Database
![](doc/img/ERD.png)
   - Physical design
![](doc/img/Schema2.png)
# 4. System design
## All technologies we use:
- Frontend: HTML, CSS, Javascript, Library Bootstrap
- Backend: Java web application with Tomcat 
- Database: Microsoft SQL Server
## All jsp/html
![](doc/img/1a.png)
## All DAO/DTO/Controllers
![](doc/img/1b.png)
## Specific code in DAO
![](doc/img/1.png)
## Specific code in Controller
![](doc/img/2.png)
# 5. Conclusion and Discussion:

   - Today's web development require a good page design. A bad design will lead to the lost of visitors which can also lead to the loss of business. In general, an Ebook page has to sastisfy the basic elements of a good page design. This include color contrast, text organization, font selection, style of page, page size, graphics used, and consistency. In order to create a well designed page for audiences, the developer need to organize and analyze the user's statistic and the background of the users. The better the page design, the more hits a page will get, that implies an increase in accessibility and a possible increase in business.

   - Thanks to our lecturer for helping, our team has access to a practical project. As our first approach to the backend, we had obstacles such as lack of knowledge in design features (uploading images, file epub/pdf to database), poor initial database design leading to time consuming and effort to edit. In addition, using github sometimes leads to conflicts that cause system errors. Thanks to that, during the development process, we have drawn our own experiences to improve for the next projects.

## **Pros:**

### 1. WEBSITE WORK WELL:
   From proposed case study, our team has discussed, made a clear requirement and solution for each of features. Therefore leading to easy to implementation, good performance. All core features like download/upload, login/register, search,... are working well. 

### 2. GOOD DESIGN DATABASE:
   Base on relational database, our database is well designed. We use correct data types for each attribute, normalze or denormalize according to context of system design, making good use of views and indexes.

### 3. GOOD FRONT END DESIGN: 
   Due to draft from beginning, design of our website is good looking. In addition, because bootstrap library is used, the responsiveness for smartphone/tablet is effective.
### 4. PAGINATION:
   Except comment in detail book, all other page have pagination

## **Cons:**
### 1. NO FILTER/COOKIES:
   Our website doesn't have filter, lead to potential system security errors. Also we don't have cookies, so every time user access website, they have to login again.

### 2. SOME FUNCTION HAVE NOT DEVELOPED
   Some function like report rating, view other profile, search user,... haven't programmed yet.
### 3. NO CLEAR ARCHITECTURE IN CODING
   Because our team hadn't convention in the beginning, code style of each member in team is different. So our code has no clear architecture, no design pattern, sloppy writing; very hard to read, understand, and develop new features.


