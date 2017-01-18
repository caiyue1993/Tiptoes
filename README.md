# Tiptoes
![iOS](https://img.shields.io/badge/iOS-8.0%2B-blue.svg) 
![Swift](https://img.shields.io/badge/%20in-swift%203.0-orange.svg) 
![BLOG](https://img.shields.io/badge/blog-http%3A%2F%2Fsoledad.me-lightgrey.svg) 

# Description 🍃
Forget about the appearance of system's own navigation component, create a new one that you really care for. **Tiptoes** is a subclass of UINavigationController that will make the navigating process more silent and delicate. 

# Customization 
You can do lots of customization yourself.
For example:

- Transition effect. The default effect of Tiptoes is fade-in-and-out. And since we can get the animation parameters, we can create more lovely one.

Fade-in-and-out:
(The flash in the bottom is due to gif)

<img src="https://github.com/caiyue1993/Tiptoes/blob/master/images/fade-in-and-out.gif" width="260">

- Everything that related to a UIView. 

# Usage
1. Drag the TiptoesNavController.swift to your project.
2. In the place of your setting navigationController's rootViewController code(normally in AppDelegate.swift), replace ```UINavigationController(rootViewController:xxx)```with```TiptoesNavController(rootViewController:xxx)```
3. Enjoy!

# Demo
Git clone or directly download this repository. Then open ```Tiptoes.xcodeproj```. Run project.

# Author
[@CaiYue\_](http://weibo.com/caiyue233) made this with ❤️. Inspired by Unread APP.

# Contribute
As you can see, Tiptoes provide a thinking to customize navigation bar. But it is not perfect due to the limitation of author's time and energy. So I open up this repo to GitHub and I am looking forward that you guys can join me and make this repository more splendid.

# License
MIT


