<br>

<center>![Banner](Resources/logo.png)</center>

<br>

#MacActivityIndicator

Create Mac OS activity spinners with the user interaction, design and animation of the iOS UIActivityIndicatorView. Completely configurable through quick understandable code. With access to the source, you are able to add more custom features if you want. If their are any tweaks that you feel should be enabled then send me over a PR and I will have a look. **Swift 3 Ready**

<center>![Banner](Resources/spinner.gif)</center>

##Setup

Nothing complicated, download the MacActivityView.swift file and add it to your project.

<br>

##Sample Code

```
let toggle: MacActivityIndicator = {
	let view = MacActivityIndicator()
	view.direction = .anticlockwise
	view.speed = 0.8
	view.image = NSImage(named: "loader")
	return view
}()
```
To Start the loader, simply call: ```loader.startAnimating()```, and to stop ```loader.stopAnimating()```

There are a few settings you can play with, have fun and create the designs that you require for your Mac OS developments. Here are a couple of designs, for ideas:

**(There are a couple of spinners added in the resources folder for you to try out)**

<br>

<center>![Banner](Resources/spinner-1.png)</center>

<br>

<center>![Banner](Resources/spinner-2.png)</center>

<br>

<center>![Banner](Resources/spinner-3.png)</center>

<br>

## Support

If you have any issues with the MacToggle, the shoot me an email <a href="mailto:rich@richappz.com?Subject=MacToggle%20Support" target="_top">rich@richappz.com</a>. If you have any additions to MacToggle then shoot me over a pull request and I will have a look.

## Todo

- Dragging on the toggle.
- Label support.

<br>

# License

***Available Under the MIT License***

>Copyright (c) 2016-2017 Rich Abery
>                    
>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
                    
>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
                    
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.