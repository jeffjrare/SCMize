var mime_samples = [
  { 'mime': 'application/javascript', 'samples': [
    { 'url': 'http://pos.local/javascripts/application/jquery-ui.min.js', 'dir': '_m0/0', 'linked': 2, 'len': 200000 },
    { 'url': 'http://pos.local/javascripts/application/jquery.min.js', 'dir': '_m0/1', 'linked': 2, 'len': 94020 },
    { 'url': 'http://pos.local/javascripts/application/jquery.wysiwyg.js', 'dir': '_m0/2', 'linked': 2, 'len': 64571 } ]
  },
  { 'mime': 'application/xhtml+xml', 'samples': [
    { 'url': 'http://pos.local/', 'dir': '_m1/0', 'linked': 2, 'len': 5456 },
    { 'url': 'http://pos.local/signup', 'dir': '_m1/1', 'linked': 2, 'len': 6960 },
    { 'url': 'http://pos.local/overview', 'dir': '_m1/2', 'linked': 2, 'len': 5181 },
    { 'url': 'http://pos.local/__sinatra__/', 'dir': '_m1/3', 'linked': 2, 'len': 3715 },
    { 'url': 'http://pos.local/account', 'dir': '_m1/4', 'linked': 2, 'len': 143444 },
    { 'url': 'http://pos.local/login', 'dir': '_m1/5', 'linked': 2, 'len': 195689 },
    { 'url': 'http://pos.local/products', 'dir': '_m1/6', 'linked': 2, 'len': 199328 },
    { 'url': 'http://pos.local/signup', 'dir': '_m1/7', 'linked': 2, 'len': 110324 },
    { 'url': 'http://pos.local/texts/add', 'dir': '_m1/8', 'linked': 2, 'len': 179209 } ]
  },
  { 'mime': 'image/png', 'samples': [
    { 'url': 'http://pos.local/__sinatra__/500.png', 'dir': '_m2/0', 'linked': 2, 'len': 31056 } ]
  },
  { 'mime': 'text/css', 'samples': [
    { 'url': 'http://pos.local/stylesheets/application/bootstrap.css', 'dir': '_m3/0', 'linked': 2, 'len': 56326 },
    { 'url': 'http://pos.local/stylesheets/application/jquery.wysiwyg.css', 'dir': '_m3/1', 'linked': 2, 'len': 6984 },
    { 'url': 'http://pos.local/stylesheets/application/screen.css', 'dir': '_m3/2', 'linked': 2, 'len': 5623 } ]
  },
  { 'mime': 'text/plain', 'samples': [
    { 'url': 'http://pos.local/javascripts/application/bootstrap-alerts.js', 'dir': '_m4/0', 'linked': 2, 'len': 3121 },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-buttons.js', 'dir': '_m4/1', 'linked': 2, 'len': 1744 },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-modal.js', 'dir': '_m4/2', 'linked': 2, 'len': 6424 },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-popover.js', 'dir': '_m4/3', 'linked': 2, 'len': 2734 },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-tabs.js', 'dir': '_m4/4', 'linked': 2, 'len': 2166 },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-twipsy.js', 'dir': '_m4/5', 'linked': 2, 'len': 8233 },
    { 'url': 'http://pos.local/javascripts/application/screen.js', 'dir': '_m4/6', 'linked': 2, 'len': 3776 } ]
  }
];

