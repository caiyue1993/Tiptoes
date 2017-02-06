
![Tiptoes](https://github.com/caiyue1993/Tiptoes/blob/master/images/tiptoes-cover.png)

## Description
A subclass of UINavigationController that will make the navigating process more silent and simple.

## Why You'd Want This 

If you are tired of using system's own navigation controller and are seeking something different,Tiptoes may suit your needs.

## Transition Effect Customization 

Actually you can customize transition effect yourself.
However,the default transition effect of Tiptoes is fade-in-and-out:

<img src="https://github.com/caiyue1993/Tiptoes/blob/master/images/fade-in-and-out.gif" width="260">

## Usage

In the place of your setting navigationController's rootViewController code(normally in AppDelegate.swift):
```
UINavigationController(rootViewController:xxx)
```
Replace with:
```
TiptoesNavController(rootViewController:xxx)
```

## Author

[@CaiYue\_](http://weibo.com/caiyue233) made this with ❤️. Inspired by Unread APP.

## Contribute

As you can see, Tiptoes provide a thinking to customize navigation bar. But it is not perfect due to the limitation of author's time and energy. So I open up this repo to GitHub and I am looking forward that you guys can join me and make this repository more splendid.

## License

MIT


