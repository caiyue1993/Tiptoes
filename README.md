## Description :leaves:

A subclass of UINavigationController that will make the navigating process more silent and simple.

## Why You'd Want This 

If you are tired of using system's own navigation controller and are seeking something different, Tiptoes may suit your needs. And it doesn't break any of your existing code. Just plug and enjoy.

## Customization 

Actually you can customize transition effect yourself.
However,the default transition effect of Tiptoes is fade-in-and-out:

![](https://i.loli.net/2017/09/26/59c9ce172882d.gif)

## Usage

In the place of your setting navigationController's rootViewController code(normally in AppDelegate.swift):
```
UINavigationController(rootViewController:xxx)
```
Replace with:
```
TiptoesNavController(rootViewController:xxx)
```
And then just enjoy it!

## License

MIT