var issue_samples = [
  { 'severity': 3, 'type': 40601, 'samples': [
    { 'url': 'http://pos.local/', 'extra': 'implicitly cacheable \x27Set-Cookie\x27 response', 'dir': '_i0/0' } ]
  },
  { 'severity': 3, 'type': 40304, 'samples': [
    { 'url': 'http://pos.local/javascripts/application/bootstrap-alerts.js', 'extra': '', 'dir': '_i1/0' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-alerts.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000055v105208\x3e', 'extra': '', 'dir': '_i1/1' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-buttons.js', 'extra': '', 'dir': '_i1/2' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-buttons.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000035v105208\x3e', 'extra': '', 'dir': '_i1/3' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-modal.js', 'extra': '', 'dir': '_i1/4' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-modal.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000039v105208\x3e', 'extra': '', 'dir': '_i1/5' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-popover.js', 'extra': '', 'dir': '_i1/6' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-popover.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000053v105208\x3e', 'extra': '', 'dir': '_i1/7' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-tabs.js', 'extra': '', 'dir': '_i1/8' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-tabs.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000031v105208\x3e', 'extra': '', 'dir': '_i1/9' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-twipsy.js', 'extra': '', 'dir': '_i1/10' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-twipsy.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000051v105208\x3e', 'extra': '', 'dir': '_i1/11' },
    { 'url': 'http://pos.local/javascripts/application/screen.js', 'extra': '', 'dir': '_i1/12' },
    { 'url': 'http://pos.local/javascripts/application/screen.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000033v105208\x3e', 'extra': '', 'dir': '_i1/13' } ]
  },
  { 'severity': 3, 'type': 40301, 'samples': [
    { 'url': 'http://pos.local/javascripts/application/bootstrap-alerts.js', 'extra': 'text/plain', 'dir': '_i2/0' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-alerts.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000055v105208\x3e', 'extra': 'text/plain', 'dir': '_i2/1' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-buttons.js', 'extra': 'text/plain', 'dir': '_i2/2' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-buttons.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000035v105208\x3e', 'extra': 'text/plain', 'dir': '_i2/3' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-modal.js', 'extra': 'text/plain', 'dir': '_i2/4' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-modal.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000039v105208\x3e', 'extra': 'text/plain', 'dir': '_i2/5' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-popover.js', 'extra': 'text/plain', 'dir': '_i2/6' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-popover.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000053v105208\x3e', 'extra': 'text/plain', 'dir': '_i2/7' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-tabs.js', 'extra': 'text/plain', 'dir': '_i2/8' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-tabs.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000031v105208\x3e', 'extra': 'text/plain', 'dir': '_i2/9' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-twipsy.js', 'extra': 'text/plain', 'dir': '_i2/10' },
    { 'url': 'http://pos.local/javascripts/application/bootstrap-twipsy.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000051v105208\x3e', 'extra': 'text/plain', 'dir': '_i2/11' },
    { 'url': 'http://pos.local/javascripts/application/screen.js', 'extra': 'text/plain', 'dir': '_i2/12' },
    { 'url': 'http://pos.local/javascripts/application/screen.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000033v105208\x3e', 'extra': 'text/plain', 'dir': '_i2/13' } ]
  },
  { 'severity': 3, 'type': 40201, 'samples': [
    { 'url': 'http://pos.local/', 'extra': 'http://html5shim.googlecode.com/svn/trunk/html5.js', 'dir': '_i3/0' },
    { 'url': 'http://pos.local/__sinatra__/', 'extra': 'http://html5shim.googlecode.com/svn/trunk/html5.js', 'dir': '_i3/1' },
    { 'url': 'http://pos.local/javascripts/', 'extra': 'http://html5shim.googlecode.com/svn/trunk/html5.js', 'dir': '_i3/2' },
    { 'url': 'http://pos.local/overview', 'extra': 'http://html5shim.googlecode.com/svn/trunk/html5.js', 'dir': '_i3/3' },
    { 'url': 'http://pos.local/signup', 'extra': 'http://html5shim.googlecode.com/svn/trunk/html5.js', 'dir': '_i3/4' },
    { 'url': 'http://pos.local/texts/', 'extra': 'http://html5shim.googlecode.com/svn/trunk/html5.js', 'dir': '_i3/5' } ]
  },
  { 'severity': 2, 'type': 30601, 'samples': [
    { 'url': 'http://pos.local/texts/add', 'extra': '', 'dir': '_i4/0' } ]
  },
  { 'severity': 0, 'type': 10803, 'samples': [
    { 'url': 'http://pos.local/javascripts/application/jquery-ui.min.js', 'extra': '', 'dir': '_i5/0' },
    { 'url': 'http://pos.local/javascripts/application/jquery-ui.min.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000049v105208\x3e', 'extra': '', 'dir': '_i5/1' },
    { 'url': 'http://pos.local/javascripts/application/jquery.min.js', 'extra': '', 'dir': '_i5/2' },
    { 'url': 'http://pos.local/javascripts/application/jquery.min.js?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000045v105208\x3e', 'extra': '', 'dir': '_i5/3' },
    { 'url': 'http://pos.local/stylesheets/application/bootstrap.css', 'extra': '', 'dir': '_i5/4' },
    { 'url': 'http://pos.local/stylesheets/application/bootstrap.css?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000003v105208\x3e', 'extra': '', 'dir': '_i5/5' },
    { 'url': 'http://pos.local/stylesheets/application/jquery.wysiwyg.css', 'extra': '', 'dir': '_i5/6' },
    { 'url': 'http://pos.local/stylesheets/application/jquery.wysiwyg.css?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000001v105208\x3e', 'extra': '', 'dir': '_i5/7' },
    { 'url': 'http://pos.local/stylesheets/application/screen.css', 'extra': '', 'dir': '_i5/8' },
    { 'url': 'http://pos.local/stylesheets/application/screen.css?.htaccess.aspx--\x3e\x22\x3e\x27\x3e\x27\x22\x3csfi000005v105208\x3e', 'extra': '', 'dir': '_i5/9' } ]
  },
  { 'severity': 0, 'type': 10602, 'samples': [
    { 'url': 'http://pos.local/login', 'extra': '', 'dir': '_i6/0' },
    { 'url': 'http://pos.local/login', 'extra': '', 'dir': '_i6/1' },
    { 'url': 'http://pos.local/login', 'extra': '', 'dir': '_i6/2' },
    { 'url': 'http://pos.local/login', 'extra': '', 'dir': '_i6/3' } ]
  },
  { 'severity': 0, 'type': 10505, 'samples': [
    { 'url': 'http://pos.local/signup', 'extra': 'account[identifier]', 'dir': '_i7/0' },
    { 'url': 'http://pos.local/overview', 'extra': 'text[title]', 'dir': '_i7/1' },
    { 'url': 'http://pos.local/overview', 'extra': 'text[tags]', 'dir': '_i7/2' } ]
  },
  { 'severity': 0, 'type': 10403, 'samples': [
    { 'url': 'http://pos.local/account', 'extra': '', 'dir': '_i8/0' },
    { 'url': 'http://pos.local/login', 'extra': '', 'dir': '_i8/1' },
    { 'url': 'http://pos.local/login', 'extra': '', 'dir': '_i8/2' },
    { 'url': 'http://pos.local/products', 'extra': '', 'dir': '_i8/3' },
    { 'url': 'http://pos.local/signup', 'extra': '', 'dir': '_i8/4' },
    { 'url': 'http://pos.local/texts/add', 'extra': '', 'dir': '_i8/5' } ]
  },
  { 'severity': 0, 'type': 10401, 'samples': [
    { 'url': 'http://pos.local/account', 'extra': '', 'dir': '_i9/0' },
    { 'url': 'http://pos.local/login', 'extra': '', 'dir': '_i9/1' },
    { 'url': 'http://pos.local/products', 'extra': '', 'dir': '_i9/2' },
    { 'url': 'http://pos.local/signup', 'extra': '', 'dir': '_i9/3' },
    { 'url': 'http://pos.local/texts/add', 'extra': '', 'dir': '_i9/4' } ]
  },
  { 'severity': 0, 'type': 10205, 'samples': [
    { 'url': 'http://pos.local/sfi9876', 'extra': '', 'dir': '_i10/0' } ]
  },
  { 'severity': 0, 'type': 10204, 'samples': [
    { 'url': 'http://pos.local/', 'extra': 'X-Powered-By', 'dir': '_i11/0' },
    { 'url': 'http://pos.local/', 'extra': 'X-Frame-Options', 'dir': '_i11/1' },
    { 'url': 'http://pos.local/', 'extra': 'X-XSS-Protection', 'dir': '_i11/2' },
    { 'url': 'http://pos.local/__sinatra__/', 'extra': 'X-Cascade', 'dir': '_i11/3' },
    { 'url': 'http://pos.local/javascripts/', 'extra': 'X-Cascade', 'dir': '_i11/4' },
    { 'url': 'http://pos.local/texts/', 'extra': 'X-Cascade', 'dir': '_i11/5' } ]
  },
  { 'severity': 0, 'type': 10202, 'samples': [
    { 'url': 'http://pos.local/', 'extra': 'Apache/2.2.17 (Ubuntu)', 'dir': '_i12/0' } ]
  },
  { 'severity': 0, 'type': 10201, 'samples': [
    { 'url': 'http://pos.local/', 'extra': 'rack.session', 'dir': '_i13/0' } ]
  }
];

